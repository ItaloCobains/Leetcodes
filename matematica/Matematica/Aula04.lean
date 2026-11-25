import Mathlib.Analysis.Calculus.Deriv.Pow

set_option linter.style.header false

/-
Aula 4. Derivada.

`deriv f x` é a derivada de `f : ℝ → ℝ` no ponto `x`.
A regra da potência: a derivada de `t ↦ t ^ n` em `x` é `n * x ^ (n - 1)`.

`deriv` devolve `0` quando a derivada não existe. Aqui ela existe.
-/

/-- `(x²)' = 2x`. `deriv_pow` devolve `2 * x ^ 1`; `pow_one` reduz o expoente. -/
theorem deriv_x2 (x : ℝ) : deriv (fun t : ℝ => t ^ 2) x = 2 * x := by
  simpa [pow_one] using deriv_pow 2 x

/-- `(x³)' = 3x²`. -/
theorem deriv_x3 (x : ℝ) : deriv (fun t : ℝ => t ^ 3) x = 3 * x ^ 2 := by
  simpa using deriv_pow 3 x

/-
Sua vez. A derivada de `t ↦ t ^ 4` em `x` é `4 * x ^ 3`.
`simpa using deriv_pow 4 x` fecha.
-/
theorem deriv_x4 (x : ℝ) : deriv (fun t : ℝ => t ^ 4) x = 4 * x ^ 3 := by
  simpa using deriv_pow 4 x
