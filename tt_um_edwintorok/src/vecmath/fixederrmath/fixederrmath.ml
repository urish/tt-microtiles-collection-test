open Vecmath_core.Types
module A = Fixedmath
module B = Reference

let to_01 ~width (a, _) = A.to_01 ~width a
(* TODO: expect tests that call each function and use error to check it,
   and then fails when error is too big
*)

type bool' = A.bool' * B.bool' [@@deriving sexp_of]

let of_bool b = (A.of_bool b, B.of_bool b)

let ( !: ) (a, b) = (A.(!:a), B.(!:b))

type int' = A.int' * B.int' [@@deriving sexp_of]

let of_int i = (A.of_int i, B.of_int i)

type uint' = A.uint' * B.uint' [@@deriving sexp_of]

let of_uint ui = (A.of_uint ui, B.of_uint ui)

let of_uint_signal scope t =
  ( A.of_uint_signal scope t
  , 1 lsl (Hardcaml.Signal.width t - 1) |> float_of_int |> B.of_float scope )

type float' = A.float' * B.float' [@@deriving sexp_of]

let of_float scope f = (A.of_float scope f, B.of_float scope f)

let to_float_opt (_, b) = B.to_float_opt b

let float_of_int scope (a, b) = (A.float_of_int scope a, B.float_of_int scope b)

let float_of_uint scope (a, b) =
  (A.float_of_uint scope a, B.float_of_uint scope b)

let cmp op1 op2 (xa, xb) (ya, yb) = (op1 xa ya, op2 xb yb)

let ( <: ) = cmp A.( <: ) B.( <: )

let ( <=: ) = cmp A.( <: ) B.( <=: )

let ( >=: ) = cmp A.( <: ) B.( >=: )

let ( >: ) = cmp A.( <: ) B.( >: )

type vec2 = A.vec2 * B.vec2 [@@deriving sexp_of]

type vec3 = A.vec3 * B.vec3 [@@deriving sexp_of]

module Make
    (A : GenFType
           with type bool' := A.bool'
            and type int' := A.int'
            and type uint' := A.uint'
            and type float' := A.float')
    (B : GenFType
           with type bool' := B.bool'
            and type int' := B.int'
            and type uint' := B.uint'
            and type float' := B.float') =
struct
  type t = A.t * B.t

  let unary op1 op2 ((a : A.t), (b : B.t)) = (op1 a, op2 b)

  let ( ~-: ) = unary A.( ~-: ) B.( ~-: )

  let binop op1 op2 ((xa, xb) : t) (ya, yb) = (op1 xa ya, op2 xb yb)

  let ( ==: ) = binop A.( ==: ) B.( ==: )

  let ( <>: ) = binop A.( <>: ) B.( <>: )

  let ( +: ) = binop A.( +: ) B.( +: )

  let ( -: ) = binop A.( -: ) B.( -: )

  let ( *: ) = binop A.( *: ) B.( *: )

  let scalar_op op1 op2 (a, b) s = (op1 a s, op2 b s)

  let ( /:. ) = scalar_op A.( /:. ) B.( /:. )

  let ( *:@ ) = binop A.( *:@ ) B.( *:@ )

  let ( *:. ) = scalar_op A.( *:. ) B.( *:. )

  let mux2 (conda, condb) ~t:(ta, tb) ~f:(fa, fb) =
    (A.mux2 conda ~t:ta ~f:fa, B.mux2 condb ~t:tb ~f:fb)

  let ( -- ) (a, b) name = (A.(a -- name), B.(b -- name))

  let pipeline reg (a, b) n =
   (A.pipeline reg a n, B.pipeline reg b n)

  let abs = unary A.(abs) B.abs

  let min = binop A.min B.min

  let max = binop A.max B.max

  let clamp t minv maxv =
    unary (fun x -> A.clamp x minv maxv) (fun x -> B.clamp x minv maxv) t

  let length = unary A.length B.length

  let distance = binop A.distance B.distance

  let dot = binop A.dot B.dot

  let normalize = unary A.normalize B.normalize

  let reflect = binop A.reflect B.reflect
end

include Make (A) (B)

let coord op1 op2 (a, b) = (op1 a, op2 b)

