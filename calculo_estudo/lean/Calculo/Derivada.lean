import Calculo.Limites
import Mathlib.Algebra.Order.Ring.Abs
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Set

set_option linter.style.header false

namespace Calculo

/-
A derivada de `f` no ponto `a` é o limite do quociente, com acréscimo `h → 0`.
-/

def DerivNoPonto (f : ℝ → ℝ) (a L : ℝ) : Prop :=
  Limite (fun h => (f (a + h) - f a) / h) 0 L

/-- A identidade tem derivada `1` em qualquer ponto. -/
theorem deriv_id (a : ℝ) : DerivNoPonto (fun x => x) a 1 := by
  intro ε hε
  refine ⟨1, zero_lt_one, ?_⟩
  intro t ht
  have ht0 : 0 < |t| := by simpa [sub_zero] using ht.1
  have tne : t ≠ 0 := abs_pos.mp ht0
  -- O quociente ainda está aplicado na função; `dsimp` faz o β.
  dsimp
  have hsub : (a + t) - a = t := by ring
  have hdiv : t / t = 1 := by field_simp [tne]
  rw [hsub, hdiv, sub_self, abs_zero]
  exact hε

/-
Do quociente com ε = 1 sai `|f(a+h) - f(a)| < (|L| + 1) |h|`.
O δ corta `|h|` em `ε / (|L| + 1)`. `|L| + 1` é sempre positivo.
-/
theorem derivada_implica_continua {f : ℝ → ℝ} {a L : ℝ}
    (hD : DerivNoPonto f a L) : Limite f a (f a) := by
  intro ε hε
  obtain ⟨δ1, hδ1, hq⟩ := hD 1 zero_lt_one
  have hM : 0 < |L| + 1 := by linarith [abs_nonneg L]
  have hεM : 0 < ε / (|L| + 1) := div_pos hε hM
  refine ⟨min δ1 (ε / (|L| + 1)), lt_min hδ1 hεM, ?_⟩
  intro x hx
  generalize ht : x - a = t
  have ht0 : 0 < |t| := by simpa [ht] using hx.1
  have htδ : |t| < min δ1 (ε / (|L| + 1)) := by simpa [ht] using hx.2
  have htδ1 : |t| < δ1 := lt_of_lt_of_le htδ (min_le_left _ _)
  have htε : |t| < ε / (|L| + 1) := lt_of_lt_of_le htδ (min_le_right _ _)
  have tne : t ≠ 0 := abs_pos.mp ht0
  have hqh : |(f (a + t) - f a) / t - L| < 1 :=
    hq t (by simpa [sub_zero] using And.intro ht0 htδ1)
  set q : ℝ := (f (a + t) - f a) / t with hqdef
  have hle : |q| ≤ |q - L| + |L| := by
    conv_lhs => rw [← sub_add_cancel q L]
    exact triangular (q - L) L
  have hquot : |q| < |L| + 1 := by
    linarith [hle, hqh]
  have habs : |f (a + t) - f a| = |q| * |t| := by
    have hmul : q * t = f (a + t) - f a := by
      rw [hqdef]
      field_simp [tne]
    rw [← hmul, abs_mul]
  have hxeq : x = a + t := by
    rw [← ht]
    ring
  rw [hxeq]
  calc
    |f (a + t) - f a| = |q| * |t| := habs
    _ < (|L| + 1) * |t| := mul_lt_mul_of_pos_right hquot ht0
    _ < (|L| + 1) * (ε / (|L| + 1)) := mul_lt_mul_of_pos_left htε hM
    _ = ε := by field_simp [ne_of_gt hM]

end Calculo
