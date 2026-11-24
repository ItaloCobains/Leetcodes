import Mathlib.Algebra.QuadraticDiscriminant

set_option linter.style.header false

/-
Aula 3. Bhaskara.

A equação `a x² + b x + c = 0`, com `a ≠ 0`, tem raiz exatamente quando
existe um `s` com `s² = b² - 4ac`. Aí as raízes são

  x = (-b + s) / (2a)    ou    x = (-b - s) / (2a).

`discrim a b c` é esse `b² - 4ac`.
-/

theorem baskara {K : Type*} [Field K] [NeZero (2 : K)] {a b c s x : K}
    (ha : a ≠ 0) (h : discrim a b c = s * s) :
    a * x ^ 2 + b * x + c = 0 ↔
      x = (-b + s) / (2 * a) ∨ x = (-b - s) / (2 * a) := by
  simpa [sq] using quadratic_eq_zero_iff (a := a) (b := b) (c := c) ha h x

/-- `x² - 5x + 6 = 0` tem discriminante `1 = 1 * 1`. -/
theorem discrim_exemplo : discrim (1 : ℚ) (-5) 6 = 1 * 1 := by
  simp [discrim]
  norm_num

/-- A fórmula devolve as raízes `3` e `2`. -/
theorem raizes_exemplo :
    (-(-5 : ℚ) + 1) / (2 * 1) = 3 ∧ (-(-5 : ℚ) - 1) / (2 * 1) = 2 := by
  norm_num
