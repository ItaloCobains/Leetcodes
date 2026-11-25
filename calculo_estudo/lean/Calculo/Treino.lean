import Calculo.Derivada
import Calculo.Limites
import Calculo.Series

set_option linter.style.header false

namespace Calculo

/-
Três enunciados para fechar. A linha de cima de cada um é a tática.
-/

-- exato: exact limite_id_mais_const 3 a
theorem limite_x_mais_3 (a : ℝ) : Limite (fun x => x + 3) a (a + 3) := by
  sorry

-- exato: exact soma_geometrica (2 : ℝ) 3
theorem geom_dois_tres :
    (1 - (2 : ℝ)) * ∑ k ∈ Finset.range 3, (2 : ℝ) ^ k = 1 - (2 : ℝ) ^ 3 := by
  sorry

-- exato: exact deriv_id 5
theorem deriv_id_em_5 : DerivNoPonto (fun x => x) 5 1 := by
  sorry

end Calculo
