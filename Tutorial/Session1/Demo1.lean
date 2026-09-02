/-
  # Demo
-/

import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Tactic
import LeanWidgets.VennPanel

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

example : a * b * c = b * (a * c) := by
  rw [mul_comm a b]
  rw [mul_assoc b a c]

#check mul_comm a b
#check mul_assoc a b c

example : a * b * c = b * (a * c) := by
  ring

end

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

theorem compose' (P Q R : Prop) (hPQ : P → Q) (hQR : Q → R) : P → R :=
  fun hP ↦ hQR (hPQ hP)
