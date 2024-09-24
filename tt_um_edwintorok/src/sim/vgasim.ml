open Hardcaml

(* compatible with demo from vgasim *)

module I = struct
  type 'a t =
    { i_clk: 'a
    ; i_pixclk: 'a
    ; i_reset: 'a
    ; i_test: 'a
    ; i_hm_width: 'a [@bits Config.hbits]
    ; i_hm_porch: 'a [@bits Config.hbits]
    ; i_hm_synch: 'a [@bits Config.hbits]
    ; i_hm_raw: 'a [@bits Config.hbits]
    ; i_vm_height: 'a [@bits Config.vbits]
    ; i_vm_porch: 'a [@bits Config.vbits]
    ; i_vm_synch: 'a [@bits Config.vbits]
    ; i_vm_raw: 'a [@bits Config.vbits] }
  [@@deriving sexp_of, hardcaml]
end

module O = struct
  type 'a t =
    { o_vga_vsync: 'a
    ; o_vga_hsync: 'a
    ; o_vga_red: 'a [@bits 8]
    ; o_vga_grn: 'a [@bits 8]
    ; o_vga_blu: 'a [@bits 8]
    ; o_interrupt: 'a
    ; o_unused: 'a (* for verilator *) }
  [@@deriving sexp_of, hardcaml]
end

let color srgb_bits =
  Signal.concat_msb [srgb_bits; Signal.zero (8 - Config.SRGB.bpp)]

let create scope I.({i_clk; i_reset; i_test; _} as i) =
  let open Signal in
  let input = Vga.I.{clk= i_clk; rst_n= ~:i_reset;test=gnd} in
  (* breaks sim: always sets test mode..., so ignore i_test for now *)
  let modeline = (*Modeline.dmt_23h_1280_1024*) List.hd Config.all_timings in
  let image scope input =
    let test = Vga_test.create ~modeline scope input
    and actual = Ray.hierarchical ~modeline scope input
    in
    Config.Linear.Of_signal.mux2 Signal.gnd (* i_test *) test actual
  in
  (*prerr_endline (Modeline.to_modeline modeline);*)
  let output = Vga.hierarchical ~modeline ~image scope input in
  O.
    { o_vga_vsync= if modeline.vert.polarity = High then ~:(output.vsync) else output.vsync
    ; o_vga_hsync= if modeline.horiz.polarity = High then  ~:(output.hsync) else output.hsync
    ; o_interrupt= gnd
    ; o_vga_red= color output.srgb.r
    ; o_vga_grn= color output.srgb.g
    ; o_vga_blu= color output.srgb.b
    ; o_unused=
        [ i.i_pixclk
        ; i.i_test
        ; i.i_hm_width
        ; i.i_hm_porch
        ; i.i_hm_synch
        ; i.i_hm_raw
        ; i.i_vm_height
        ; i.i_vm_porch
        ; i.i_vm_synch
        ; i.i_vm_raw ]
        |> List.map (fun s ->
               s |> Signal.bits_msb |> Signal.reduce ~f:Signal.( &: ) )
        |> Signal.reduce ~f:Signal.( &: ) }

let () =
  let scope =
    Scope.create ~auto_label_hierarchical_ports:true ~flatten_design:true ()
  in
  let database = Scope.circuit_database scope
  and circuit =
    Circuit.create_with_interface
      (module I)
      (module O)
      ~name:"demo" (create scope)
    |> Dedup.deduplicate
  in
  print_endline "/* verilator lint_off UNUSED */" ;
  (* TODO: fix hardcaml? *)
  print_endline "/* verilator lint_off COMBDLY */" ;
  Rtl.print ~database Verilog circuit
