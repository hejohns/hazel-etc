#!/usr/bin/env ocaml
(* checks for basic type sharing

   [note] utop assert fails... double check these semantics

utop # #typeof "M''.t";;
Fatal error: exception File "typing/env.ml", line 996, characters 26-32: Assertion failed

 *)

module type M =
    sig
        type t
        val f : t -> unit
        val g : int -> t
    end

module type M' =
    sig
        type t
        val f : t -> unit
    end

module type M'' =
    sig
        type t
        val g : int -> t
    end

module M : M =
    struct
        type t = int
        let f (n : t) = n |> string_of_int |> print_endline
        let g = fun x -> x
    end

(* fails w/ "expected expr of type `M'.t` but got `M''.t`"
- module M' : M' with type t = M.t = M
- module M'' : M'' with type t = M.t = M

let _ = M'.f (M''.g 10)
             ^^^^^^^^^^
*)

module M' : M' with type t = M.t = M
module M'' : M'' with type t = M.t = M

let _ = M'.f (M''.g 10)

