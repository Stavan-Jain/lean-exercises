/-
  Solutions · E1 (Propositional logic)
-/
import Mathlib.Tactic

section
variable (P Q R : Prop)

-- 1.1
example : P → P := by
  intro hP
  exact hP

-- 1.2  (`_` names a hypothesis we won't use.)
example : P → (Q → P) := by
  intro hP _
  exact hP

-- 1.3  Forwards…
example (hP : P) (hPQ : P → Q) : Q := by
  exact hPQ hP

-- 1.3  …or backwards.
example (hP : P) (hPQ : P → Q) : Q := by
  apply hPQ
  exact hP

-- 1.4
example (hPQ : P → Q) (hQR : Q → R) : P → R := by
  intro hP
  apply hQR
  apply hPQ
  exact hP

-- 2.1
example (h : P ∧ Q) : Q := by
  exact h.right

-- 2.2
example : P ∧ Q → Q ∧ P := by
  intro h
  constructor
  · exact h.right
  · exact h.left

-- 2.3
example (hP : P) (hQ : Q) : P ∧ Q := by
  constructor
  · exact hP
  · exact hQ

-- 2.4
example : (P ∧ Q) ∧ R → P ∧ (Q ∧ R) := by
  intro h
  rcases h with ⟨⟨hP, hQ⟩, hR⟩
  constructor
  · exact hP
  · constructor
    · exact hQ
    · exact hR

-- 2.4  …or, building the result with anonymous constructors directly:
example : (P ∧ Q) ∧ R → P ∧ (Q ∧ R) := by
  intro h
  exact ⟨h.left.left, h.left.right, h.right⟩

-- 3.1
example (hQ : Q) : P ∨ Q := by
  right
  exact hQ

-- 3.2
example : P ∨ Q → Q ∨ P := by
  intro h
  rcases h with hP | hQ
  · right
    exact hP
  · left
    exact hQ

-- 3.3
example : P ∨ P → P := by
  intro h
  rcases h with hP | hP
  · exact hP
  · exact hP

-- 4.1
example : P ∧ Q ↔ Q ∧ P := by
  constructor
  · intro h
    exact ⟨h.right, h.left⟩
  · intro h
    exact ⟨h.right, h.left⟩

-- 5.1  (`¬¬P` is `(P → False) → False`, so `intro` applies.)
example (hP : P) : ¬¬P := by
  intro hn
  exact hn hP

-- 5.2
example : P ∧ (Q ∨ R) → (P ∧ Q) ∨ (P ∧ R) := by
  intro h
  rcases h with ⟨hP, hQR⟩
  rcases hQR with hQ | hR
  · left
    exact ⟨hP, hQ⟩
  · right
    exact ⟨hP, hR⟩

end
