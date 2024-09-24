open Hardcaml
open Sexplib.Std
open Config

module I = struct
  type 'a t = {clk: 'a; rst_n: 'a; test: 'a} [@@deriving sexp_of, hardcaml]
end

module Controller = struct
  module I = I

  module O = struct
    type 'a t =
      { hsync: 'a  (** horizontal sync *)
      ; vsync: 'a  (** vertical sync *)
      ; coord: 'a Coord.t
      ; blank: 'a
            (** outside of active video zone. rgb has to be forced to 0. *) }
    [@@deriving sexp_of, hardcaml]
  end

  open Signal

  let reg I.{clk; rst_n} =
    (* ASIC (not FPGA) optimized, use asynchronous clear, instead of synchronous reset *)
    Reg_spec.(
      create ~clock:clk () |> override ~clear:rst_n ~clear_level:Level.Low )

  let create ~modeline _scope input =
    let open Modeline in
    (* TODO: clock divider support *)
    let r_sync = reg input in
    let enable = vdd in
    let h =
      Timing.cnt_sync modeline.horiz r_sync ~reg_width:Config.hbits ~enable
    in
    let v =
      (* vsync starts at same time as hsync,
         see "3.5 DMT Video Timing Parameter Definitions - Total Frame Timing"
      *)
      Timing.cnt_sync modeline.vert r_sync ~reg_width:Config.vbits
        ~enable:h.sync_start
    in
    (* we blank the border too, although this is not required *)
    let blank =
      ~:( h.cnt <:. modeline.horiz.addressable
        &: (v.cnt <:. modeline.vert.addressable) )
    in
    let coord = Coord.{x= h.cnt; y= v.cnt} in
    O.{hsync= h.sync; vsync= v.sync; blank; coord}

  let hierarchical ~modeline scope ?instance input =
    let module H = Hierarchy.In_scope (I) (O) in
    H.hierarchical ~scope ~name:"vgaController" ?instance (create ~modeline)
      input
end

let display_rules =
  let of_bits bits = Bits.to_int bits |> Printf.sprintf "%X" in
  let f _port = Some Wave_format.(Bit_or (Custom of_bits)) in
  [Hardcaml_waveterm.Display_rule.custom ~f]

