From Stdlib Require Import OrderedType.
From Stdlib Require Import OrderedTypeEx.

Module Type M.
Universe Parameter ux.
Parameter X : Type@{ux}.

(* The universe of t of XOrd must be defined before t *)
Declare Module Export XOrd : OrderedType
  with Universe Definition ut := ux
  with Definition t := X
  with Definition eq := @Logic.eq X.
End M.

Module M' : M.
  Universe Definition ux := Set.
  Definition X := nat.

  Module XOrd := Nat_as_OT.
End M'.

Module Type MyOt.
  Parameter t : Type.
  Parameter eq : t -> t -> Prop.
End MyOt.

Module Type M2. Parameter X : Type.

Declare Module Export XOrd : MyOt
  with Definition t := X
  with Definition eq := @Logic.eq X.
End M2.
