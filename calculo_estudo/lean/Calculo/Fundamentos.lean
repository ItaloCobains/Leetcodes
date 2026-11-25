import Mathlib.Algebra.Order.Group.Abs
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Linarith

set_option linter.style.header false

namespace Calculo

/-
O módulo da soma não passa da soma dos módulos.
O erro de uma soma cabe na soma dos erros.
-/

theorem triangular (x y : ℝ) : |x + y| ≤ |x| + |y| := by
  rw [abs_le]
  constructor
  · have hx : -|x| ≤ x := neg_abs_le x
    have hy : -|y| ≤ y := neg_abs_le y
    linarith
  · have hx : x ≤ |x| := le_abs_self x
    have hy : y ≤ |y| := le_abs_self y
    linarith

end Calculo
