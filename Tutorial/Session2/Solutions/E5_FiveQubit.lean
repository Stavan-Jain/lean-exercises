/-
  Solutions · E5 (The five-qubit code)
-/
import QEC.Stabilizer.Framework.Core.Stabilizer.StabilizerCode
import QEC.Stabilizer.Framework.Symplectic.SymplecticSpan
import QEC.Stabilizer.Foundations.PauliGroup.Notation
import QEC.Stabilizer.Foundations.BinarySymplectic.CheckMatrixDecidable
import QEC.Stabilizer.Codes.Small.FiveQubit_5_1_3
import QECWidgets.CheckMatrix

open Quantum Quantum.StabilizerGroup NQubitPauliGroupElement
open scoped Pauli

namespace Solutions.E5

def g1 : NQubitPauliGroupElement 5 := σ[XZZXI]
def g2 : NQubitPauliGroupElement 5 := σ[IXZZX]
def g3 : NQubitPauliGroupElement 5 := σ[XIXZZ]
def g4 : NQubitPauliGroupElement 5 := σ[ZXIXZ]

def gens : List (NQubitPauliGroupElement 5) := [g1, g2, g3, g4]

#check_matrix gens

theorem gens_commute : ∀ g ∈ gens, ∀ h ∈ gens, g * h = h * g := by
  decide

theorem gens_phaseZero : AllPhaseZero gens := by
  decide

theorem gens_rows : rowsLinearIndependent gens := by
  decide

def fiveQubit : StabilizerCode 5 1 := {
  hk := by decide
  generatorsList := gens
  generators_length := rfl
  generators_phaseZero := gens_phaseZero
  generators_independent := GeneratorsIndependent_of_rowsLinearIndependent gens_rows
  generators_commute := gens_commute
  closure_no_neg_identity :=
    negIdentity_not_mem_of_indep_phase_zero_commute gens gens_phaseZero gens_rows gens_commute
}

#print axioms fiveQubit

theorem fiveQubit_distance : HasCodeDistance fiveQubit 3 := by
  unfold HasCodeDistance
  exact FiveQubit_5_1_3.code_has_distance_three

#print axioms fiveQubit_distance

end Solutions.E5
