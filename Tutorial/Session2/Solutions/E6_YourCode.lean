/-
  Solutions · E6 (Your code) — a worked example: Shor's [[9, 1, 3]] code
-/
import QEC.Stabilizer.Framework.Core.Stabilizer.StabilizerCode
import QEC.Stabilizer.Framework.Symplectic.SymplecticSpan
import QEC.Stabilizer.Foundations.PauliGroup.Notation
import QEC.Stabilizer.Foundations.BinarySymplectic.CheckMatrixDecidable
import QECWidgets.CheckMatrix

open Quantum Quantum.StabilizerGroup NQubitPauliGroupElement
open scoped Pauli

namespace Solutions.E6

def M1 : NQubitPauliGroupElement 9 := σ[ZZIIIIIII]
def M2 : NQubitPauliGroupElement 9 := σ[IZZIIIIII]
def M3 : NQubitPauliGroupElement 9 := σ[IIIZZIIII]
def M4 : NQubitPauliGroupElement 9 := σ[IIIIZZIII]
def M5 : NQubitPauliGroupElement 9 := σ[IIIIIIZZI]
def M6 : NQubitPauliGroupElement 9 := σ[IIIIIIIZZ]
def M7 : NQubitPauliGroupElement 9 := σ[XXXXXXIII]
def M8 : NQubitPauliGroupElement 9 := σ[IIIXXXXXX]

def gens : List (NQubitPauliGroupElement 9) := [M1, M2, M3, M4, M5, M6, M7, M8]

#check_matrix gens

theorem gens_commute : ∀ g ∈ gens, ∀ h ∈ gens, g * h = h * g := by
  decide

theorem gens_phaseZero : AllPhaseZero gens := by
  decide

theorem gens_rows : rowsLinearIndependent gens := by
  decide +kernel

def shor : StabilizerCode 9 1 := {
  hk := by decide
  generatorsList := gens
  generators_length := rfl
  generators_phaseZero := gens_phaseZero
  generators_independent := GeneratorsIndependent_of_rowsLinearIndependent gens_rows
  generators_commute := gens_commute
  closure_no_neg_identity :=
    negIdentity_not_mem_of_indep_phase_zero_commute gens gens_phaseZero gens_rows gens_commute
}

#print axioms shor

end Solutions.E6
