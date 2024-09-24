open Hardcaml

module Make(I:Interface.S) (O: Interface.S) = struct
  let make create =
    let module Sim = Cyclesim.With_interface (I) (O) in
    let scope = Scope.create ~auto_label_hierarchical_ports:true ~flatten_design:true () in
    let sim = Sim.create ~config:Cyclesim.Config.trace_all (create scope) in
    Hardcaml_waveterm.Waveform.create sim
end


