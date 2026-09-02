/-
  E1 · Propositional logic
  ========================

  Replace every `sorry` with a proof. You are done with a file when it has
  no red squiggles and no `sorry`s left.

  TACTICS FOR THIS FILE
    intro h        assume the premise of a `→` (or `¬`), naming it `h`
    exact h        close the goal: `h` proves exactly what is asked
    apply f        reduce the goal `Q` to `P` when `f : P → Q`
    constructor    split an `∧` (or `↔`) GOAL into its two halves
    rcases h with ⟨h₁, h₂⟩    take apart an `∧` HYPOTHESIS
    rcases h with h₁ | h₂     case-split on an `∨` HYPOTHESIS
    left / right   choose which side of an `∨` GOAL to prove

  Adapted from "Mathematics in Lean" by Jeremy Avigad and Patrick Massot,
  Chapter 3 (Logic) — https://github.com/leanprover-community/mathematics_in_lean
  Released under the Apache License 2.0, as is this file.
-/
import Mathlib.Tactic

section
variable (P Q R : Prop)

/-  0 · Setup check -/

-- Nothing to prove here: put the cursor at the end of the `exact hP` line.
-- If the Tactic State panel says `No goals`, your setup works.
-- (First open of the file loads mathlib — give it ~30 seconds.)
example (hP : P) : P := by
  exact hP

/-  1 · Implication  -/

-- 1.1 (`intro`, then `exact`.)
example : P → P := by
  sorry

-- 1.2
example : P → (Q → P) := by
  sorry

-- 1.3  Modus ponens.
example (hP : P) (hPQ : P → Q) : Q := by
  sorry

-- 1.4  Composition.
example (hPQ : P → Q) (hQR : Q → R) : P → R := by
  sorry

/-  2 · And -/

-- A worked example: an `∧` HYPOTHESIS gives you `.left` and `.right`.
example (h : P ∧ Q) : P := by
  exact h.left

-- 2.1
example (h : P ∧ Q) : Q := by
  sorry

-- 2.2
example : P ∧ Q → Q ∧ P := by
  sorry

-- 2.3  Building an `∧`: `constructor` splits the goal in two.
example (hP : P) (hQ : Q) : P ∧ Q := by
  sorry

-- 2.4  Patterns nest: `rcases h with ⟨⟨hP, hQ⟩, hR⟩` takes this apart in
--      one step.
example : (P ∧ Q) ∧ R → P ∧ (Q ∧ R) := by
  sorry

/-  3 · Or -/

-- A worked example: to PROVE an `∨`, commit to one side.
example (hP : P) : P ∨ Q := by
  left
  exact hP

-- 3.1
example (hQ : Q) : P ∨ Q := by
  sorry

-- 3.2  To USE an `∨` you must handle both cases.
example : P ∨ Q → Q ∨ P := by
  sorry

-- 3.3
example : P ∨ P → P := by
  sorry

/-  4 · Iff -/

-- 4.1  `constructor` splits `↔` into `→` and `←`. You can also BUILD an ∧
--      directly: `exact ⟨h.right, h.left⟩`.
example : P ∧ Q ↔ Q ∧ P := by
  sorry

/-  5 · Stretch -/

-- 5.1  `¬P` is definitionally `P → False` — so this is 1.3 in disguise.
example (hP : P) : ¬¬P := by
  sorry

-- 5.2  Capstone: everything at once.
example : P ∧ (Q ∨ R) → (P ∧ Q) ∨ (P ∧ R) := by
  sorry

/- Everything in this file is one tactic away: `tauto` decides propositional
   logic -/
example : P ∧ (Q ∨ R) → (P ∧ Q) ∨ (P ∧ R) := by
  tauto

end
