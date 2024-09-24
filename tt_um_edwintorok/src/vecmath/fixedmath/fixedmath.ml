open Hardcaml
open Hardcaml_circuits
open Hardcaml_fixed_point
module F = Signed (Signal)

let clk = ref Signal.empty

let rst_n = ref Signal.empty

type bool' = Signal.t [@@deriving sexp_of]

let of_bool = Signal.of_bool

let ( !: ) = Signal.( ~: )

type int' = Signal.t [@@deriving sexp_of]

type uint' = Signal.t [@@deriving sexp_of]

let of_int n =
  let width = 1 + Signal.num_bits_to_represent (if n < 0 then -n - 1 else n) in
  if width > 16 then
    invalid_arg
      (Printf.sprintf "integer signal exceeds mediump range: %d (%u bits)" n
         width ) ;
  Signal.of_int ~width n

let of_uint ui =
  if ui < 0 then
    invalid_arg (Printf.sprintf "of_uint argument must be >=0, got: %d" ui) ;
  let width = Signal.num_bits_to_represent ui in
  if width > 16 then
    invalid_arg
      (Printf.sprintf "integer signal exceeds mediump range: %d (%u bits)" ui
         width ) ;
  Signal.of_int ~width ui

type ('a, 'b) vec = {rect: 'a; polar: 'b; scope: Scope.t} [@@deriving sexp_of]

type float' = (F.t, F.t) vec [@@deriving sexp_of]

(* 10, but multiplication needs twice?
    this is probably where circuit floating point would help, we'd preserve more precision
   with the exponent
*)
let mediump_precision = 9

let mediump f =
  let f = Float.ldexp f mediump_precision |> Float.round in
  Float.ldexp f (-mediump_precision)

let mux2 cond ~t ~f = F.mux cond [f; t]

let is_negative t = t |> F.int |> Signal.msb

let abs_float' x = mux2 (is_negative x) ~t:(F.map ~f:Signal.negate x) ~f:x

let float' scope rect = {rect; polar= abs_float' rect; scope}

let const f =
  (* round to mediump *)
  let significant, exponent = f |> mediump |> Float.frexp in
  if abs exponent > 14 then
    invalid_arg
      (Printf.sprintf "Floating point constant out of mediump range: %g" f) ;
  let full =
    F.scale_pow2 (F.of_float 1 mediump_precision significant) exponent
  in
  (* drop trailing zeros *)
  let frac_width =
    if F.width_frac full = 0 then 0
    else
      let frac_bits =
        full |> F.frac |> Signal.to_constant |> Bits.of_constant
      in
      Bits.width frac_bits - (frac_bits |> Bits.trailing_zeros |> Bits.to_int)
  in
  F.resize full (F.width_int full) frac_width

let of_float scope f = f |> const |> float' scope

let to_float_opt t =
  let s = t.rect |> F.signal in
  if Signal.Type.is_const s then Some (F.to_float t.rect) else None

let to_01 ~width t = F.resize t.rect (F.width_int t.rect) width |> F.frac

let of_uint_signal scope s = s |> Signal.ue |> F.create 0 |> float' scope

(* convert int to float by using 0 fractional bits *)
let float_of_int scope s = F.create 0 s |> float' scope

(* extend s with a 0 sign bit, then convert with 0 fractional bits *)
let float_of_uint scope s = s |> Signal.ue |> F.create 0 |> float' scope

let cmp op (a : float') (b : float') = op a.rect b.rect

let ( <: ) = cmp F.( <: )

let ( <=: ) = cmp F.( <=: )

let ( >=: ) = cmp F.( >=: )

let ( >: ) = cmp F.( >: )

module Scalar = struct
  type 'a t = {x: 'a} [@@deriving sexp_of, hardcaml]
end

module Conv = struct
  type 'a t = 'a [@@deriving sexp_of]

  let t_of_repr i = i.Scalar.x

  let repr_of_t x = Scalar.{x}
