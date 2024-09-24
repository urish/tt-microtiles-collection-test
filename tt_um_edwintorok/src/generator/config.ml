(**
  Configuration that needs to be shared between different modules.
  Could use functors instead, but only one specific configuration is built,
  so this is simpler.
*)
open Hardcaml

(* all the timings that we want to support *)
let all_timings =
  (* TODO: 1024 config *)
  Modeline.[(*custom_1920_1080_133;*)
   dmt_04h_640_480
(*  dmt_23h_1280_1024*)
  (* test_160_100*)]

let bits_for timing =
  (timing |> Modeline.Timing.total) - 1 |> Signal.num_bits_to_represent

let hbits =
  all_timings
  |> List.map (fun modeline -> bits_for modeline.Modeline.horiz)
  |> List.fold_left Int.max 0

let vbits =
  all_timings
  |> List.map (fun modeline -> bits_for modeline.Modeline.vert)
  |> List.fold_left Int.max 0

module Coord = struct
  type 'a t = {x: 'a [@bits hbits]; y: 'a [@bits vbits]}
  [@@deriving sexp_of, hardcaml]
end

module ImageIn = struct
  type 'a t = {clk: 'a; coord: 'a Coord.t; rst_n: 'a} [@@deriving sexp_of, hardcaml]
end

module Linear = struct
  let bpp = 3

  (** A linear RGB signal *)
  type 'a t = {lr: 'a [@bits bpp]; lg: 'a [@bits bpp]; lb: 'a [@bits bpp]}
  [@@deriving sexp_of, hardcaml]
end

module SRGB = struct
  (** bits per pixel *)
  let bpp = 2

  (** A sRGB VGA signal *)
  type 'a t = {r: 'a [@bits bpp]; g: 'a [@bits bpp]; b: 'a [@bits bpp]}
  [@@deriving sexp_of, hardcaml]
end
