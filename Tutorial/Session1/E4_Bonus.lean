/-
  E4 · Bonus: quantifiers and parity
  ==================================

  Two new things.

  1. quantifiers: you prove `∀ x, …` by fixing an arbitrary `x` with
  `intro x`. You use a `∀` hypothesis by feeding it a value
  (`h 3`, or `apply h`). You prove `∃ n, …` by supplying a concrete
  witness (`use`), and you use such a hypothesis by extracting its
  witness (`obtain`).

  2. finiteness: a `∀` over a finite type can
  be proved by checking every case. The `decide` tactic does exactly that. The
  finite type here is `ZMod 2` — the integers mod 2.

  NEW TACTICS
    use x               prove `∃ n, …` by exhibiting the witness `x`
    obtain ⟨k, hk⟩ := h  extract witness `k` + fact `hk` from `h : ∃ n, …`
    omega               uses a decision procedure for linear arithmetic over ℕ/ℤ
    decide              checks a decidable statement via a decision procedure
    ring                works on ℕ too (it is a commutative semiring)

  Quantifier treatment adapted from "Mathematics in Lean" (Avigad & Massot),
  Chapter 3 — https://github.com/leanprover-community/mathematics_in_lean
  Released under the Apache License 2.0, as is this file.
-/
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic

/-  1 · Exists -/

-- Worked example: to prove an `∃`, hand over a witness. (`use` also
-- finishes easy leftover goals like `4 * 4 = 16` on its own; when
-- something remains, `norm_num` or `omega` usually closes arithmetic.)
example : ∃ n : ℕ, n * n = 16 := by
  use 4

-- 1.1
example : ∃ n : ℕ, n * n = 144 := by
  sorry

-- 1.2  Using an ∃: `obtain` the witness from `h`, then reuse it.
example (h : ∃ n : ℕ, n + 3 = 10) : ∃ m : ℕ, m + 4 = 11 := by
  sorry

-- 1.3  ∀ and ∃ together.
example : ∀ n : ℕ, ∃ m : ℕ, n < m := by
  sorry

/-  2 · IsEven -/

-- The definition from the talk.
def IsEven (n : ℕ) : Prop := ∃ k : ℕ, n = k + k

-- 2.1
example : IsEven 10 := by
  sorry

-- 2.2
example (n : ℕ) : IsEven (2 * n) := by
  sorry

-- 2.3  Evens are closed under addition.
example (m n : ℕ) (hm : IsEven m) (hn : IsEven n) : IsEven (m + n) := by
  sorry

/-  3 · Parity -/

-- `ZMod 2` is the two-element field 𝔽₂ where `+` is XOR.
example : (1 : ZMod 2) + 1 = 0 := by
  decide

-- 3.1
example : ∀ x : ZMod 2, x + x = 0 := by
  sorry

-- 3.2
example : ∀ x y : ZMod 2, x + y + y = x := by
  sorry

-- 3.3
example : ∀ x : ZMod 2, x * x = x := by
  sorry

/-  Where to go next
   · Mathematics in Lean (the source of much of today's material):
     https://leanprover-community.github.io/mathematics_in_lean/
   · The Natural Number Game — build ℕ from scratch, in the browser:
     https://adam.math.hhu.de
   · The Lean community Zulip (#new members) — friendly and fast:
     https://leanprover.zulipchat.com                                       -/
