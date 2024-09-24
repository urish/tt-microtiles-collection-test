(** An implementation of {!module:Vecmath_core.Types},
    using {!module:Fixedmath} and {!module:Reference} to keep track of errors at runtime
*)

include
  Vecmath_core.Types.S
    with type bool' = Fixedmath.bool' * Reference.bool'
     and type int' = Fixedmath.int' * Reference.int'
     and type uint' = Fixedmath.uint' * Reference.uint'
     and type float' = Fixedmath.float' * Reference.float'
     and type vec2 = Fixedmath.vec2 * Reference.vec2
     and type vec3 = Fixedmath.vec3 * Reference.vec3

val error : float' -> float option

val error_vec2 : vec2 -> float option

val error_vec3 : vec3 -> float option

open Hardcaml
val of_uint_signal : Scope.t -> Signal.t -> t

val to_01: width:int -> t -> Signal.t
