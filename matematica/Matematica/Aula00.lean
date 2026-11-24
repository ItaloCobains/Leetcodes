/-
Aula 0. A linguagem.

Cada linha declara um nome e um tipo. O Lean só aceita a linha se o termo tem esse tipo.
Um erro é a linha recusada: o termo não tem o tipo pedido, ou o nome não existe.
`sorry` habita qualquer tipo. A linha passa, e o Lean avisa que ainda falta conteúdo.
-/

-- Valor com o tipo escrito à direita.
def dois : Nat := 2
def ligado : Bool := true

-- Tipo novo, com dois construtores.
inductive Cor where
  | vermelho
  | azul

def favorita : Cor := Cor.vermelho

-- Função. O argumento vai entre parênteses; o corpo depois de `:=`.
def dobro (n : Nat) : Nat := n + n

-- Aplicação é justaposição.
def quatro : Nat := dobro dois

-- Função sem nome. `Nat → Nat` é o tipo "recebe um Nat e devolve um Nat".
def sucessor : Nat → Nat := fun n => n + 1

-- Descomente. O InfoView marca o erro: `true` tem tipo `Bool`, e aqui se pediu `Nat`.
-- def errado : Nat := true

/-
Sua vez. `triplo n` vale `n + n + n`.
-/
def triplo (n : Nat) : Nat := n * 3

/-
InfoView.

Com a extensão Lean 4, o painel abre ao lado do editor quando este arquivo está ativo.
Se estiver fechado: paleta de comandos, "Lean 4: Toggle Infoview".

Na posição do cursor ele mostra o tipo esperado, o contexto (nomes já introduzidos),
a meta (dentro de `by`) e o erro, quando a linha não fecha.

`zero_mais_zero` já está provado. Cursor em `rfl`: não há meta.
Cursor em `sorry`, logo abaixo: a meta é `1 + 0 = 1`.
Troque esse `sorry` por `rfl`. A meta some, porque `1 + 0` calcula e vira `1`.
-/

theorem zero_mais_zero : 0 + 0 = 0 := by
  rfl

theorem um_mais_zero : 1 + 0 = 1 := by
  rfl
