/-
  Solutions · E3 (Sets)
-/
import Mathlib.Data.Set.Basic
import Mathlib.Tactic

section
variable {α : Type*} (s t u : Set α)
open Set

example : s ∩ t ⊆ s := by
  intro x hx
  exact hx.1

example : s ⊆ s ∪ t := by
  intro x xs
  left
  exact xs

example : s ∩ t ∪ s ∩ u ⊆ s ∩ (t ∪ u) := by
  rintro x (⟨xs, xt⟩ | ⟨xs, xu⟩)
  · exact ⟨xs, Or.inl xt⟩
  · exact ⟨xs, Or.inr xu⟩

example : s ∩ (s ∪ t) = s := by
  ext x
  constructor
  · rintro ⟨xs, _⟩
    exact xs
  · intro xs
    exact ⟨xs, Or.inl xs⟩

example : s ∪ s ∩ t = s := by
  ext x
  constructor
  · rintro (xs | ⟨xs, _⟩)
    · exact xs
    · exact xs
  · intro xs
    left
    exact xs

example : s \ (t ∪ u) ⊆ (s \ t) \ u := by
  rintro x ⟨xs, xntu⟩
  constructor
  · constructor
    · exact xs
    · intro xt
      exact xntu (Or.inl xt)
  · intro xu
    exact xntu (Or.inr xu)

end
