#!/usr/bin/env ocaml
(* check single pass module processing
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

module N =
    struct
        type t = M.t (* not used *)
        let f = M.f
    end

let _ = 10 |> M.g |> N.f

