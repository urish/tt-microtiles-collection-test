open Hardcaml

(** Follows GLSL ES naming where possible.


  We only include operations that we use.
  
  See https://registry.khronos.org/OpenGL/specs/es/3.2/GLSL_ES_Specification_3.20.html
*)

(** {1 Basic types} 
    See https://registry.khronos.org/OpenGL/specs/es/3.2/GLSL_ES_Specification_3.20.html#basic-types

    We suffix each type with ['], to avoid clashes with builtin OCaml types
  *)
module type Basic = sig
  (** a 1-bit boolean type *)
  type bool'

  (** a signed integer *)
  type int'

  (** an unsigned integer *)
  type uint'

  (** a float-point scalar,
      approximatively equivalent to [mediump float] *)
  type float'
end

module type BasicS = sig
  include Basic

  (* cannot use deriving here, or Vec2 would need to include an sexp_of_bool' too *)

  val sexp_of_bool' : bool' -> Sexplib.Sexp.t

  val sexp_of_int' : int' -> Sexplib.Sexp.t

  val sexp_of_uint' : uint' -> Sexplib.Sexp.t

  val sexp_of_float' : float' -> Sexplib.Sexp.t
end

module type GenFType = sig
  include Basic

  (** float, vec2, vec3 or vec4 *)
  type t

  (** {1 Expressions}

      See https://registry.khronos.org/OpenGL/specs/es/3.2/GLSL_ES_Specification_3.20.html#expressions
    *)

  (** {2 Unary operators} *)

  val ( ~-: ) : t -> t
  (** [~-: x] negates [x].
    
      Same as [0 -: x], but potentially more efficient. *)

  (** {2 Equality operators} *)

  val ( ==: ) : t -> t -> bool'
  (** [a ==: b] is a component-wise equality test. *)

  val ( <>: ) : t -> t -> bool'
  (** [a <>: b]
        checks that [a] and [b] are not equal, component-wise.
    
      This would be [!=] in GLSL ES, but [!] is a unary operator in OCaml.
    *)

  (** {2 Binary operators} *)

  val ( +: ) : t -> t -> t
  (** [a +: b] is the component-wise addition. *)

  val ( -: ) : t -> t -> t
  (** [a -: b] is the component-wise subtraction. *)

  val ( *: ) : t -> t -> t
  (** [a *: b] is the component-wise multiplication *)

  val ( /:. ) : t -> float -> t
  (** [a /: const] is the division of [a] by the [const]ant.  *)

  val ( *:@ ) : t -> float' -> t
  (** [vec *:@ scalar] multiplies each element of [vec] with the [scalar]. *)

  val ( *:. ) : t -> float -> t
  (** [vec *:. constant] multiplies each element of [vec] with the [constant]. *)

  (** {2 Ternary operator} *)

  val mux2 : bool' -> t:t -> f:t -> t
  (** [mux2 cond ~t ~f] returns [t] when [cond] is [1], and [f] when [cond] is [0].
    
      Equivalent to [cond ? t : f], but OCaml doesn't support ternary operators.
    *)

  (** {2 Hardcaml specific} *)

  val ( -- ) : t -> string -> t
  (** [a -- name] assigns the [name] to [a] for debugging purposes. *)

  (** [pipeline reg t n] maps each coordinate of [t] through [Signal.pipeline]. *)
  val pipeline : Reg_spec.t -> t -> int -> t

  (** {1 Common operations on GLSL [FType]}
        , i.e. [float], [vec2], [vec3], or [vec4].
    
      See https://registry.khronos.org/OpenGL/specs/es/3.2/GLSL_ES_Specification_3.20.html#built-in-functions
    *)

  (** {2 Common functions}

      See https://registry.khronos.org/OpenGL/specs/es/3.2/GLSL_ES_Specification_3.20.html#common-functions
    *)

  val abs : t -> t
  (** [abs x] is [x] when [x >= 0], otherwise [-x]. *)

  val min : t -> t -> t
  (** [min x y] is [y] if [y < x], otherwise [x]. *)

  val max : t -> t -> t
  (** [max x y] is [y] if [x < y], otherwise [x]. *)

  val clamp : t -> float -> float -> t
  (** [clamp x minVal maxVal] is [min(max(x, minVal), maxVal)].
        
        We only support clamping to constant values.

        @raises Invalid_argument if [minVal > maxVal]
       *)

  (** {2 Geometric functions} *)

  val length : t -> float'
  (** [length x] is the length of the vector [x],
      i.e. [sqrt [x0^2 + ...]]
     *)

  val distance : t -> t -> float'
  (** [distance p0 p1] is [length (p0 - p1)] *)

  val dot : t -> t -> float'
  (** [dot x y] is the dot product of [x] and [y],
      i.e. [x0*y0 + ...]
     *)

  val normalize : t -> t
  (** [normalize x] is a vector of [length] 1 in the same direction as [x],
      i.e. [x / length(x)] *)

  val reflect : t -> t -> t
  (** [reflect i n] is [i - 2 * dot(n,i) * n]. [n] must be normalized. *)
end

module type S = sig
  include BasicS

  include
    GenFType
      with type t = float'
       and type int' := int'
       and type uint' := uint'
       and type bool' := bool'
       and type float' := float'

  (** {1 Vector types} *)

  (** a 2D vector of {!type:float'} *)
  type vec2 [@@deriving sexp_of]

  (** a 3D vector of {!type:float'} *)
  type vec3 [@@deriving sexp_of]

  (** {1 Boolean operations} *)

  val of_bool : bool -> bool'
  (** [of_bool b] wraps the boolean [b]. *)

  val ( !: ) : bool' -> bool'
  (** [!: b] is boolean negation. *)

  (** {1 Integer operations} *)

  val of_int : int -> int'
  (** [of_int i] wraps the integer [i].

    @raises Invalid_argument if [i] is outside [-2^15, 2^15-1] 
  *)

  val of_uint : int -> uint'
  (** [of_uint i] wraps the integer [i].

      @raises Invalid_argument if [i < 0] or outside [0, 2^16-1]
   *)

  (* TODO: math.mli will also have an of_uint_signal *)

  (** {1 Float operations} *)

  val of_float : Scope.t -> float -> float'
  (** [float scope f] is the constant [f].

    @raises Invalid_argument if [f] is outside of [(-2^14,2^14)],

        or if [f] is too small but not 0: (-2^-14, 2^-14)
  *)

  val float_of_int : Scope.t -> int' -> float'
  (** [float_of_int scope i] converts [i] to a floating point value with 0 fractional width. *)

  val float_of_uint : Scope.t -> uint' -> float'
  (** [float_of_uint scope ui] converts [i] to a floating point value with 0 fractional width. *)

  val ( <: ) : float' -> float' -> bool'

  val ( <=: ) : float' -> float' -> bool'

  val ( >=: ) : float' -> float' -> bool'

  val ( >: ) : float' -> float' -> bool'

  val to_float_opt : float' -> float option
  (** [to_float_opt f] is [Some f] when [f] is a constant. *)

  (** {1 vec2 operations} *)

  val vec2 : Scope.t -> float' -> float' -> vec2
  (** [vec2 scope x y] initializes the 2D vector with [x, y]. *)

  module Vec2 : sig
    include
      GenFType
        with type t = vec2
         and type int' := int'
         and type uint' := uint'
         and type bool' := bool'
         and type float' := float'

    val x : vec2 -> float'
    (** [x vec2] accesses the [x] component of [vec2]. *)

    val y : vec2 -> float'
    (** [y vec2] accesses the [y] component of [vec2]. *)
    
    (** For testing purposes, not part of GLSL *)

    val phase: vec2 -> float'
    (** [phase vec2] is the angle between [y] and [x] in radians. *)
  end

  (** {1 vec3 operations} *)

  val vec3 : Scope.t -> float' -> float' -> float' -> vec3
  (** [vec3 scope x y z] initializes the 3D vector with [x, y, z]. *)

  module Vec3 : sig
    include
      GenFType
        with type t = vec3
         and type int' := int'
         and type uint' := uint'
         and type bool' := bool'
         and type float' := float'

    val x : vec3 -> float'
    (** [x vec3] accesses the [x] component of [vec2]. *)

    val y : vec3 -> float'
    (** [y vec3] accesses the [y] component of [vec3]. *)

    val z : vec3 -> float'
    (** [z vec3] accesses the [z] component of [vec3]. *)
  end
end