module Vec2 = struct
  include Make (A.Vec2) (B.Vec2)

  let x = coord A.Vec2.x B.Vec2.x

  let y = coord A.Vec2.y B.Vec2.y

  let phase = coord A.Vec2.phase B.Vec2.phase
end

let vec2 scope (xa, xb) (ya, yb) = (A.vec2 scope xa ya, B.vec2 scope xb yb)

module Vec3 = struct
  include Make (A.Vec3) (B.Vec3)

  let x = coord A.Vec3.x B.Vec3.x

  let y = coord A.Vec3.y B.Vec3.y

  let z = coord A.Vec3.z B.Vec3.z
end

let vec3 scope (xa, xb) (ya, yb) (za, zb) =
  (A.vec3 scope xa ya za, B.vec3 scope xb yb zb)

let error (a, b) =
  A.to_float_opt a
  |> Option.map
     @@ fun actual ->
     (* maximum mean change *)
     let expected = B.to_float_opt b |> Option.get in
     let abs_error = abs_float (actual -. expected) in
     abs_error

let merge_error e1 e2 =
  match (e1, e2) with
  | None, None ->
      None
  | None, Some e | Some e, None ->
      Some e
  | Some e1, Some e2 ->
      Some Float.(max e1 e2)

let error_vec2 (a, b) =
  let xa, ya = (A.Vec2.x a, A.Vec2.y a) and xb, yb = (B.Vec2.y b, B.Vec2.y b) in
  let e1 = error (xa, xb) and e2 = error (ya, yb) in
  merge_error e1 e2

let error_vec3 (a, b) =
  let xa, ya, za = (A.Vec3.x a, A.Vec3.y a, A.Vec3.z a)
  and xb, yb, zb = (B.Vec3.y b, B.Vec3.y b, B.Vec3.z b) in
  let e1 = error (xa, xb) and e2 = error (ya, yb) and e3 = error (za, zb) in
  merge_error e3 (merge_error e1 e2)

open Expect_test_helpers_base
open Sexplib.Std

let print_error input output =
  let actual, expected = output and err = error output |> Option.get in
  let actual = A.to_float_opt actual |> Option.get in
  print_s
    [%message
      (input : float * float) (err : float) (actual : float) (expected : float)]

