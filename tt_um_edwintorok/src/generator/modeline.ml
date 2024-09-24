open Hardcaml
open Sexplib.Std

(** See "3. DMT Video Timing Parameter Definitions" in
   "VESA Display Monitor Timing Standard Version 1.0, Rev. 13"
 *)
module Timing = struct
  (** Number of VGA pixel (dot) clock cycles. *)
  type t =
    { sync: int  (** Sync time. (H/V)Sync is active, blank output. *)
    ; polarity: Level.t
          (** sync signal active level. {!val:Level.Low} for [-] and {!val:Level.High for +}. *)
    ; back_porch: int  (** Back porch, blank output. *)
    ; border: int
          (** left/right/top/bottom border. Video is active, but may be overscanned. *)
    ; addressable: int  (** Active area. *)
    ; front_porch: int  (** Front porch. blank output. *) }
  [@@deriving sexp_of]

  let make ~sync polarity ~back_porch ~border ~addressable ~front_porch =
    assert (back_porch > 0) ;
    assert (border >= 0) ;
    assert (addressable > 0) ;
    assert (front_porch > 0) ;
    assert (sync >= 1) ;
    {sync; polarity; back_porch; border; addressable; front_porch}

  let active t = t.addressable + (2 * t.border)

  type modeline_pos = {disp: int; sync_start: int; sync_end: int; total: int}

  let to_modeline_pos t =
    let disp = t.addressable in
    let sync_start = disp + t.border + t.front_porch in
    let sync_end = sync_start + t.sync in
    let total = sync_end + t.back_porch + t.border in
    {disp; sync_start; sync_end; total}

  let total t = (to_modeline_pos t).total

  type counter =
    {cnt: Reg_spec.signal; sync: Reg_spec.signal; sync_start: Reg_spec.signal}

  (** [cnt_sync ~enable timing r_sync] builds a counter, and {!val:sync_signal} according to [timing],
      and using register spec [r_sync].
     *)
  let cnt_sync ~enable ~reg_width t r_sync =
    let open Signal in
    let max = total t - 1 in
    let cnt = reg_fb ~enable r_sync ~width:reg_width ~f:(mod_counter ~max) in
    let s = to_modeline_pos t in
    let active = cnt >=:. s.sync_start &: (cnt <:. s.sync_end) in
    let sync =
      match t.polarity with Level.High -> active | Level.Low -> ~:active
    in
    (* we must start bumping vsync one cycle earlier, so that hsync and vsync are
       active at the same time *)
    {cnt; sync; sync_start= cnt ==:. s.sync_start - 1}

  let to_modeline_string () t =
    let {disp; sync_start; sync_end; total} = to_modeline_pos t in
    Printf.sprintf "%u %u %u %u" disp sync_start sync_end total

  let to_polarity_string () t =
    match t.polarity with Level.Low -> "-" | Level.High -> "+"
end

type t =
  {horiz: Timing.t; vert: Timing.t; pixel_clock_mhz: float; clock_divider: int}
[@@deriving sexp_of]

let refresh_rate t =
  let open Timing in
  let htotal = total t.horiz and vtotal = total t.vert in
  t.pixel_clock_mhz *. 1e6 /. (float htotal *. float vtotal)

let to_modeline t =
  let open Timing in
  Printf.sprintf {|ModeLine "%ux%u_%.2f" %.3f %a %a %ahsync %avsync|}
    t.horiz.addressable t.vert.addressable (refresh_rate t) t.pixel_clock_mhz
    Timing.to_modeline_string t.horiz Timing.to_modeline_string t.vert
    Timing.to_polarity_string t.horiz Timing.to_polarity_string t.vert

let dmt_04h_640_480 =
  (* DMT ID 04h, industry standard, but not a VESA standard.
     Some standards have a border of 8, others have it included in the porch.
     Best to keep rgb 0 here, it should be usually cut anyway.
  *)
  { horiz=
      Timing.make ~sync:96 Level.Low ~back_porch:40 ~addressable:640
        ~front_porch:8 ~border:8
  ; vert=
      Timing.make ~sync:2 Level.Low ~back_porch:25 ~addressable:480
        ~front_porch:2 ~border:8
  ; pixel_clock_mhz= 25.175 (* in range, and *2 is in range too *)
  (*  TODO: impliment divider *)
  ; clock_divider= 1 }