let%expect_test "hvsync" =
  let open Expect_test_helpers_base in
  let modeline = Modeline.test_config in
  let module C = Controller in
  let module W = Waveforms.Make (C.I) (C.O) in
  let waves, sim = W.make (C.create ~modeline) in
  let inputs = Cyclesim.inputs sim and outputs = Cyclesim.outputs sim in
  inputs.rst_n := Bits.gnd ;
  Cyclesim.cycle sim ;
  inputs.rst_n := Bits.vdd ;
  let h = Modeline.Timing.to_modeline_pos modeline.horiz
  and v = Modeline.Timing.to_modeline_pos modeline.vert in
  let monitor = Array.make_matrix v.total h.total "x"
  and hsyncs = Array.make_matrix v.total h.total "x"
  and vsyncs = Array.make_matrix v.total h.total "x" in
  for i = 0 to h.total * v.total * 2 do
    (* Our counter starts at 0 = beginning of active region.
       However the monitor starts drawing at Hsync+Vsync start.
       To show how the signal looks like for the monitor we offset.
    *)
    let offset = h.sync_start + (h.total * (v.sync_start - 1)) in
    let hpos = (i - offset) mod h.total
    and vpos = (i - offset) / h.total mod v.total in
    let hsync = Bits.to_bool !(outputs.hsync)
    and vsync = Bits.to_bool !(outputs.vsync)
    and blank = Bits.to_bool !(outputs.blank)
    and hcnt = Bits.to_int !(outputs.coord.x)
    and vcnt = Bits.to_int !(outputs.coord.y) in
    let str = if blank then "B" else Printf.sprintf "%2u,%2u" vcnt hcnt in
    if i >= offset && vpos < v.total && hpos < h.total then (
      hsyncs.(vpos).(hpos) <- (if hsync then "H" else " ") ;
      vsyncs.(vpos).(hpos) <- (if vsync then "V" else " ") ;
      monitor.(vpos).(hpos) <- Printf.sprintf "%5s" str ) ;
    (* clock is automatically set, no need to change it *)
    Cyclesim.cycle sim
  done ;
  print_endline (Modeline.to_modeline modeline) ;
  Hardcaml_waveterm.Waveform.expect ~display_rules ~wave_width:0
    ~serialize_to:"vga1" ~display_width:76 waves ;
  Hardcaml_waveterm.Waveform.expect ~display_rules ~wave_width:0
    ~serialize_to:"vga2"
    ~start_cycle:((h.total * (v.sync_start - 1)) + h.sync_start)
    ~display_width:76 waves ;
  Hardcaml_waveterm.Waveform.expect ~display_rules ~wave_width:(-1)
    ~serialize_to:"vga3"
    ~start_cycle:(h.total * (v.sync_start - 1))
    ~display_width:76 waves ;
  Hardcaml_waveterm.Waveform.expect ~display_rules ~wave_width:(-1)
    ~serialize_to:"vga4"
    ~start_cycle:((h.total * (v.disp - 1)) + h.disp - 2)
    ~display_width:76 waves ;
  Hardcaml_waveterm.Waveform.expect ~display_rules ~wave_width:(-1)
    ~serialize_to:"vga5" ~start_cycle:(h.total * v.sync_start) ~display_width:76
    waves ;
  let draw_monitor a =
    print_endline "" ;
    String.concat "\n"
      ( a |> Array.to_list
      |> List.map
         @@ fun row ->
         ["|"; row |> Array.to_list |> String.concat "|"; "|"]
         |> String.concat "" )
    |> print_endline
  in
  let h = modeline.horiz in
  print_s [%message (h : Modeline.Timing.t)] ;
  draw_monitor hsyncs ;
  let v = modeline.vert in
  print_s [%message (v : Modeline.Timing.t)] ;
  draw_monitor vsyncs ;
  let blank_hl, blank_hr = (h.sync + h.back_porch, h.front_porch)
  and blank_vt, blank_vb = (v.sync + v.back_porch, v.front_porch) in
  print_s
    [%message
      (blank_hl : int) (blank_hr : int) (blank_vt : int) (blank_vb : int)] ;
  draw_monitor monitor ;
  [%expect
    {|
    ModeLine "2x8_59.52" 0.010 2 5 8 12 8 11 13 14 +hsync +vsync
    ┌Signals──────────┐┌Waves──────────────────────────────────────────────────┐
    │clk              ││┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌│
    │                 ││ └┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘│
    │rst_n            ││  ┌────────────────────────────────────────────────────│
    │                 ││──┘                                                    │
    │blank            ││      ┌───────────────────┐   ┌───────────────────┐   ┌│
    │                 ││──────┘                   └───┘                   └───┘│
    │hsync            ││            ┌─────┐                 ┌─────┐            │
    │                 ││────────────┘     └─────────────────┘     └────────────│
    │vsync            ││                                                       │
    │                 ││───────────────────────────────────────────────────────│
    │                 ││────┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬│
    │x                ││ 0  │1│2│3│4│5│6│7│8│9│A│B│0│1│2│3│4│5│6│7│8│9│A│B│0│1││
    │                 ││────┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴│
    │                 ││────────────┬───────────────────────┬──────────────────│
    │y                ││ 0          │1                      │2                 │
    │                 ││────────────┴───────────────────────┴──────────────────│
    │vdd              ││───────────────────────────────────────────────────────│
    │                 ││                                                       │
    └─────────────────┘└───────────────────────────────────────────────────────┘
    e3cba7663d203cdd60a06d85211b25e2
    ┌Signals──────────┐┌Waves──────────────────────────────────────────────────┐
    │clk              ││┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌┐┌│
    │                 ││ └┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘└┘│
    │rst_n            ││───────────────────────────────────────────────────────│
    │                 ││                                                       │
    │blank            ││───────────────────────────────────────────────────────│
    │                 ││                                                       │
    │hsync            ││  ┌─────┐                 ┌─────┐                 ┌────│
    │                 ││──┘     └─────────────────┘     └─────────────────┘    │
    │vsync            ││  ┌───────────────────────────────────────────────┐    │
    │                 ││──┘                                               └────│
    │                 ││──┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬│
    │x                ││ 4│5│6│7│8│9│A│B│0│1│2│3│4│5│6│7│8│9│A│B│0│1│2│3│4│5│6││
    │                 ││──┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴│
    │                 ││──┬───────────────────────┬───────────────────────┬────│
    │y                ││ A│B                      │C                      │D   │
    │                 ││──┴───────────────────────┴───────────────────────┴────│
    │vdd              ││───────────────────────────────────────────────────────│
    │                 ││                                                       │
    └─────────────────┘└───────────────────────────────────────────────────────┘
    e3cba7663d203cdd60a06d85211b25e2
    ┌Signals──────────┐┌Waves──────────────────────────────────────────────────┐
    │clk              ││╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥│
    │                 ││╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨│
    │rst_n            ││───────────────────────────────────────────────────────│
    │                 ││                                                       │
    │blank            ││─────────────────────────────────────────────────┐ ┌───│
    │                 ││                                                 └─┘   │
    │hsync            ││      ┌──┐        ┌──┐        ┌──┐        ┌──┐        ┌│
    │                 ││──────┘  └────────┘  └────────┘  └────────┘  └────────┘│
    │vsync            ││      ┌───────────────────────┐                        │
    │                 ││──────┘                       └────────────────────────│
    │                 ││─┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬│
    │x                ││ │││││││││││││││││││││││││││││││││││││││││││││││││││││││
    │                 ││─┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴│
    │                 ││──────┬───────────┬───────────┬───────────┬───────────┬│
    │y                ││ A    │B          │C          │D          │0          ││
    │                 ││──────┴───────────┴───────────┴───────────┴───────────┴│
    │vdd              ││───────────────────────────────────────────────────────│
    │                 ││                                                       │
    └─────────────────┘└───────────────────────────────────────────────────────┘
    e3cba7663d203cdd60a06d85211b25e2
    ┌Signals──────────┐┌Waves──────────────────────────────────────────────────┐
    │clk              ││╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥│
    │                 ││╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨│
    │rst_n            ││───────────────────────────────────────────────────────│
    │                 ││                                                       │
    │blank            ││─┐ ┌───────────────────────────────────────────────────│
    │                 ││ └─┘                                                   │
    │hsync            ││      ┌──┐        ┌──┐        ┌──┐        ┌──┐        ┌│
    │                 ││──────┘  └────────┘  └────────┘  └────────┘  └────────┘│
    │vsync            ││                                          ┌────────────│
    │                 ││──────────────────────────────────────────┘            │
    │                 ││─┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬│
    │x                ││ │││││││││││││││││││││││││││││││││││││││││││││││││││││││
    │                 ││─┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴│
    │                 ││──────┬───────────┬───────────┬───────────┬───────────┬│
    │y                ││ 7    │8          │9          │A          │B          ││
    │                 ││──────┴───────────┴───────────┴───────────┴───────────┴│
    │vdd              ││───────────────────────────────────────────────────────│
    │                 ││                                                       │
    └─────────────────┘└───────────────────────────────────────────────────────┘
    e3cba7663d203cdd60a06d85211b25e2
    ┌Signals──────────┐┌Waves──────────────────────────────────────────────────┐
    │clk              ││╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥│
    │                 ││╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨╨│
    │rst_n            ││───────────────────────────────────────────────────────│
    │                 ││                                                       │
    │blank            ││─────────────────────────────────────┐ ┌─────────┐ ┌───│
    │                 ││                                     └─┘         └─┘   │
    │hsync            ││      ┌──┐        ┌──┐        ┌──┐        ┌──┐        ┌│
    │                 ││──────┘  └────────┘  └────────┘  └────────┘  └────────┘│
    │vsync            ││──────────────────┐                                    │
    │                 ││                  └────────────────────────────────────│
    │                 ││─┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬┬│
    │x                ││ │││││││││││││││││││││││││││││││││││││││││││││││││││││││
    │                 ││─┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴┴│
    │                 ││──────┬───────────┬───────────┬───────────┬───────────┬│
    │y                ││ B    │C          │D          │0          │1          ││
    │                 ││──────┴───────────┴───────────┴───────────┴───────────┴│
    │vdd              ││───────────────────────────────────────────────────────│
    │                 ││                                                       │
    └─────────────────┘└───────────────────────────────────────────────────────┘
    e3cba7663d203cdd60a06d85211b25e2
    (h (
      (sync        3)
      (polarity    High)
      (back_porch  4)
      (border      0)
      (addressable 2)
      (front_porch 3)))

    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    |H|H|H| | | | | | | | | |
    (v (
      (sync        2)
      (polarity    High)
      (back_porch  1)
      (border      0)
      (addressable 8)
      (front_porch 3)))

    |V|V|V|V|V|V|V|V|V|V|V|V|
    |V|V|V|V|V|V|V|V|V|V|V|V|
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    | | | | | | | | | | | | |
    ((blank_hl 7)
     (blank_hr 3)
     (blank_vt 3)
     (blank_vb 3))

    |    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B| 0, 0| 0, 1|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B| 1, 0| 1, 1|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B| 2, 0| 2, 1|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B| 3, 0| 3, 1|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B| 4, 0| 4, 1|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B| 5, 0| 5, 1|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B| 6, 0| 6, 1|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B| 7, 0| 7, 1|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|
    |    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|    B|
    |}]