let%expect_test "length&angle" =
  let scope = Hardcaml.Scope.create ~flatten_design:true () in
  Reference.polar_tests_xy
  |> List.iter (fun (x, y) ->
         let v2 = vec2 scope (of_float scope x) (of_float scope y) in
         print_string "length" ;
         let length = Vec2.length v2 in
         print_error (x, y) length ;
         print_string "phase" ;
         let phase = Vec2.phase v2 in
         print_error (x, y) phase ) ;
  [%expect
    {|
    length((input (-2.5 -2.5))
     (err      0.019153594067262247)
     (actual   3.5546875)
     (expected 3.5355339059327378))
    phase((input (-2.5 -2.5))
     (err      0.010993009807655163)
     (actual   -2.3671875)
     (expected -2.3561944901923448))
    length((input (-2.5 -1))
     (err      0.02616759643274813)
     (actual   2.71875)
     (expected 2.6925824035672519))
    phase((input (-2.5 -1))
     (err      0.0032737764774282141)
     (actual   -2.7578125)
     (expected -2.7610862764774282))
    length((input (-2.5 0))
     (err      0.015625)
     (actual   2.515625)
     (expected 2.5))
    phase((input (-2.5 0))
     (err      0.008780153589793116)
     (actual   3.1328125)
     (expected 3.1415926535897931))
    length((input (-2.5 1))
     (err      0.01835509643274813)
     (actual   2.7109375)
     (expected 2.6925824035672519))
    phase((input (-2.5 1))
     (err      0.012351223522571786)
     (actual   2.7734375)
     (expected 2.7610862764774282))
    length((input (-2.5 2.5))
     (err      0.019153594067262247)
     (actual   3.5546875)
     (expected 3.5355339059327378))
    phase((input (-2.5 2.5))
     (err      0.004631990192344837)
     (actual   2.3515625)
     (expected 2.3561944901923448))
    length((input (-1 -2.5))
     (err      0.01835509643274813)
     (actual   2.7109375)
     (expected 2.6925824035672519))
    phase((input (-1 -2.5))
     (err      0.00599020390726146)
     (actual   -1.9453125)
     (expected -1.9513027039072615))
    length((input (-1 -1))
     (err      0.0076614376269048545)
     (actual   1.421875)
     (expected 1.4142135623730951))
    phase((input (-1 -1))
     (err      0.010993009807655163)
     (actual   -2.3671875)
     (expected -2.3561944901923448))
    length((input (-1 0))
     (err      0.0078125)
     (actual   1.0078125)
     (expected 1))
    phase((input (-1 0))
     (err      0.008780153589793116)
     (actual   3.1328125)
     (expected 3.1415926535897931))
    length((input (-1 1))
     (err      0.0076614376269048545)
     (actual   1.421875)
     (expected 1.4142135623730951))
    phase((input (-1 1))
     (err      0.004631990192344837)
     (actual   2.3515625)
     (expected 2.3561944901923448))
    length((input (-1 2.5))
     (err      0.02616759643274813)
     (actual   2.71875)
     (expected 2.6925824035672519))
    phase((input (-1 2.5))
     (err      0.00963479609273854)
     (actual   1.9609375)
     (expected 1.9513027039072615))
    length((input (0 -2.5))
     (err      0.015625)
     (actual   2.515625)
     (expected 2.5))
    phase((input (0 -2.5))
     (err      0.008296326794896558)
     (actual   -1.5625)
     (expected -1.5707963267948966))
    length((input (0 -1))
     (err      0.0078125)
     (actual   1.0078125)
     (expected 1))
    phase((input (0 -1))
     (err      0.008296326794896558)
     (actual   -1.5625)
     (expected -1.5707963267948966))
    length((input (0 0))
     (err      0)
     (actual   0)
     (expected 0))
    phase((input (0 0))
     (err      1.734375)
     (actual   1.734375)
     (expected 0))
    length((input (0 1))
     (err      0.0078125)
     (actual   1.0078125)
     (expected 1))
    phase((input (0 1))
     (err      0.008296326794896558)
     (actual   1.5625)
     (expected 1.5707963267948966))
    length((input (0 2.5))
     (err      0.015625)
     (actual   2.515625)
     (expected 2.5))
    phase((input (0 2.5))
     (err      0.008296326794896558)
     (actual   1.5625)
     (expected 1.5707963267948966))
    length((input (1 -2.5))
     (err      0.02616759643274813)
     (actual   2.71875)
     (expected 2.6925824035672519))
    phase((input (1 -2.5))
     (err      0.0027899496825316561)
     (actual   -1.1875)
     (expected -1.1902899496825317))
    length((input (1 -1))
     (err      0.0076614376269048545)
     (actual   1.421875)
     (expected 1.4142135623730951))
    phase((input (1 -1))
     (err      0.011476836602551721)
     (actual   -0.796875)
     (expected -0.78539816339744828))
    length((input (1 0))
     (err      0.0078125)
     (actual   1.0078125)
     (expected 1))
    phase((input (1 0))
     (err      0.015625)
     (actual   0.015625)
     (expected 0))
    length((input (1 1))
     (err      0.0076614376269048545)
     (actual   1.421875)
     (expected 1.4142135623730951))
    phase((input (1 1))
     (err      0.004148163397448279)
     (actual   0.78125)
     (expected 0.78539816339744828))
    length((input (1 2.5))
     (err      0.01835509643274813)
     (actual   2.7109375)
     (expected 2.6925824035672519))
    phase((input (1 2.5))
     (err      0.012835050317468344)
     (actual   1.203125)
     (expected 1.1902899496825317))
    length((input (2.5 -2.5))
     (err      0.019153594067262247)
     (actual   3.5546875)
     (expected 3.5355339059327378))
    phase((input (2.5 -2.5))
     (err      0.011476836602551721)
     (actual   -0.796875)
     (expected -0.78539816339744828))
    length((input (2.5 -1))
     (err      0.01835509643274813)
     (actual   2.7109375)
     (expected 2.6925824035672519))
    phase((input (2.5 -1))
     (err      0.0055063771123649019)
     (actual   -0.375)
     (expected -0.3805063771123649))
    length((input (2.5 0))
     (err      0.015625)
     (actual   2.515625)
     (expected 2.5))
    phase((input (2.5 0))
     (err      0.015625)
     (actual   0.015625)
     (expected 0))
    length((input (2.5 1))
     (err      0.02616759643274813)
     (actual   2.71875)
     (expected 2.6925824035672519))
    phase((input (2.5 1))
     (err      0.010118622887635098)
     (actual   0.390625)
     (expected 0.3805063771123649))
    length((input (2.5 2.5))
     (err      0.019153594067262247)
     (actual   3.5546875)
     (expected 3.5355339059327378))
    phase((input (2.5 2.5))
     (err      0.004148163397448279)
     (actual   0.78125)
     (expected 0.78539816339744828))
    |}]

