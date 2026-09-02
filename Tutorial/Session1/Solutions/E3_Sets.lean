/-
  Solutions · E3 (Sets)
-/
-- No widget import here: solutions compile independently of the panel.
import Mathlib.Data.Set.Basic
import Mathlib.Tactic

section
variable {α : Type*} (s t u : Set α)
open Set

-- 1.1
example : s ∩ t ⊆ s := by
  intro x hx
  exact hx.1

-- 1.2
example : s ⊆ s ∪ t := by
  intro x xs
  left
  exact xs

-- 1.3
example : s ∩ t ∪ s ∩ u ⊆ s ∩ (t ∪ u) := by
  rintro x (⟨xs, xt⟩ | ⟨xs, xu⟩)
  · exact ⟨xs, Or.inl xt⟩
  · exact ⟨xs, Or.inr xu⟩

-- 2.1
example : s ∩ (s ∪ t) = s := by
  ext x
  constructor
  · rintro ⟨xs, _⟩
    exact xs
  · intro xs
    exact ⟨xs, Or.inl xs⟩

-- 2.2
example : s ∪ s ∩ t = s := by
  ext x
  constructor
  · rintro (xs | ⟨xs, _⟩)
    · exact xs
    · exact xs
  · intro xs
    left
    exact xs

-- 3.1
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
