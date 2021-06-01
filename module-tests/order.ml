#!/usr/bin/env ocaml
(* check single pass module processing
 * 
 * fails w/ "unbound module type M"

module M : M =
           ^
 *)

module M : M =
    struct
        type t = int
        let f (n : t) = n |> string_of_int |> print_endline
        let g = fun x -> x
    end

module type M =
    sig
        type t
        val f : t -> unit
        val g : int -> t
    end

let _ = 10 |> M.g |> M.f
