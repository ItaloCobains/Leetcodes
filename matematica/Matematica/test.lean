module

public import Mathlib
public meta import ProofWidgets.Component.Basic
public meta import ProofWidgets.Component.HtmlDisplay

public section

theorem th (h : 2 = 2)
  : 2 = 2 :=
    h

def iden (x : Int) : Int := x

#check iden

#check th

theorem th1 (h : 2 = 2)
  : 2 = 2 := by
  exact h

#check th1

theorem th2
  : 2 = 2 := by
    norm_num

#check th2

#check Nat.add_comm 1 2

theorem plus_comm
  : ∀ (a b : Nat), a + b = b + a := by
    intro a b
    have h := Nat.add_comm a b
    exact h

#check plus_comm 1 2

theorem alg
  : ∀ (a b c : Nat), a * (b + c) = a * (c + b) := by
    intro a b c
    have h : b + c = c + b := by
      have g := Nat.add_comm b c
      exact g
    rw [h]

#check alg 1 2 3

theorem alg'
  : ∀ (a b c d : Nat),
    (c + d)^2 + c * (a + b)^2 =
      c^2 + d^2 + 2 * c * d
        + c * a^2 + c * (b^2 + 2*a*b) := by
        intro a b c d
        ring

#check alg' 1 2 3 4

theorem ev10
  : Even 10 := by
    unfold Even
    use 5

theorem two_div_even
  : ∀ n : Nat, Even n -> 2 ∣ n := by
    -- Assume n
    intro n
    -- Assume n is even
    intro n_even
    unfold Even at n_even
    obtain ⟨ r, hr ⟩ := n_even
    have n_eq_2r : n = 2 * r := by
      rw [hr]
      ring
    rw [n_eq_2r]
    simp
