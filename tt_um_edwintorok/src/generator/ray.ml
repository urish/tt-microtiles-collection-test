open Hardcaml
open Fixederrmath

let name = "generated"

module I = Config.ImageIn
module O = Config.Linear
open! Expect_test_helpers_base

let create ~modeline scope I.{clk; coord; rst_n} =
  Fixedmath.clk := clk ;
  Fixedmath.rst_n := rst_n ;
  (* From raymarching tutorial *)
  let r_sync =
    Reg_spec.create ~clock:clk ()
    |> Reg_spec.override ~clear:rst_n ~clear_level:Level.Low
  in
  let frame_bits = 8 in
  let frames =
    Signal.reg_fb ~width:frame_bits
      ~enable:Signal.(coord.y ==:. 0 &: (coord.x ==:. 0))
      r_sync
      ~f:(Signal.mod_counter ~max:((1 lsl frame_bits) - 1))
  in
  let frames = of_uint_signal scope frames /:. (1 lsl frame_bits |> float) in
  let frames_z = frames +: of_float scope 3.5 in
  let eye =
    Vec3.(vec3 scope (of_float scope 0.) (of_float scope 0.) frames_z -- "eye")
  in
  let ray_direction xy ~fov_deg ~size =
    (* TODO: assert size.y is power of 2 *)
(*    let size_y = Vec2.(y size) |> to_float_opt |> Option.get in*)
    let size_y = 512. in
    (* override for now, remove *)
    let size' = Vec2.(size /:. 2.) in
    let uv = Vec2.((xy /:. size_y) -: (size' /:. size_y)) in
    let uv = Vec2.(uv -- "uv") in
    let screen_to_eye_dist = 1. /. tan (Gg.Float.rad_of_deg (fov_deg /. 2.)) in
    let eye_xy = vec2 scope (Vec3.x eye) (Vec3.y eye) in
    let uv = Vec2.(uv -: eye_xy) in
    let uv = Vec2.(uv -- "uv'") in
    let screen_uv_eye =
      vec3 scope (Vec2.x uv) (Vec2.y uv) (of_float scope ~-.screen_to_eye_dist)
    in
    let screen_uv_eye = Vec3.(screen_uv_eye -- "screen_uv_eye") in
    (* this perhaps distorts too much? but fits,
       perhaps we can animate the eye X coord now...
    *)
    (*Vec3.normalize*)
    screen_uv_eye
  in
  (* simplified, eye = 0, length(dir) = 1 *)
  let scene_sdf xyz = Vec3.(length xyz) -- "length_xyz" -: of_float scope 1.0 in
  (*let epsilon = of_float scope 0.0001 in*)
  let max_dist = of_float scope 8. in
  let shortest_distance_to_surface eye dir =
    (*let point = Vec3.(eye -- "eye") in
      let depth = of_float scope 0. in
      let dist' = scene_sdf point -- "dist'" in
      let depth' = dist' in*)
    let point = Vec3.(eye +: dir (* *:@ dist' *)) in
    let dist'' = scene_sdf point -- "dist''" in
    let depth'' = (*depth' +:*) dist'' in
    (*    let depth'' = min depth'' max_dist in*)
    ( point
    , (*mux2 (dist' <: epsilon) ~t:depth
        ~f:(mux2 (dist'' <: epsilon) ~t:depth' ~f:depth'')*)
      depth'' )
  in
  let max_less_eps = max_dist (*-: epsilon*) in
  let lightPos =
    vec3 scope (of_float scope 4.0) (of_float scope 2.0) (of_float scope 4.0)
  in
  let sel_bpp v01 ~nohit ~bpp =
    let v01 = v01 -- "v01" in
    Signal.mux2 nohit (to_01 ~width:bpp v01) (Signal.zero bpp)
  in
  let ambient =
    vec3 scope (of_float scope 0.5) (of_float scope 0.5) (of_float scope 0.5)
  in
  let k_ambient =
    vec3 scope (of_float scope 0.2) (of_float scope 0.2) (of_float scope 0.2)
  in
  let k_difuse =
    vec3 scope (of_float scope 1.125) (of_float scope 0.2) (of_float scope 0.2)
  in
  let light_intensity =
    vec3 scope (of_float scope 0.8) (of_float scope 0.8) (of_float scope 0.8)
  in
  let color = Vec3.((ambient *: k_ambient) -- "color") in
  let light = Vec3.((k_difuse *: light_intensity) -- "light") in
  let module Main_image = struct
    let create scope ~fov_deg ~size Config.Coord.{x; y} =
      let xy = vec2 scope (of_uint_signal scope x) (of_uint_signal scope y) in
      let xy = Vec2.(xy -- "xy") in
      let dir = ray_direction xy ~fov_deg ~size in
      let dir = Vec3.(dir -- "dir") in
      let p, dist = shortest_distance_to_surface eye dir in
      let p, dist = (Vec3.(p -- "p"), dist -- "p,_dist_") in
      let nohit, _ = dist >: max_less_eps -- "nohit" in
      (* computed analytically with gradients, v/|v| *)
      let l = Vec3.(lightPos -: p -- "l") in
      let norm = Vec3.(normalize p -- "norm") in
      (* norm * L *)
      let dot_norm_l = Vec3.(dot norm l) -- "dot_norm_l" in
      (*      let difuse = clamp dot_norm_l 0. 1. -- "diffuse" in*)
      let difuse = dot_norm_l in
      let difuse = pipeline r_sync difuse 1 in
      let rgb = Vec3.(color +: (light *:@ difuse) -- "rgb") in
      let lr = Vec3.x rgb |> sel_bpp ~nohit ~bpp:Config.Linear.bpp
      and lg = Vec3.y rgb |> sel_bpp ~nohit ~bpp:Config.Linear.bpp
      and lb = Vec3.z rgb |> sel_bpp ~nohit ~bpp:Config.Linear.bpp in
      Config.Linear.{lr; lg; lb}
  end in
  (* -- *)
  let open Stdlib in
  let size =
    let open Modeline in
    vec2 scope
      (Timing.active modeline.horiz |> float |> of_float scope)
      (Timing.active modeline.vert |> float |> of_float scope)
  in
  Main_image.create scope ~fov_deg:45. ~size coord

let hierarchical ~modeline ?instance scope input =
  let module H = Hierarchy.In_scope (I) (O) in
  H.hierarchical ?instance ~scope ~name:"ray" (create ~modeline) input

(*let%expect_test "main" =
  let _ =
    create
      (Scope.create ~flatten_design:true ())
      I.{vgaclk= Signal.gnd; rst_n= Signal.vdd}
  in
  ();
  [%expect {|
    xy: (1.25 0.5)
    uv: (-318.75 -127.5)
    s2e: 2.41421
    uv': (-318.75 -127.5)
    screen_uv_eye: (-318.75 -127.5 -2.41421)
    xy:(-318.75 -127.5), mag,phi: (343.304 -2.76109)
    zm: (-2.41421 343.304)
    length, theta: (343.313 1.57783)
    length, theta, phi: (343.313 1.57783 -2.76109)
    screen_uv_eye(spherical): (343.313 -2.76109 1.57783)
    screen_uv_eye(norm): (-0.928454 -0.371381 -0.00703211)
    dir: (-0.928454 -0.371381 -0.00703211)
    sizex: 640, sizey: 256
    320,128:0
    |}]*)
