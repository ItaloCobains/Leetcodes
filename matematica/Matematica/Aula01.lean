/-
Aula 1. Números naturais e igualdade.

A soma de naturais recursa no segundo argumento:

  n + 0     = n
  n + (m+1) = (n + m) + 1

Por isso `n + 0` fecha por cálculo. `0 + n` não reduz, e a prova é por indução.
-/

/-- O segundo argumento é zero, então a definição já devolve `n`. -/
theorem add_zero (n : Nat) : n + 0 = n := by
  rfl

/-- O primeiro argumento é zero. Indução em `n`. -/
theorem zero_add (n : Nat) : 0 + n = n := by
  induction n with
  | zero =>
    rfl
  | succ n ih =>
    calc
      0 + (n + 1) = (0 + n) + 1 := by rw [Nat.add_succ]
      _ = n + 1 := by rw [ih]

/-
Sua vez.

Prove que somar 1 à esquerda atravessa a soma:

  (n + 1) + m = (n + m) + 1

Induza em `m`. No passo, `Nat.add_succ` reescreve `a + (b + 1)` como `(a + b) + 1`.
Não use `Nat.succ_add`: esse lema é exatamente o que você está provando.
-/
theorem succ_add (n m : Nat) : (n + 1) + m = (n + m) + 1 := by
  induction m with
  | zero =>
    rfl
  | succ m ih =>
    calc
      (n + 1) + (m + 1) = ((n + 1) + m) + 1 := by rw [Nat.add_succ]
      _ = ((n + m) + 1) + 1 := by rw [ih]
      _ = (n + m) + 1 + 1 := by rw [Nat.add_succ]