let test_160_100 =
  { horiz=
      Timing.make ~sync:8 Level.Low ~back_porch:16 ~addressable:160
        ~front_porch:8 ~border:0
  ; vert=
      Timing.make ~sync:6 Level.High ~back_porch:6 ~addressable:100
        ~front_porch:3 ~border:0
  ; pixel_clock_mhz= 1.0 (* in range, and *2 is in range too *)
  (*  TODO: impliment divider *)
  ; clock_divider= 1 }

let dmt_52h_1920_1080 =
  (* DMT ID 52h, CEA-861 1080p. Not CVT compliant *)
  (* 1920x1080 59.91 Hz, 133.0 MHz, matching RP-2040 max freq. *)
  { horiz=
      Timing.make ~sync:44 Level.High ~back_porch:148 ~addressable:1920
        ~front_porch:88 ~border:0
  ; vert=
      Timing.make ~sync:5 Level.High ~back_porch:36 ~addressable:1080
        ~front_porch:4 ~border:0
  ; pixel_clock_mhz=
      148.5
      (* Out of range for our board.
         /2 = 74.25 still out of range
         /4 = 37.125 would work
         (and we can divide all parameters exactly by 4)
         This would result in a horizontal resolution of 480.
         But we'd also run the design at a low clock, because 37.125*2 is out of range already
      *)
  ; clock_divider= 4 }

(* used CVT v2.1 Generator, CVT-RBv2 59.4815 Hz *)
let custom_1920_1080_133 =
  { horiz=
      Timing.make ~sync:32 Level.High ~back_porch:40 ~addressable:1920
        ~front_porch:8 ~border:0
  ; vert=
      Timing.make ~sync:8 Level.Low ~back_porch:6 ~addressable:1080
        ~front_porch:24 ~border:0
  ; pixel_clock_mhz=
      133.0
      (* Out of range for our board
         /2 = 66.5 exactly in range, no jitter *)
  ; clock_divider= 2 }

let dmt_55h_1280_720 =
  (* DMT ID 55h, CEA-861 720p. Not CVT compliant *)
  { horiz=
      Timing.make ~sync:40 Level.High ~back_porch:220 ~addressable:1280
        ~front_porch:110 ~border:0
  ; vert=
      Timing.make ~sync:5 Level.High ~back_porch:20 ~addressable:720
        ~front_porch:5 ~border:0
  ; pixel_clock_mhz= 74.25 (* out of range, but /2 is in range. *)
  ; clock_divider= 2 }

let dmt_23h_1280_1024 =
  (* DMT ID 23h. Not CVT compliant *)
  { horiz=
      Timing.make ~sync:112 Level.High ~back_porch:248 ~addressable:1280
        ~front_porch:48 ~border:0
  ; vert=
      Timing.make ~sync:3 Level.High ~addressable:1024 ~back_porch:38
        ~front_porch:1 ~border:0
  ; pixel_clock_mhz= 108.
  ; clock_divider= 2 }

(** timings for test waveform, small numbers to fit the screen.
      They are not CVT compliant timings.
     *)
let test_config =
  { horiz=
      Timing.make ~sync:3 Level.High ~back_porch:4 ~addressable:2 ~front_porch:3
        ~border:0
  ; vert=
      Timing.make ~sync:2 Level.High ~back_porch:1 ~addressable:8 ~front_porch:3
        ~border:0
  ; pixel_clock_mhz= 0.01
  ; clock_divider= 1 }

let%expect_test "dmt_04h" =
  print_string (to_modeline dmt_04h_640_480) ;
  [%expect
    {| ModeLine "640x480_59.94" 25.175 640 656 752 800 480 490 492 525 -hsync -vsync |}]

let%expect_test "dmt_52h" =
  print_string (to_modeline dmt_52h_1920_1080) ;
  [%expect
    {| ModeLine "1920x1080_60.00" 148.500 1920 2008 2052 2200 1080 1084 1089 1125 +hsync +vsync |}]

let%expect_test "dmt_55h" =
  print_string (to_modeline dmt_55h_1280_720) ;
  [%expect
    {| ModeLine "1280x720_60.00" 74.250 1280 1390 1430 1650 720 725 730 750 +hsync +vsync |}]

let%expect_test "dmt_23h" =
  print_string (to_modeline dmt_23h_1280_1024) ;
  [%expect
    {| ModeLine "1280x1024_60.02" 108.000 1280 1328 1440 1688 1024 1025 1028 1066 +hsync +vsync |}
  ]

let%expect_test "custom_1920_1080_133" =
  print_string (to_modeline custom_1920_1080_133) ;
  [%expect
    {| ModeLine "1920x1080_59.48" 133.000 1920 1928 1960 2000 1080 1104 1112 1118 +hsync -vsync |}]
