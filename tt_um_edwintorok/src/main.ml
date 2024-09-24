open Hardcaml

(* TODO: test switch *)
let create scope input =
  let modeline =
    (* TODO: divisor not implemented yet Modeline.custom_1920_1080_133 *)
    List.hd Config.all_timings
  in
  let istest = input.Vga.I.test in
  let image scope input =
    let itest = Vga_test.create ~modeline scope input
    and iactual = Ray.hierarchical ~modeline scope input in
    Config.Linear.Of_signal.mux2 istest itest iactual
  in
  Vga.hierarchical ~modeline ~image scope input

let () =
  let scope =
    Scope.create ~auto_label_hierarchical_ports:true ~flatten_design:true ()
  in
  let database = Scope.circuit_database scope
  and circuit =
    Circuit.create_with_interface
      (module Vga.I)
      (module Vga.O)
      ~name:"generated" (create scope)
    |> Dedup.deduplicate
  in
  Header.print_header () ;
  Rtl.print ~database Verilog circuit
