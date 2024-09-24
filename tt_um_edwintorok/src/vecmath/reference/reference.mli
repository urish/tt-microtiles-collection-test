(** A reference implementation of {!module:Vecmath_core.Types}.

    Uses {!module:Gg}.
*)

include
  Vecmath_core.Types.S
    with type bool' = bool
     and type int' = int
     and type uint' = int
     and type float' = float
     and type vec2 = Gg.V2.t
     and type vec3 = Gg.V3.t

val vec2_of_polar : r:float -> theta:float -> vec2
(** [vec2_of_polar ~r ~theta] constructs a 2D vector from polar coordinates.
    
    @param r radius
    @param theta angle in radians
*)

val vec3_of_spherical : r:float -> theta:float -> phi:float -> vec3
(** [vec3_of_polar ~r ~theta ~phi] constructs a 3D vector from spherical coordinates.

    @param r radius
    @param theta azimuth angle in radians
    @param phi zenith angle in radians
*)

val polar_tests_xy : (float * float) list
(** [polar_tests_xy] a list of [x, y] coordinates for testing CORDIC polar conversions.
    It includes increments smaller than 45 degrees, and covers the entire [0 - 360) angles range. 
*)
