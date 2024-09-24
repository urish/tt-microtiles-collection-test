open Sexplib.Std

type bool' = bool [@@deriving sexp_of]

type int' = int [@@deriving sexp_of]

type uint' = int [@@deriving sexp_of]

type float' = float [@@deriving sexp_of]

type t = float' [@@deriving sexp_of]

type vec2 = Gg.V2.t

type vec2_tuple = {x: float; y: float} [@@deriving sexp_of]

let sexp_of_vec2 t =
  let x, y = Gg.V2.to_tuple t in
  let t = {x; y} in
  sexp_of_vec2_tuple t

type vec3 = Gg.V3.t

type vec3_tuple = {x: float; y: float; z: float} [@@deriving sexp_of]

let sexp_of_vec3 t =
  let x, y, z = Gg.V3.to_tuple t in
  let t = {x; y; z} in
  sexp_of_vec3_tuple t

let of_bool = Fun.id

let ( !: ) = not

let of_int i =
  if i < -(1 lsl 15) || i > (1 lsl 15) - 1 then
    invalid_arg (Printf.sprintf "%d out of mediump int range" i)
  else i

let%expect_test "int" =
  List.map of_int [0; -(1 lsl 15); (1 lsl 15) - 1] |> List.iter ignore

let%expect_test "int1" =
  Printexc.record_backtrace false ;
  (-1 lsl 15) - 1 |> of_int |> ignore
[@@expect.uncaught_exn
  {| (Invalid_argument "-32769 out of mediump int range") |}]

let%expect_test "int2" =
  Printexc.record_backtrace false ;
  1 lsl 15 |> of_int |> ignore
[@@expect.uncaught_exn
  {| (Invalid_argument "32768 out of mediump int range") |}]

let of_uint i =
  if i < 0 || i > (1 lsl 16) - 1 then
    invalid_arg (Printf.sprintf "%d out of mediump uint range" i)
  else i

let%expect_test "uint" =
  List.map of_uint [0; (1 lsl 16) - 1] |> List.iter ignore

let%expect_test "uint1" =
  Printexc.record_backtrace false ;
  -1 |> of_uint |> ignore
[@@expect.uncaught_exn {| (Invalid_argument "-1 out of mediump uint range") |}]

let%expect_test "uint2" =
  Printexc.record_backtrace false ;
  1 lsl 16 |> of_uint |> ignore
[@@expect.uncaught_exn
  {| (Invalid_argument "65536 out of mediump uint range") |}]

let float_mediump_limit = Float.ldexp 1. 14

let float_mediump_limit' = Float.ldexp 1. ~-14

let of_float _scope f =
  if f <= -.float_mediump_limit || f >= float_mediump_limit then
    invalid_arg (Printf.sprintf "%g out of mediump float range" f) ;
  if f <> 0. && f > -.float_mediump_limit' && f < float_mediump_limit' then
    invalid_arg (Printf.sprintf "%g precision loss, out of mediump range" f) ;
  f

let to_float_opt t = Some t

let%expect_test "of_float" =
  let lim = (2. ** 14.) *. (1. -. (2. ** -10.)) in
  [0.; 2. ** -14.; -.(2. ** -14.); lim; -.lim]
  |> List.map (of_float ())
  |> List.map Float.to_string |> List.iter print_endline ;
  [%expect
    {|
    0.
    6.103515625e-05
    -6.103515625e-05
    16368.
    -16368.
    |}]

let%expect_test "of_float1" =
  Printexc.record_backtrace false ;
  2. ** 14. |> of_float () |> ignore
[@@expect.uncaught_exn
  {| (Invalid_argument "16384 out of mediump float range") |}]

let%expect_test "of_float2" =
  Printexc.record_backtrace false ;
  -.(2. ** 14.) |> of_float () |> ignore
[@@expect.uncaught_exn
  {| (Invalid_argument "-16384 out of mediump float range") |}]

let%expect_test "of_float3" =
  Printexc.record_backtrace false ;
  2. ** -15. |> of_float () |> ignore
[@@expect.uncaught_exn
  {| (Invalid_argument "3.05176e-05 precision loss, out of mediump range") |}]

let%expect_test "of_float4" =
  Printexc.record_backtrace false ;
  -.(2. ** -15.) |> of_float () |> ignore
[@@expect.uncaught_exn
  {| (Invalid_argument "-3.05176e-05 precision loss, out of mediump range") |}]

let float_of_int _scope = float_of_int

let float_of_uint = float_of_int

let eps = 2e-10

let cmp op a b = op (Gg.Float.compare_tol ~eps a b) 0

let ( <: ) = cmp ( < )

let ( <=: ) = cmp ( <= )

let ( >=: ) = cmp ( >= )

let ( >: ) = cmp ( > )

let ( ~-: ) = ( ~-. )

