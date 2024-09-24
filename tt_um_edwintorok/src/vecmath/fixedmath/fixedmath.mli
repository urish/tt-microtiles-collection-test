(** An implementation of {!module:Vecmath_core.Types},
    using {!module:Hardcaml_fixed_point} and {!module:Hardcaml_circuits.Cordic_special_functions}
*)

open Hardcaml

val clk: Signal.t ref
val rst_n: Signal.t ref

include
  Vecmath_core.Types.S
    with type bool' = Signal.t
     and type int' = Signal.t
     and type uint' = Signal.t
    
val of_uint_signal: Scope.t -> Signal.t -> t
     
val to_01: width:int -> t -> Signal.t
