/-
  E6 · Your code
  ==============

  Pick a stabilizer code from the Error Correction Zoo
  (https://errorcorrectionzoo.org) and build it as a `StabilizerCode n k`, exactly as
  in E5.

  WHAT FITS
    a qubit stabilizer code given by explicit Pauli generators
    n − k independent generators: Zoo pages often list redundant ones, and both
      `generators_length := rfl` and independence fail until they are dropped
    n − k ≤ 10 or so: independence is checked by enumerating the 2^(n−k)
      coefficient vectors — `decide` copes up to 6 generators, `decide +kernel`
      up to about 10 (Shor's 8 take a few seconds)

  SOME CANDIDATES
    [[4,2,2]]   ZZZZ, XXXX                          in QECLean
    [[8,3,2]]   the smallest colour code             not in QECLean yet
    [[9,1,3]]   Shor                                 in QECLean, and in Solutions/E6
    [[9,1,3]]   rotated surface code, distance 3     in QECLean
    [[15,7,3]]  quantum Hamming                      in QECLean

  LEMMAS FOR THIS FILE
    GeneratorsIndependent_of_rowsLinearIndependent h
        from h : rowsLinearIndependent gens
    negIdentity_not_mem_of_indep_phase_zero_commute gens hPhase hRows hComm
        −I ∉ ⟨gens⟩, from phase zero, independent rows and pairwise commuting
-/
import QEC.Stabilizer.Framework.Core.Stabilizer.StabilizerCode
import QEC.Stabilizer.Framework.Symplectic.SymplecticSpan
import QEC.Stabilizer.Foundations.PauliGroup.Notation
import QEC.Stabilizer.Foundations.BinarySymplectic.CheckMatrixDecidable
import QECWidgets.CheckMatrix

open Quantum Quantum.StabilizerGroup NQubitPauliGroupElement
open scoped Pauli

-- The shape, with n, k and the literals to fill in:
--
-- namespace E6
--
-- def g1 : NQubitPauliGroupElement n := σ[…]
-- …
--
-- def gens : List (NQubitPauliGroupElement n) := [g1, …]
--
-- #check_matrix gens
--
-- def myCode : StabilizerCode n k := sorry
--
-- end E6