let%expect_test "xy" =
  let scope = Hardcaml.Scope.create ~flatten_design:true () in
  Reference.polar_tests_xy
  |> List.iter (fun (x, y) ->
         let v2 = vec2 scope (of_float scope x) (of_float scope y) in
         let n2 = Vec2.normalize v2 in
         print_string "normalized(x,y)=" ;
         print_error (x, y) (Vec2.x n2) ;
         print_error (x, y) (Vec2.y n2) ;
         print_string "phase=" ;
         let _, phase = Vec2.phase v2 in
         print_float phase ; print_endline ";" ) ;
  [%expect
    {|
    normalized(x,y)=((input (-2.5 -2.5))
     (err      0.011643218813452538)
     (actual   -0.71875)
     (expected -0.70710678118654746))
    ((input (-2.5 -2.5))
     (err      0.011643218813452538)
     (actual   -0.71875)
     (expected -0.70710678118654746))
    phase=-2.35619449019;
    normalized(x,y)=((input (-2.5 -1))
     (err      0.0026954408852593037)
     (actual   -0.92578125)
     (expected -0.9284766908852593))
    ((input (-2.5 -1))
     (err      0.015328073645896279)
     (actual   -0.38671875)
     (expected -0.37139067635410372))
    phase=-2.76108627648;
    normalized(x,y)=((input (-2.5 0))
     (err      0.00390625)
     (actual   -1.00390625)
     (expected -1))
    ((input (-2.5 0))
     (err      0.00390625)
     (actual   0.00390625)
     (expected 0))
    phase=3.14159265359;
    normalized(x,y)=((input (-2.5 1))
     (err      0.0090233091147406963)
     (actual   -0.9375)
     (expected -0.9284766908852593))
    ((input (-2.5 1))
     (err      0.0081094263541037215)
     (actual   0.36328125)
     (expected 0.37139067635410372))
    phase=2.76108627648;
    normalized(x,y)=((input (-2.5 2.5))
     (err      0.011794281186547462)
     (actual   -0.6953125)
     (expected -0.70710678118654746))
    ((input (-2.5 2.5))
     (err      0.011643218813452538)
     (actual   0.71875)
     (expected 0.70710678118654746))
    phase=2.35619449019;
    normalized(x,y)=((input (-1 -2.5))
     (err      0.0081094263541037215)
     (actual   -0.36328125)
     (expected -0.37139067635410372))
    ((input (-1 -2.5))
     (err      0.0090233091147406963)
     (actual   -0.9375)
     (expected -0.9284766908852593))
    phase=-1.95130270391;
    normalized(x,y)=((input (-1 -1))
     (err      0.011643218813452538)
     (actual   -0.71875)
     (expected -0.70710678118654746))
    ((input (-1 -1))
     (err      0.011643218813452538)
     (actual   -0.71875)
     (expected -0.70710678118654746))
    phase=-2.35619449019;
    normalized(x,y)=((input (-1 0))
     (err      0.00390625)
     (actual   -1.00390625)
     (expected -1))
    ((input (-1 0))
     (err      0.00390625)
     (actual   0.00390625)
     (expected 0))
    phase=3.14159265359;
    normalized(x,y)=((input (-1 1))
     (err      0.011794281186547462)
     (actual   -0.6953125)
     (expected -0.70710678118654746))
    ((input (-1 1))
     (err      0.011643218813452538)
     (actual   0.71875)
     (expected 0.70710678118654746))
    phase=2.35619449019;
    normalized(x,y)=((input (-1 2.5))
     (err      0.015328073645896279)
     (actual   -0.38671875)
     (expected -0.37139067635410372))
    ((input (-1 2.5))
     (err      0.0066016908852593037)
     (actual   0.921875)
     (expected 0.9284766908852593))
    phase=1.95130270391;
    normalized(x,y)=((input (0 -2.5))
     (err      0.00390625)
     (actual   0.00390625)
     (expected 0))
    ((input (0 -2.5))
     (err      0.00390625)
     (actual   -1.00390625)
     (expected -1))
    phase=-1.57079632679;
    normalized(x,y)=((input (0 -1))
     (err      0.00390625)
     (actual   0.00390625)
     (expected 0))
    ((input (0 -1))
     (err      0.00390625)
     (actual   -1.00390625)
     (expected -1))
    phase=-1.57079632679;
    normalized(x,y)=((input (0 0))
     (err      NAN)
     (actual   -0.16015625)
     (expected -NAN))
    ((input (0 0))
     (err      NAN)
     (actual   0.98828125)
     (expected -NAN))
    phase=0.;
    normalized(x,y)=((input (0 1))
     (err      0)
     (actual   0)
     (expected 0))
    ((input (0 1))
     (err      0.01171875)
     (actual   1.01171875)
     (expected 1))
    phase=1.57079632679;
    normalized(x,y)=((input (0 2.5))
     (err      0)
     (actual   0)
     (expected 0))
    ((input (0 2.5))
     (err      0.01171875)
     (actual   1.01171875)
     (expected 1))
    phase=1.57079632679;
    normalized(x,y)=((input (1 -2.5))
     (err      0.015328073645896279)
     (actual   0.38671875)
     (expected 0.37139067635410372))
    ((input (1 -2.5))
     (err      0.0066016908852593037)
     (actual   -0.921875)
     (expected -0.9284766908852593))
    phase=-1.19028994968;
    normalized(x,y)=((input (1 -1))
     (err      0.011794281186547462)
     (actual   0.6953125)
     (expected 0.70710678118654746))
    ((input (1 -1))
     (err      0.011643218813452538)
     (actual   -0.71875)
     (expected -0.70710678118654746))
    phase=-0.785398163397;
    normalized(x,y)=((input (1 0))
     (err      0)
     (actual   1)
     (expected 1))
    ((input (1 0))
     (err      0.01171875)
     (actual   0.01171875)
     (expected 0))
    phase=0.;
    normalized(x,y)=((input (1 1))
     (err      0.011794281186547462)
     (actual   0.6953125)
     (expected 0.70710678118654746))
    ((input (1 1))
     (err      0.0078880311865474617)
     (actual   0.69921875)
     (expected 0.70710678118654746))
    phase=0.785398163397;
    normalized(x,y)=((input (1 2.5))
     (err      0.015921926354103721)
     (actual   0.35546875)
     (expected 0.37139067635410372))
    ((input (1 2.5))
     (err      0.0012108091147406963)
     (actual   0.9296875)
     (expected 0.9284766908852593))
    phase=1.19028994968;
    normalized(x,y)=((input (2.5 -2.5))
     (err      0.011794281186547462)
     (actual   0.6953125)
     (expected 0.70710678118654746))
    ((input (2.5 -2.5))
     (err      0.011643218813452538)
     (actual   -0.71875)
     (expected -0.70710678118654746))
    phase=-0.785398163397;
    normalized(x,y)=((input (2.5 -1))
     (err      0.0090233091147406963)
     (actual   0.9375)
     (expected 0.9284766908852593))
    ((input (2.5 -1))
     (err      0.0081094263541037215)
     (actual   -0.36328125)
     (expected -0.37139067635410372))
    phase=-0.380506377112;
    normalized(x,y)=((input (2.5 0))
     (err      0)
     (actual   1)
     (expected 1))
    ((input (2.5 0))
     (err      0.01171875)
     (actual   0.01171875)
     (expected 0))
    phase=0.;
    normalized(x,y)=((input (2.5 1))
     (err      0.0026954408852593037)
     (actual   0.92578125)
     (expected 0.9284766908852593))
    ((input (2.5 1))
     (err      0.015328073645896279)
     (actual   0.38671875)
     (expected 0.37139067635410372))
    phase=0.380506377112;
    normalized(x,y)=((input (2.5 2.5))
     (err      0.011794281186547462)
     (actual   0.6953125)
     (expected 0.70710678118654746))
    ((input (2.5 2.5))
     (err      0.0078880311865474617)
     (actual   0.69921875)
     (expected 0.70710678118654746))
    phase=0.785398163397;
    |}]