module O = struct
  type 'a t = {srgb: 'a SRGB.t; hsync: 'a; vsync: 'a; audio: 'a}
  [@@deriving sexp_of, hardcaml]
end

let linear_to_srgb1 linear =
  let n = (1 lsl Config.Linear.bpp) - 1 in
  let out_bits = Config.SRGB.bpp in
  let out_max = (1 lsl out_bits) - 1 in
  (* TODO: ROM with 3 read ports *)
  Signal.mux_init linear (n + 1) ~f:(fun i ->
      let f = float i /. float n in
      let srgb, _, _, _ = Gg.(Color.(v f f f 1. |> to_srgb) |> V4.to_tuple) in
      let v = srgb *. float out_max |> Float.round |> Float.to_int in
      v |> Signal.of_int ~width:out_bits )

let linear_to_srgb Linear.{lr; lg; lb} =
  SRGB.{r= linear_to_srgb1 lr; g= linear_to_srgb1 lg; b= linear_to_srgb1 lb}

type 'a image = Scope.t -> 'a ImageIn.t -> 'a Linear.t

let create ~image ~modeline scope input =
  let controller = Controller.hierarchical ~modeline scope input in
  let clk = input.clk and rst_n = input.rst_n in
  let open Controller.O in
  let rgb = image scope ImageIn.{clk; coord= controller.coord; rst_n} in
  let z = Signal.zero Config.SRGB.bpp in
  let zero = SRGB.{r= z; g= z; b= z} in
  let srgb =
    rgb |> linear_to_srgb |> SRGB.Of_signal.mux2 controller.blank zero
  in
  let audio = Signal.(controller.hsync |: controller.vsync) in
  O.{hsync= controller.hsync; vsync= controller.vsync; srgb; audio}
  (* add register on output for all signals: helps with timing analysis,
     and avoiding glitches on the output *)
  |> O.Of_signal.reg (Controller.reg input)

let hierarchical ~modeline ~image scope ?instance input =
  let module H = Hierarchy.In_scope (I) (O) in
  H.hierarchical ?instance ~scope ~name:"vga" (create ~modeline ~image) input
