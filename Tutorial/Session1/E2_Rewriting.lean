/-
  E2 · Equalities and rewriting
  =============================

  This file focuses on the `rw` tactic, which uses an equality (a
  hypothesis or a library lemma) to replace its LHS with its RHS in the
  goal.

  TACTICS FOR THIS FILE
    rw [thm]        rewrite the goal left-to-right with the equality `thm`
    rw [← thm]      …right-to-left (type \l for ←)
    rw [thm] at h   rewrite inside hypothesis `h` instead of the goal
    calc            chain a computation through intermediate steps
    ring            close ANY identity that holds in every commutative ring

  Rewriting is directed: `mul_comm a b : a * b = b * a` turns `a * b` into
  `b * a` where it appears in the goal. Hover over any lemma name to see its statement, and use `exact?` / `rw?` to make Lean suggest one.

  Adapted from "Mathematics in Lean" by Jeremy Avigad and Patrick Massot,
  Chapter 2 (Basics) — https://github.com/leanprover-community/mathematics_in_lean
  Released under the Apache License 2.0, as is this file.
-/
import Mathlib.Data.Real.Basic
import Mathlib.Tactic

section
variable (a b c d e f : ℝ)

/-  1 · rw -/

-- Worked example — cursor through it and watch the goal change:
example : a * b * c = b * (a * c) := by
  rw [mul_comm a b]
  rw [mul_assoc b a c]

-- place the cursor after `#check` to see the definitions of these lemmas
#check mul_comm
#check mul_assoc

-- 1.1
example : c * b * a = b * (a * c) := by
  sorry

-- 1.2  (`←` is useful here)
example : a * (b * c) = b * (a * c) := by
  sorry

/-  2 · Rewriting with hypotheses -/

-- Worked example — equalities in your context work exactly like library
-- lemmas:
example (h : a * b = c * d) (h' : e = f) : a * (b * e) = c * (d * f) := by
  rw [h']
  rw [← mul_assoc]
  rw [h]
  rw [mul_assoc]

-- 2.1
example (h : b * c = e * f) : a * b * c * d = a * e * f * d := by
  sorry

-- 2.2
example (hyp : c = b * a - d) (hyp' : d = a * b) : c = 0 := by
  sorry

#check sub_self

/-  3 · calc: proofs that read like math -/

-- Worked example:
example : (a + b) * (a + b) = a * a + 2 * (a * b) + b * b := by
  rw [mul_add, add_mul, add_mul]
  rw [← add_assoc, add_assoc (a * a)]
  rw [mul_comm b a, ← two_mul]

-- 3.1  worked example as a calc block:
example : (a + b) * (a + b) = a * a + 2 * (a * b) + b * b :=
  calc
    (a + b) * (a + b) = a * a + b * a + (a * b + b * b) := by
      sorry
    _ = a * a + (b * a + a * b) + b * b := by
      sorry
    _ = a * a + 2 * (a * b) + b * b := by
      sorry

/-  4 · the ring tactic -/

-- Identities in commutative rings are decidable, and `ring` decides them:
example : c * b * a = b * (a * c) := by
  ring

-- 4.1
example : (a + b) * (c + d) = a * c + a * d + b * c + b * d := by
  sorry

-- 4.2  `ring` can't see your hypotheses, `rw` them in first.
example (hyp : c = d * a + b) (hyp' : b = a * d) : c = 2 * a * d := by
  sorry

end
