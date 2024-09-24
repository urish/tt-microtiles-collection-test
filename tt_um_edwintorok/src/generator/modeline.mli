(** VGA timing configuration *)
open Hardcaml

module Timing : sig
  type t =
    { sync: int  (** Sync time. (H/V)Sync is active, blank output. *)
    ; polarity: Level.t
          (** sync signal active level. {!val:Level.Low} for [-] and {!val:Level.High for +}. *)
    ; back_porch: int  (** Back porch, blank output. *)
    ; border: int
          (** left/right/top/bottom border. Video is active, this is for convenience to keep the active area close to a multiple of 2. *)
    ; addressable: int  (** Active area. *)
    ; front_porch: int  (** Front porch. blank output. *) }
  [@@deriving sexp_of]

  type counter =
    {cnt: Reg_spec.signal; sync: Reg_spec.signal; sync_start: Reg_spec.signal}

  val active : t -> int
  (** [active t] is [addressable + 2 * border] *)

  val total : t -> int

  (** [total t] is the total number of cycles or lines in this timing *)
  (** [cnt_sync ~enable timing rspec] returns a counter according to the [timing].

     The counter will count in the range [[0, total t - 1)].
     It has a [sync_start] signal that is active for 1 clock cycle.
     It has a [sync] signal that is active for as long as the [timing.sync] indicates.
    *)
  val cnt_sync : enable:Signal.t -> reg_width:int -> t -> Reg_spec.t -> counter

  type modeline_pos =
  { disp: int
  ; sync_start: int
  ; sync_end: int
  ; total: int
  }

  (** [to_modeline_pos timing] converts the [timing] to
    [active], [sync start], [sync end], and [total] counter offsets,
    as used by a ModeLine.
   *)
  val to_modeline_pos: t -> modeline_pos

end

type t = private
  { horiz: Timing.t
        (** horizontal timings, including HSync. In pixel clock cycles. *)
  ; vert: Timing.t
        (** vertical timings, including VSync. In horizontal lines. *)
  ; pixel_clock_mhz: float
        (** pixel(dot) clock in MHz. Used instead of refresh rate, because this one is exact, the refresh rate is only approximatively rounded. *)
  ; clock_divider: int
        (** divide all horizontal timings by this value. Used to get pixel clock under 66.5 MHz, so the rp2040 can generate it *)
  }
[@@deriving sexp_of]

val refresh_rate : t -> float
(** [refresh_rate t] is the vertical refresh rate of [t] in Hz. *)

val to_modeline : t -> string
(** [to_modeline t] returns a modeline string.

    This can be compared with the output from [monitor-edid].
    
    @see <https://en.wikipedia.org/wiki/XFree86_Modeline> Modelines
   *)

val custom_1920_1080_133 : t
(** [custom_1920_1080_133] 1920x1080 CVT-RBv2, 59.91 Hz. 133.0 MHz pixel clock. *)

val dmt_04h_640_480 : t
(** [dmt_04h_640_480] industry standard 640x480 ~59.94 Hz. *)

val test_160_100: t

val dmt_23h_1280_1024 : t
(** [dmt_23h_1280_1024] 1280x1024 60Hz. *)

val dmt_52h_1920_1080 : t
(** [dmt_52h_1920_1080] CEA-861 1080p 60Hz. *)

val dmt_55h_1280_720 : t
(** [dmt_55h_1280_720] CEA-861 720p 60Hz. *)

(**/*)

val test_config : t
