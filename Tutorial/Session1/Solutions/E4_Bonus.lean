/-
  Solutions · E4 (Quantifiers and parity)
-/
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic

-- The namespace keeps this file's `IsEven` from clashing with the one
-- defined in E3_Bonus.lean when both are imported together.
namespace Solutions

-- 1.1  (`use` closes the leftover `12 * 12 = 144` on its own.)
example : ∃ n : ℕ, n * n = 144 := by
  use 12

-- 1.2
example (h : ∃ n : ℕ, n + 3 = 10) : ∃ m : ℕ, m + 4 = 11 := by
  obtain ⟨n, hn⟩ := h
  use n
  omega

-- 1.3
example : ∀ n : ℕ, ∃ m : ℕ, n < m := by
  intro n
  use n + 1
  omega

def IsEven (n : ℕ) : Prop := ∃ k : ℕ, n = k + k

-- 2.1
example : IsEven 10 := by
  use 5

-- 2.2
example (n : ℕ) : IsEven (2 * n) := by
  use n
  ring

-- 2.3
example (m n : ℕ) (hm : IsEven m) (hn : IsEven n) : IsEven (m + n) := by
  obtain ⟨k, hk⟩ := hm
  obtain ⟨l, hl⟩ := hn
  use k + l
  omega

-- 3.1
example : ∀ x : ZMod 2, x + x = 0 := by
  decide

-- 3.2
example : ∀ x y : ZMod 2, x + y + y = x := by
  decide

-- 3.3
example : ∀ x : ZMod 2, x * x = x := by
  decide

end Solutions
