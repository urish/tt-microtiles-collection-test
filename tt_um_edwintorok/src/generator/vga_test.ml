open Hardcaml
open Config
module I = ImageIn
module O = Linear

let divide_evenly ~clk ~max ~coord scope lst =
  let max_quotient = List.length lst in
  let divisor = max / max_quotient in
  let module C = Hardcaml_circuits.Counter_div_mod.Make (struct
    let divisor = divisor

    let max_remainder = divisor - 1

    let max_quotient = max_quotient
  end) in
  let C.O.{quotient; _} =
    C.hierarchical scope
      { clock= clk
      ; clear= Signal.(coord ==:. 0)
      ; set= Signal.gnd
      ; set_quotient= Signal.zero (Signal.num_bits_to_represent max_quotient)
      ; set_remainder= Signal.zero (Signal.num_bits_to_represent (divisor - 1))
      ; incr= Signal.vdd }
  in
  Linear.Of_signal.mux quotient lst

let create ~modeline scope I.{coord; clk; rst_n} =
  let ( -- ) = Scope.naming scope in
  let apply_names name t =
    let scope = Scope.sub_scope scope name in
    let ( -- ) = Scope.naming scope in
    Linear.Of_signal.apply_names ~naming_op:( -- ) t
  in
  let lrgb lr lg lb name =
    Linear.{lr; lg; lb}
    |> Linear.map ~f:(Signal.of_int ~width:Config.Linear.bpp)
    |> apply_names name
  in
  let f = (1 lsl Config.Linear.bpp) - 1 in
  (* 100% Colour Bars *)
  let black = lrgb 0 0 0 "black" and white = lrgb f f f "white" in
  let open Modeline in
  let max_x = modeline.horiz.addressable in
  let max_y = modeline.vert.addressable in
  let bars =
    [ white
    ; lrgb f f 0 "yellow"
    ; lrgb 0 f f "cyan"
    ; lrgb 0 f 0 "green"
    ; lrgb f 0 f "magenta"
    ; lrgb f 0 0 "red"
    ; lrgb 0 0 f "blue"
    ; black ]
  in
  let borders =
    List.init (List.length bars / 2 ) (fun _ -> [white; black; white ; black; white; black]) |> List.concat
  in
  let bars =
    bars
    |> divide_evenly ~clk ~max:max_x ~coord:coord.x scope
    |> apply_names "bars"
  in
  let all =
    List.init (f + 1) (fun i -> lrgb i i i (Printf.sprintf "gray%d" i))
  in
  let rall = all |> List.map (fun t -> {black with lr= t.Linear.lr})
  and gall = all |> List.map (fun t -> {black with lg= t.Linear.lg})
  and ball = all |> List.map (fun t -> {black with lb= t.Linear.lb}) in
  let steps = [rall; gall; ball; all] |> List.concat in
  let steps =
    divide_evenly ~clk ~max:max_x ~coord:coord.x scope steps
    |> apply_names "steps"
  in
  let default =
    [steps; bars]
    |> Linear.Of_signal.mux (Signal.(coord.y <:. max_y / 2) -- "y_top")
    |> apply_names "default"
  in
  let h_border =
    borders
    |> divide_evenly ~clk ~max:max_x ~coord:coord.x scope
    |> apply_names "h_border"
  in
  let v_border =
    [white; black]
    |> Linear.Of_signal.mux Signal.(sel_top coord.y 4 |> lsb)
    |> apply_names "v_border"
  in
  Linear.Of_signal.priority_select_with_default ~default
    Signal.
      [ {valid= coord.y <:. 8; value= h_border}
      ; {valid= coord.y >=:. max_y - 8; value= h_border}
      ; {valid= coord.x <:. 8; value= v_border}
      ; {valid= coord.x >=:. max_x - 8; value= v_border} ]

let hierarchical ~modeline scope ?instance input =
  let module H = Hierarchy.In_scope (I) (O) in
  H.hierarchical ?instance ~scope ~name:"vga_test" (create ~modeline) input
