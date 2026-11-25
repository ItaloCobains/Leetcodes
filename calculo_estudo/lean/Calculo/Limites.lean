import Calculo.Fundamentos
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

set_option linter.style.header false

namespace Calculo

/-
Limite com ε e δ, na vizinhança furada: exige `0 < |x - a|`.
-/

def Limite (f : ℝ → ℝ) (a L : ℝ) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ δ : ℝ, 0 < δ ∧
    ∀ x : ℝ, 0 < |x - a| ∧ |x - a| < δ → |f x - L| < ε

/-- Constante: o valor não se mexe, então qualquer δ serve. -/
theorem limite_const (c a : ℝ) : Limite (fun _ => c) a c := by
  intro ε hε
  refine ⟨1, zero_lt_one, ?_⟩
  intro x _hx
  rw [sub_self, abs_zero]
  exact hε

/-- A identidade tende ao próprio ponto. δ = ε. -/
theorem limite_id (a : ℝ) : Limite (fun x => x) a a := by
  intro ε hε
  refine ⟨ε, hε, ?_⟩
  intro x hx
  exact hx.2

/-
Parte o ε em dois. Cada função erra menos que ε/2, e a triangular soma os erros.
-/
theorem limite_soma {f g : ℝ → ℝ} {a Lf Lg : ℝ}
    (hf : Limite f a Lf) (hg : Limite g a Lg) :
    Limite (fun x => f x + g x) a (Lf + Lg) := by
  intro ε hε
  have hε2 : 0 < ε / 2 := half_pos hε
  obtain ⟨δf, hδf, hf⟩ := hf (ε / 2) hε2
  obtain ⟨δg, hδg, hg⟩ := hg (ε / 2) hε2
  refine ⟨min δf δg, lt_min hδf hδg, ?_⟩
  intro x hx
  have hxf : |f x - Lf| < ε / 2 :=
    hf x ⟨hx.1, lt_of_lt_of_le hx.2 (min_le_left _ _)⟩
  have hxg : |g x - Lg| < ε / 2 :=
    hg x ⟨hx.1, lt_of_lt_of_le hx.2 (min_le_right _ _)⟩
  have htri : |(f x + g x) - (Lf + Lg)| ≤ |f x - Lf| + |g x - Lg| := by
    have heq : (f x + g x) - (Lf + Lg) = (f x - Lf) + (g x - Lg) := by
      ring
    rw [heq]
    exact triangular (f x - Lf) (g x - Lg)
  linarith [add_halves ε]

/-- Somar uma constante traslada o limite. Sai da identidade, da constante e da soma. -/
theorem limite_id_mais_const (c a : ℝ) :
    Limite (fun x => x + c) a (a + c) :=
  limite_soma (limite_id a) (limite_const c a)

/-
A ordem vale para todo `x ≠ a`, sem um δ₀ à parte.
Se `g` e `h` vão a `L`, a função no meio também vai.
-/
theorem limite_confronto {f g h : ℝ → ℝ} {a L : ℝ}
    (hord : ∀ x : ℝ, x ≠ a → g x ≤ f x ∧ f x ≤ h x)
    (hg : Limite g a L) (hh : Limite h a L) : Limite f a L := by
  intro ε hε
  obtain ⟨δg, hδg, hg⟩ := hg ε hε
  obtain ⟨δh, hδh, hh⟩ := hh ε hε
  refine ⟨min δg δh, lt_min hδg hδh, ?_⟩
  intro x hx
  have hxne : x ≠ a := by
    intro hxa
    rw [hxa, sub_self, abs_zero] at hx
    linarith
  have hbet : g x ≤ f x ∧ f x ≤ h x := hord x hxne
  have hgε : |g x - L| < ε :=
    hg x ⟨hx.1, lt_of_lt_of_le hx.2 (min_le_left _ _)⟩
  have hhε : |h x - L| < ε :=
    hh x ⟨hx.1, lt_of_lt_of_le hx.2 (min_le_right _ _)⟩
  rw [abs_lt] at hgε hhε ⊢
  constructor
  · linarith
  · linarith

end Calculo
