#!/usr/bin/env ocaml
(* checks basic type alias propogation (w/ singleton kinds)
 *)

module type M =
    sig
(* fails b/c abstract type
        - type t = int
        + type t
*)
        type t = int
        val f : t -> unit
        val g : int -> t
    end

module M : M =
    struct
        type t = int
        let f (n : t) = n |> string_of_int |> print_endline
        let g = fun x -> x
    end

let _ = M.f 10
