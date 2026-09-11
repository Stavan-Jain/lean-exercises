/-
  Solutions · E1 (Propositional logic)
-/
import Mathlib.Tactic

section
variable (P Q R : Prop)

example : P → P := by
  intro hP
  exact hP

example : P → (Q → P) := by
  intro hP _
  exact hP

example (hP : P) (hPQ : P → Q) : Q := by
  exact hPQ hP

example (hP : P) (hPQ : P → Q) : Q := by
  apply hPQ
  exact hP

example (hPQ : P → Q) (hQR : Q → R) : P → R := by
  intro hP
  apply hQR
  apply hPQ
  exact hP

example (h : P ∧ Q) : Q := by
  exact h.right

example : P ∧ Q → Q ∧ P := by
  intro h
  constructor
  · exact h.right
  · exact h.left

example (hP : P) (hQ : Q) : P ∧ Q := by
  constructor
  · exact hP
  · exact hQ

example : (P ∧ Q) ∧ R → P ∧ (Q ∧ R) := by
  intro h
  rcases h with ⟨⟨hP, hQ⟩, hR⟩
  constructor
  · exact hP
  · constructor
    · exact hQ
    · exact hR

example : (P ∧ Q) ∧ R → P ∧ (Q ∧ R) := by
  intro h
  exact ⟨h.left.left, h.left.right, h.right⟩

example (hQ : Q) : P ∨ Q := by
  right
  exact hQ

example : P ∨ Q → Q ∨ P := by
  intro h
  rcases h with hP | hQ
  · right
    exact hP
  · left
    exact hQ

example : P ∨ P → P := by
  intro h
  rcases h with hP | hP
  · exact hP
  · exact hP

example : P ∧ Q ↔ Q ∧ P := by
  constructor
  · intro h
    exact ⟨h.right, h.left⟩
  · intro h
    exact ⟨h.right, h.left⟩

example (hP : P) : ¬¬P := by
  intro hn
  exact hn hP

example : P ∧ (Q ∨ R) → (P ∧ Q) ∨ (P ∧ R) := by
  intro h
  rcases h with ⟨hP, hQR⟩
  rcases hQR with hQ | hR
  · left
    exact ⟨hP, hQ⟩
  · right
    exact ⟨hP, hR⟩

end
