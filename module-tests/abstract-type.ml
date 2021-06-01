#!/usr/bin/env ocaml
(* checks for basic type abstraction
 *)

module type M =
    sig
        type t
        val f : t -> unit
        val g : int -> t
    end

module M : M =
    struct
        type t = int
        let f (n : t) = n |> string_of_int |> print_endline
        let g = fun x -> x
    end

(* fails w/ "expected expr of type `M.t` but got `int`"
let _ = M.f 10
*)

let _ = 10 |> M.g |> M.f
