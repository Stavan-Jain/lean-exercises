/-
  # Demo
-/

import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Tactic
import LeanWidgets.VennPanel

/- Part 1: Propositional Logic -/

theorem warmup (P : Prop) : P → P := by
  intro hP
  exact hP

theorem compose (P Q R : Prop) (hPQ : P → Q) (hQR : Q → R) : P → R := by
  intro hP
  apply hQR
  apply hPQ
  exact hP

theorem or_swap (P Q : Prop) : P ∨ Q → Q ∨ P := by
  intro h
  rcases h with hp | hq
  · right
    exact hp
  · left
    exact hq

section
variable (a b c : ℝ)

/- Part 2: Algebra -/

example : a * b * c = b * (a * c) := by
  rw [mul_comm a b]
  rw [mul_assoc b a c]

#check mul_comm a b
#check mul_assoc a b c

example : a * b * c = b * (a * c) := by
  rw [mul_comm a b]
  rw [mul_assoc b a c]

example : a * b * c = b * (a * c) := by
  ring

end

/- Part 3: Widgets -/

show_panel_widgets [local SetVennPanel]

section
variable {α : Type*} (s t u : Set α)

example (h : s ⊆ t) : s ∩ u ⊆ t ∩ u := by
  intro x hx
  constructor
  · apply h
    exact hx.1
  · exact hx.2

end

/- Part 4: Types -/

inductive Suit : Type
  | clubs
  | diamonds
  | hearts
  | spades

open Suit

def isRed : Suit → Bool
  | diamonds => true
  | hearts => true
  | _ => false

example : isRed Suit.diamonds := by
  rfl

#check Fin

structure Card where
  suit : Suit
  number : Fin 13

def aceOfSpades : Card := {
  suit := spades
  number := 0
}

structure Pair where
  first : Card
  second : Card
  same_rank : first.number = second.number

def aces : Pair := {
  first := aceOfSpades
  second := aceOfSpades
  same_rank := rfl
}
