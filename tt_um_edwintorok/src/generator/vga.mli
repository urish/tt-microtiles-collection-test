open Hardcaml

(** VGA controller input *)
module I : sig
  type 'a t =
    { clk: 'a  (** Clock. Must be an integer multiple of the VGA pixel clock. *)
    ; rst_n: 'a  (** Reset signal. Active low. *)
    ; test: 'a
    }
  [@@deriving sexp_of, hardcaml]
end

open Config

(** VGA controller output *)
module O : sig
  type 'a t = {srgb: 'a SRGB.t; hsync: 'a; vsync: 'a; audio: 'a}
  [@@deriving sexp_of, hardcaml]
end

type 'a image = Scope.t -> 'a ImageIn.t -> 'a Linear.t

val hierarchical :
     modeline:Modeline.t
  -> image:Reg_spec.signal image
  -> Scope.t
  -> ?instance:string
  -> Reg_spec.signal I.t
  -> Reg_spec.signal O.t
