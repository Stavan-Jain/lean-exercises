/-
  Solutions · E4 (Quantifiers and parity)
-/
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic

namespace Solutions

example : ∃ n : ℕ, n * n = 144 := by
  use 12

example (h : ∃ n : ℕ, n + 3 = 10) : ∃ m : ℕ, m + 4 = 11 := by
  obtain ⟨n, hn⟩ := h
  use n
  omega

example : ∀ n : ℕ, ∃ m : ℕ, n < m := by
  intro n
  use n + 1
  omega

def IsEven (n : ℕ) : Prop := ∃ k : ℕ, n = k + k

example : IsEven 10 := by
  use 5

example (n : ℕ) : IsEven (2 * n) := by
  use n
  ring

example (m n : ℕ) (hm : IsEven m) (hn : IsEven n) : IsEven (m + n) := by
  obtain ⟨k, hk⟩ := hm
  obtain ⟨l, hl⟩ := hn
  use k + l
  omega

example : ∀ x : ZMod 2, x + x = 0 := by
  decide

example : ∀ x y : ZMod 2, x + y + y = x := by
  decide

example : ∀ x : ZMod 2, x * x = x := by
  decide

end Solutions
