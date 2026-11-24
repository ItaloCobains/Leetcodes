import LeanPlot
import Mathlib.Analysis.InnerProductSpace.Basic

set_option linter.style.header false
set_option linter.hashCommand false

open LeanPlot
open scoped InnerProductSpace

/-
Aula 2. Pitágoras.

Num espaço com produto interno real, dois vetores perpendiculares cumprem

  ‖x + y‖² = ‖x‖² + ‖y‖²

O ângulo reto é a hipótese `⟪x, y⟫ = 0`. O 3-4-5 é só uma conta, antes da prova.
-/

theorem tres_quatro_cinco : 3 ^ 2 + 4 ^ 2 = 5 ^ 2 := by
  rfl

/-- Os catetos ficam nos eixos. A hipotenusa liga (3, 0) a (0, 4). -/
def triangulo345 : Figure :=
  let xs : FloatArray := ⟨#[0, 3, 0, 0]⟩
  let ys : FloatArray := ⟨#[0, 0, 4, 0]⟩
  Figure.new |>.axis 1 1 (Axis2.new (title := "3-4-5") |>.lines xs ys)

-- Gera `triangulo345.svg` na raiz do projeto. Abra esse arquivo para ver o triângulo.
#eval triangulo345.toScene.save "triangulo345.svg"

noncomputable section

variable {F : Type*} [SeminormedAddCommGroup F] [InnerProductSpace ℝ F]

/-- Se `x` e `y` são perpendiculares, o quadrado da soma é a soma dos quadrados. -/
theorem pitagoras {x y : F} (h : ⟪x, y⟫_ℝ = 0) :
    ‖x + y‖ ^ 2 = ‖x‖ ^ 2 + ‖y‖ ^ 2 := by
  rw [norm_add_sq_real]
  -- ‖x + y‖² = ‖x‖² + 2 * ⟪x, y⟫ + ‖y‖²
  rw [h]
  simp