end

module T = struct
  module Rect = Interface.Make_interface_with_conversion (Scalar) (Conv)

  module Polar = struct
    include Rect

    let radius = Fun.id

    let with_radius _t r = r
  end

  let rect_to_polar _ = abs_float'

  let polar_to_rect _ = Fun.id

  let min x y = mux2 F.(y <: x) ~t:y ~f:x

  let max x y = mux2 F.(x <: y) ~t:y ~f:x

  let clamp x minv maxv =
    let minv = const minv and maxv = const maxv in
    min (max x minv) maxv
end

module type Vec = sig
  module Rect : Interface.S

  module Polar : sig
    include Interface.S

    val radius : 'a t -> 'a

    val with_radius : 'a t -> 'a -> 'a t
  end

  val rect_to_polar : Scope.t -> F.t Rect.t -> F.t Polar.t

  val polar_to_rect : Scope.t -> F.t Polar.t -> F.t Rect.t
end

module MakeVec (V : Vec) = struct
  include V

  (* we compute values directly here,
     const and other optimizations belong in optimizedmath.ml instead!

     The only optimization implemented here is to avoid recomputing the polar coords,
     when already known (e.g. the result of a normalization)
  *)

  type t = (F.t Rect.t, F.t Polar.t) vec [@@deriving sexp_of]

  let of_rect scope rect =
    let polar = rect_to_polar scope rect in
    {rect; polar; scope}

  let of_polar scope polar =
    let rect = polar_to_rect scope polar in
    {rect; polar; scope}

  let ( -- ) t name =
    let scope = Scope.sub_scope t.scope name in
    let ( -- ) t name = F.map ~f:(fun s -> Scope.naming scope s name) t in
    let rect = Rect.map2 t.rect Rect.port_names ~f:( -- )
    and polar = Polar.map2 t.polar Polar.port_names ~f:( -- ) in
    {rect; polar; scope}

  let pipeline reg t n =
    let f s = Signal.pipeline reg s ~n in
    let f = F.map ~f in
    let rect = Rect.map t.rect ~f and polar = Polar.map t.polar ~f in
    {rect; polar; scope= t.scope}

  let unary f (t : t) : t = t.rect |> Rect.map ~f |> of_rect t.scope

  let ( ~-: ) = unary (F.map ~f:Signal.negate)

  let ( ==: ) a b =
    Rect.map2 ~f:F.( ==: ) a.rect b.rect
    |> Rect.to_list
    |> Signal.reduce ~f:Signal.( &&: )

  let ( <>: ) a b = !:(a ==: b)

  let resize'' t =
    let max_frac_width =
      (* !! which ops need this ? **)
      1 + (2 * mediump_precision) - F.width_int t |> Int.max 0
    in
    if F.width_frac t > max_frac_width then
      (* Printf.eprintf "%d: %d -> %d\n" (F.width_int t) (F.width_frac t)
           max_frac_width ;
         Printexc.get_callstack 100 |> Printexc.raw_backtrace_to_string
         |> prerr_endline ;*)
      F.resize t (F.width_int t) max_frac_width
    else t

  let resize' t =
    let max_frac_width =
      (* !! which ops ned this? **)
      1 + mediump_precision - F.width_int t |> Int.max 0
    in
    if F.width_frac t > max_frac_width then
      (* Printf.eprintf "%d: %d -> %d\n" (F.width_int t) (F.width_frac t)
           max_frac_width ;
         Printexc.get_callstack 100 |> Printexc.raw_backtrace_to_string
         |> prerr_endline ;*)
      F.resize t (F.width_int t) max_frac_width
    else t

  let binop res op (a : t) (b : t) : t =
    let op a b = op a b |> res in
    Rect.map2 ~f:op a.rect b.rect |> of_rect a.scope

  let ( +: ) = binop resize'' F.( +: )

  let ( -: ) = binop resize' F.( -: )

  let ( *: ) = binop resize' F.( *: )

  (* opt: doesn't change polar, just length *)
  let ( *:@ ) t s =
    Rect.map ~f:(fun x -> F.(x *: s.rect)) t.rect |> of_rect t.scope

  let ( *:. ) t s =
    let significant, exponent = Float.frexp s in
    (*Printf.eprintf "*:. %f, %d\n" significant exponent ;*)
    let exponent = exponent - 1 in
    if significant = 0.5 then
      (*Printf.eprintf "scale: %d\n" exponent ;*)
      let f x =
        (*        Printf.eprintf "(%d.%d)\n" F.(width_int x) F.(width_frac x) ;*)
        F.scale_pow2 x exponent |> resize'
      in
      Rect.map ~f t.rect |> of_rect t.scope
    else t *:@ of_float t.scope s

  let ( /:. ) t f = t *:. (1. /. f)

  let mux2 cond ~t ~f =
    let op t f = mux2 cond ~t ~f |> resize' in
    let rect = Rect.map2 ~f:op t.rect f.rect in
    let polar = Polar.map2 ~f:op t.polar f.polar in
    {rect; polar; scope= t.scope}

  let abs = unary abs_float'

  let min = binop resize' T.min

  let max = binop resize' T.max

  let clamp t minv maxv = unary (fun x -> T.clamp x minv maxv) t

  let length t = Polar.radius t.polar |> float' t.scope

  let distance p0 p1 = length (p0 -: p1)

  let sum t =
    match Rect.to_list t.rect with
    | [] ->
        assert false
    | hd :: tl ->
        List.fold_left F.( +: ) hd tl |> resize' |> float' t.scope

  let dot x y = x *: y |> sum

  let one = F.create 0 Signal.(of_int ~width:2 1)

  let normalize t = Polar.(with_radius t.polar one) |> of_polar t.scope

  let reflect i n = i -: (n *:@ dot n i *:. 2.)
end

include MakeVec (T)

module FSpec = struct
  let sign_bit = 1 (* fixed *)

  let int_width = 2 (* 2*pi needs 3 bits, truncated here *)

  let precision = 8 (* 512 unique pixels *)

  let overflow = 1
  (* 1 extra bit to avoid overflow during rotations,
     if we have (a, a) and rotate we might need sqrt(2)*a max, i.e. 1 more bit
  *)

  let width = sign_bit + precision + overflow

  let fractional_width = width - sign_bit - int_width
end

module SF = Cordic_special_functions.Make (FSpec)

module Vec2 = struct
  type kind = Coord | Angle

  module Special (CF : sig
    module Args : Interface.S

    module I : sig
      type 'a t = {clk: 'a; clr: 'a; enable: 'a; ld: 'a; args: 'a Args.t}
    end

    module O : Interface.S

    module Results : Interface.S

    val input : kind Args.t

    val output : kind Results.t

    val create : Cordic.Config.t -> Signal.t I.t -> Signal.t O.t
  end) =
  struct
    (* let norm args =
       let tags, fields = args |> CF.Args.to_alist |> List.split in
       let fields = fields |> F.norm in
       List.combine tags fields |> CF.Args.of_alist*)
    let resize_angle t = F.resize t (1 + FSpec.int_width) FSpec.fractional_width

    let of_fixnum ~coords_frac k s =
      match k with
      | Coord ->
          F.create coords_frac s
      | Angle ->
          F.create FSpec.fractional_width s

    let norm_kind ~f args =
      let tags, kv = List.split args in
      let kinds, v = List.split kv in
      let v = f v in
      let kv = List.combine kinds v in
      List.combine tags kv

    let norm' lst = lst |> F.norm |> List.map resize'

    let norm_kind_width lst =
      lst
      |> List.map
         @@ fun (tag, (kind, t)) ->
         (* +1, because sqrt(a^2+b^2) might overflow otherwise,
          *)
         let t = F.resize t (F.width_int t + 1) (F.width_frac t) in
         (*let t = resize' t in*)

         (* this truncates! FSpec.width would be the more correct version,
                but that yields overall 0.
            int_width yields non-zero, but is it by accident?
            we need to queyr error/etc. from the sim
         *)
         let int_width = F.width_int t |> Int.min FSpec.int_width in
         (tag, (kind, F.resize t int_width (FSpec.width - int_width)))

    let partition_kind =
      List.partition (function _, (Coord, _) -> true | _, (Angle, _) -> false)

    let norm args =
      let open CF in
      let coords, angles =
        args
        |> Args.map2 ~f:(fun x y -> (x, y)) input
        |> Args.to_alist |> partition_kind
      in
      let coords = norm_kind ~f:norm' coords |> norm_kind_width
      and angles = norm_kind ~f:(List.map resize_angle) angles in
      let args = List.concat [coords; angles] in
      let coords_frac =
        match coords with
        | [] ->
            FSpec.fractional_width
        | (_, (_, hd)) :: _ ->
            F.width_frac hd
      in
      (coords_frac, args |> Args.of_alist |> Args.map ~f:snd)

    let create _scope args =
      let open CF in
      (* unused for Combinational *)
      let clk = !clk (* TODO: pass in *)
      and clr = Signal.empty
      and enable = Signal.vdd in
      let width = args |> Args.to_list |> List.hd |> Signal.width in
      let r_sync =
        Reg_spec.create ~clock:clk ()
        |> Reg_spec.override ~clear:!rst_n ~clear_level:Level.Low
      in
      let ld =
        Signal.reg_fb r_sync
          ~width:(Signal.num_bits_to_represent (width - 1))
          ~f:(Signal.mod_counter ~max:((width / 2) - 1))
      in
      let ld = Signal.(ld ==:. 0) in
      let cordic =
        (* ~1 bit per iteration, not including sign *)
        Cordic.Config.
          { architecture= Cordic.Architecture.Iterative
          ; iterations= (width / 2) - 1 }
      in
      create cordic I.{args; clk; clr; ld; enable}
      |> O.Of_signal.pack |> Results.Of_signal.unpack

    let hierarchical ~name scope args =
      let coords_frac, args = norm args in
      (*let args = CF.Args.map ~f:resize_angle args in
        let coords_frac = FSpec.fractional_width in*)
      let args = CF.Args.map ~f:F.signal args in
      (* FIXME: pass in clock then we can reenable *)
      (*let module H = Hierarchy.In_scope (CF.Args) (CF.Results) in
        H.hierarchical ~scope ~name ?instance:None create args*)
      create scope args |> CF.Results.map2 ~f:(of_fixnum ~coords_frac) CF.output
  end

  include MakeVec (struct
    module Rect = SF.Rect_to_polar.Args

    module Polar = struct
      include SF.Rect_to_polar.Results

      let radius t = t.magnitude

      let with_radius t magnitude = {t with magnitude}
    end

    let negate t = F.map ~f:Signal.negate t

    let deg_90 =
      Float.pi /. 2. |> F.of_float (1 + FSpec.int_width) FSpec.fractional_width

    let rect_to_polar scope rect =
      let module S = Special (struct
        include SF.Rect_to_polar

        let input = Args.{x= Coord; y= Coord}

        let output = Results.{magnitude= Coord; phase= Angle}
      end) in
      let open Rect in
      let signs = Signal.concat_msb [is_negative rect.x; is_negative rect.y] in
      let neg_x = negate rect.x and neg_y = negate rect.y in
      let x =
        F.mux signs
          [ rect.x (* no change, x >= 0 *)
          ; rect.x (* no change, x >= 0 *)
          ; rect.y (* x < 0, y >= 0 *)
          ; neg_y (* x < 0, y < 0 *) ]
      and y =
        F.mux signs
          [ rect.y (* no change, x >= 0 *)
          ; rect.y (* no change, x >= 0 *)
          ; neg_x (* x < 0, y >= 0 *)
          ; rect.x (* x < 0, y < 0 *) ]
      in
      let polar = S.hierarchical ~name:"rect_to_polar" scope {x; y} in
      let phase =
        F.mux signs
          [ polar.phase (* no change, x >= 0 *)
          ; polar.phase (* no change, x >= 0 *)
          ; F.(polar.phase +: deg_90) (* x < 0, y >= 0: add 90 *)
          ; F.(polar.phase -: deg_90) (* x < 0, y < 0: sub 90 *) ]
      in
      {polar with phase}

    let polar_to_rect scope Polar.{magnitude; phase} =
      let module S = Special (struct
        include SF.Polar_to_rect

        let input = Args.{magnitude= Coord; phase= Angle}

        let output = Results.{x= Coord; y= Coord}
      end) in
      let open SF.Polar_to_rect in
      (* see https://eclipse.umbc.edu/robucci/cmpeRSD/Lectures/Lecture20__CORDIC/#initialization-step-to-get-angle-within-frac2pi4-from-0 ,
         and "CORDIC Algorithm and its Implementation"
      *)
      let phase_minus = F.(phase -: deg_90)
      and phase_plus = F.(phase +: deg_90)
      and sign = is_negative phase in
      let phase = F.mux sign [phase_minus; phase_plus] in
      let Results.{x; y} =
        S.hierarchical ~name:"polar_to_rect" scope Args.{magnitude; phase}
      in
      let neg_x = negate x and neg_y = negate y in
      let x = F.mux sign [neg_y; y] and y = F.mux sign [x; neg_x] in
      Rect.{x; y}
  end)

  let x (t : t) = t.rect.x |> float' t.scope

  let y (t : t) = t.rect.y |> float' t.scope

  let phase (t : t) = t.polar.phase |> float' t.scope
end

type vec2 = Vec2.t [@@deriving sexp_of]

let vec2 scope x y : vec2 = Vec2.of_rect scope {x= x.rect; y= y.rect}

module Vec3 = struct
  module T = struct
    module Rect = struct
      type 'a t = {x: 'a; y: 'a; z: 'a} [@@deriving sexp_of, hardcaml]
    end

    module Polar = struct
      type 'a t = {r: 'a; theta: 'a; phi: 'a} [@@deriving sexp_of, hardcaml]

      let radius t = t.r

      let with_radius t r = {t with r}
    end

    (* see https://www.ti.com/document-viewer/lit/html/SLYA069 *)
    let rect_to_polar scope (rect : F.t Rect.t) =
      let open Rect in
      let xy = vec2 scope (float' scope rect.x) (float' scope rect.y) in
      let theta = xy.polar.phase in
      let zm =
        vec2 scope (float' scope rect.z) (float' scope xy.polar.magnitude)
      in
      let r = zm.polar.magnitude and phi = zm.polar.phase in
      Polar.{r; theta; phi}

    let polar_to_rect scope polar =
      let open Polar in
      let zm = Vec2.of_polar scope {magnitude= polar.r; phase= polar.phi} in
      let z, magnitude = (zm.rect.x, zm.rect.y) in
      let xy = Vec2.of_polar scope {magnitude; phase= polar.theta} in
      let x, y = (xy.rect.x, xy.rect.y) in
      Rect.{x; y; z}
  end

  include MakeVec (T)

  let x (t : t) = t.rect.x |> float' t.scope

  let y (t : t) = t.rect.y |> float' t.scope

  let z (t : t) = t.rect.z |> float' t.scope
end

type vec3 = Vec3.t [@@deriving sexp_of]

let vec3 scope x y z = Vec3.of_rect scope {x= x.rect; y= y.rect; z= z.rect}
