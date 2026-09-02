/-
  E3 · Sets
  ================================

  Almost nothing in this file is new.

    x ∈ s ∩ t    is defined as   x ∈ s ∧ x ∈ t
    x ∈ s ∪ t    is defined as    x ∈ s ∨ x ∈ t
    x ∈ s \ t    is defined as    x ∈ s ∧ ¬(x ∈ t)
    s ⊆ t        is defined as    ∀ x, x ∈ s → x ∈ t

  So every tactic from E1 applies verbatim: `intro` enters a `⊆`, `rcases`
  splits an `∩` or `∪` hypothesis, `left`/`right` pick a side of a `∪`
  goal, `⟨_, _⟩` builds an `∩`. New tactics:

    ext x     to prove two sets equal
    rintro    intro + rcases fused: `rintro x ⟨xs, xt | xu⟩`

  Set exercises adapted from "Mathematics in Lean" by Jeremy Avigad and
  Patrick Massot, Chapter 4 (Sets and Functions) —
  https://github.com/leanprover-community/mathematics_in_lean
  Released under the Apache License 2.0, as is this file.
-/
import Mathlib.Data.Set.Basic
import Mathlib.Tactic
import LeanWidgets.VennPanel

-- Turn the Venn panel on for the rest of the file:
show_panel_widgets [local SetVennPanel]

section
variable {α : Type*} (s t u : Set α)
open Set

/-  0 · Worked example -/

-- Cursor through it and interact with the widget
example (h : s ⊆ t) : s ∩ u ⊆ t ∩ u := by
  intro x xsu
  constructor
  · apply h
    exact xsu.1
  · exact xsu.2

-- 1.1
example : s ∩ t ⊆ s := by
  sorry

-- 1.2  (Membership in a union: `left` / `right` still work.)
example : s ⊆ s ∪ t := by
  sorry

-- 1.3  Distribute. (`rintro x (⟨xs, xt⟩ | ⟨xs, xu⟩)` opens both cases in
--      one line — or `intro` + `rcases`, as in E1.)
example : s ∩ t ∪ s ∩ u ⊆ s ∩ (t ∪ u) := by
  sorry

/-  2 · Set equality -/

-- Worked example: sets are equal when they have the same members — `ext x`
-- turns `s ∩ t = t ∩ s` into an `↔` about one arbitrary `x`.
example : s ∩ t = t ∩ s := by
  ext x
  constructor
  · rintro ⟨xs, xt⟩
    exact ⟨xt, xs⟩
  · rintro ⟨xt, xs⟩
    exact ⟨xs, xt⟩

-- 2.1  Absorption.
example : s ∩ (s ∪ t) = s := by
  sorry

-- 2.2  The other absorption. (Precedence: `∩` binds tighter than `∪`, so
--      the left-hand side reads `s ∪ (s ∩ t)`.)
example : s ∪ s ∩ t = s := by
  sorry

/-  3 · Stretch: set difference -/

-- 3.1  `x ∈ s \ t` unfolds to `x ∈ s ∧ x ∉ t`, and `x ∉ t` is
--      `x ∈ t → False`.
example : s \ (t ∪ u) ⊆ (s \ t) \ u := by
  sorry

/-  Coda -/

-- Automation knows set algebra too:
example : s ∩ t = t ∩ s := by
  ext x
  simp [and_comm]

/- Infinite unions and intersections, images, preimages — and these same
   exercises with full prose — are Mathematics in Lean, Chapter 4.         -/

end