let ( ==: ) = Gg.Float.equal_tol ~eps

let ( <>: ) a b = not (a ==: b)

let ( +: ) = ( +. )

let ( -: ) = ( -. )

let ( *: ) = ( *. )

let ( *:@ ) = ( *. )

let ( *:. ) = ( *. )

let ( /:. ) = ( /. )

let mux2 cond ~t ~f = if cond then t else f

let ( -- ) t _name = t
let pipeline _ t _ = t

let abs = Float.abs

let min = Float.min

let max = Float.max

let clamp x minVal maxVal =
  if minVal > maxVal then
    invalid_arg (Printf.sprintf "clamp: %g > %g" minVal maxVal) ;
  Gg.Float.clamp ~min:minVal ~max:maxVal x

let length = abs

let distance a b = length (a -. b)

let dot a b = a *. b

let normalize _ = Gg.Size1.unit

let reflect i n =
  if n <> 1. then invalid_arg (Printf.sprintf "n must be normalized, got: %g" n) ;
  -.i

module MakeVec (V : Gg.V) = struct
  type t = V.t

  let ( ~-: ) = V.neg

  let ( +: ) = V.( + )

  let ( -: ) = V.( - )

  let ( *: ) = V.mul

  let ( /:. ) = V.( / )

  let ( *:@ ) v s = V.smul s v

  let ( *:. ) = ( *:@ )

  let mux2 cond ~t ~f = if cond then t else f

  let ( -- ) t _name = t
  let pipeline _ t _ = t

  let abs = V.map abs

  let binop op a b = V.mapi (fun i a -> op a @@ V.comp i b) a

  let min = binop min

  let max = binop max

  let clamp t minv maxv = V.map (fun x -> clamp x minv maxv) t

  let length = V.norm

  let distance p0 p1 = length V.(p0 - p1)

  let dot = V.dot

  let normalize = V.unit

  let reflect i n =
    let l = length n in
    if l <>: 1. then
      invalid_arg (Printf.sprintf "n must be normalized, got: %g" l)
    else i -: (n *:@ dot i n *:. 2.)

  let x t = V.comp 0 t

  let y t = V.comp 1 t

  let z t = V.comp 2 t

  let ( ==: ) = V.equal_f ( ==: )

  let ( <>: ) a b = not (a ==: b)
end

module Vec2 = struct
  include MakeVec (Gg.V2)
  
  let phase t = Gg.V2.(to_polar t |> y)
end

let vec2 _scope = Gg.V2.v

let vec2_of_polar ~r ~theta = Gg.V2.(v r theta |> of_polar)

let%expect_test "of_polar" =
  let test divs =
    for i = 0 to divs do
      let deg = i * 360 / divs in
      let theta = Gg.Float.rad_of_deg (float deg) in
      let r = if i mod 2 = 0 then 1. else sqrt 2. in
      let x, y = vec2_of_polar ~r ~theta |> Gg.V2.to_tuple in
      Printf.printf "%.5f, %.5f\n" x y
    done
  in
  (* test 45 degrees *)
  test 8 ;
  [%expect
    {|
    1.00000, 0.00000
    1.00000, 1.00000
    0.00000, 1.00000
    -1.00000, 1.00000
    -1.00000, 0.00000
    -1.00000, -1.00000
    -0.00000, -1.00000
    1.00000, -1.00000
    1.00000, -0.00000
    |}]

let polar_tests_xy =
  let l = [-2.5; -1.; 0.; 1.; 2.5] in
  Base.List.cartesian_product l l

let%expect_test "to_polar" =
  polar_tests_xy
  |> List.map (fun (x, y) -> vec2 () x y)
  |> List.map Gg.V2.to_polar |> List.map Gg.V2.to_tuple
  |> List.iter (fun (x, y) -> Printf.printf "%.5f, %.5f\n" x y) ;
  [%expect
    {|
    3.53553, -2.35619
    2.69258, -2.76109
    2.50000, 3.14159
    2.69258, 2.76109
    3.53553, 2.35619
    2.69258, -1.95130
    1.41421, -2.35619
    1.00000, 3.14159
    1.41421, 2.35619
    2.69258, 1.95130
    2.50000, -1.57080
    1.00000, -1.57080
    0.00000, 0.00000
    1.00000, 1.57080
    2.50000, 1.57080
    2.69258, -1.19029
    1.41421, -0.78540
    1.00000, 0.00000
    1.41421, 0.78540
    2.69258, 1.19029
    3.53553, -0.78540
    2.69258, -0.38051
    2.50000, 0.00000
    2.69258, 0.38051
    3.53553, 0.78540
    |}]

module Vec3 = MakeVec (Gg.V3)

let vec3 _scope = Gg.V3.v

let vec3_of_spherical ~r ~theta ~phi = Gg.V3.(v r theta phi |> of_spherical)
