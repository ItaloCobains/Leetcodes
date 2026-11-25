import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring

set_option linter.style.header false

namespace Calculo

/-
Soma finita da geométrica, sem dividir por `1 - r`.
Se `|r| < 1`, a soma infinita vale `1 / (1 - r)`; isso fica de fora.
-/

theorem soma_geometrica (r : ℝ) (n : ℕ) :
    (1 - r) * ∑ k ∈ Finset.range n, r ^ k = 1 - r ^ n := by
  induction n with
  | zero =>
    simp [pow_zero]
  | succ n ih =>
    rw [Finset.sum_range_succ, mul_add, ih]
    ring

end Calculo
