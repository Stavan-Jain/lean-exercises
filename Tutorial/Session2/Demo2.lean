/-
  # Demo 2
-/

import QEC.Foundations.Gates
import QEC.Stabilizer.Codes.Small.Steane7Distance
import QECWidgets.CheckMatrix

open Quantum Quantum.StabilizerGroup NQubitPauliGroupElement
open scoped Pauli

/-
      ⎡ 1 1 1 0 1 0 0 ⎤
  H = ⎢ 1 1 0 1 0 1 0 ⎥
      ⎣ 1 0 1 1 0 0 1 ⎦
-/
def Z1 : NQubitPauliGroupElement 7 := σ[ZZZIZII]
def Z2 : NQubitPauliGroupElement 7 := σ[ZZIZIZI]
def Z3 : NQubitPauliGroupElement 7 := σ[ZIZZIIZ]
def X1 : NQubitPauliGroupElement 7 := σ[XXXIXII]
def X2 : NQubitPauliGroupElement 7 := σ[XXIXIXI]
def X3 : NQubitPauliGroupElement 7 := σ[XIXXIIX]

def gens : List (NQubitPauliGroupElement 7) := [Z1, Z2, Z3, X1, X2, X3]

#check_matrix gens

example : Z1 * X1 = X1 * Z1 := by
  decide

-- Every pair: 36 equalities between literals. `decide` checks them all, as it
-- checked the sixteen `sameColor` cases this morning.
theorem gens_commute : ∀ g ∈ gens, ∀ h ∈ gens, g * h = h * g := by
  decide

-- No generator carries a phase.
theorem gens_phaseZero : AllPhaseZero gens := by
  decide

-- The six rows of the check matrix are linearly independent over 𝔽₂.
theorem gen_rows_independent : rowsLinearIndependent gens := by
  decide

theorem gens_independent : GeneratorsIndependent 7 gens :=
  GeneratorsIndependent_of_rowsLinearIndependent gen_rows_independent

theorem closure_no_neg_identity : negIdentity 7 ∉ Subgroup.closure (listToSet gens) :=
  negIdentity_not_mem_of_indep_phase_zero_commute gens gens_phaseZero gen_rows_independent gens_commute

def steane : StabilizerCode 7 1 := {
  hk := by decide
  generatorsList := gens
  generators_length := rfl
  generators_phaseZero := gens_phaseZero
  generators_independent := gens_independent
  generators_commute := gens_commute
  closure_no_neg_identity := closure_no_neg_identity
}

#print axioms steane

theorem steane_distance : HasCodeDistance steane 3 := by
  unfold HasCodeDistance
  exact Steane7.code_has_distance_three

#print axioms steane_distance
