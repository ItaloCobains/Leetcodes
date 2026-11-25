# Guia de estudo ativo

O material está em `calculo_estudo/`. Cada nota é um `.tex` com a teoria. O gabarito é outro arquivo. A figura que a nota cita está em `figuras/`. O Lean está em `lean/` e compila pelo projeto `matematica/`.

Mapa curto: `PLANO_MESTRE.md`.

## Ciclo de um dia

Uma sentada, um bloco só. Não avance de módulo com a prova central do anterior ainda por escrever.

1. Leia a seção **Base para relembrar** e feche o arquivo. Escreva de memória as duas ou três fórmulas que vão ser usadas.
2. Leia uma definição e pare. Diga em voz alta o que o quantificador pede e o que acontece se uma hipótese sai.
3. Leia uma prova com o papel ao lado. Feche a nota e reescreva a prova. Onde travar, abra só o esqueleto, não o gabarito.
4. Olhe a figura do módulo, ou mude um número no script e rode de novo. A pergunta é sempre a mesma: o que a hipótese está impedindo de quebrar.
5. Faça os exercícios **Básico**, depois um **Intermediário**. O gabarito entra quando a tentativa está escrita e você travou num passo nomeável, não quando a conta ficou desconfortável.
6. No fim da semana do módulo, uma prova do `cadernos_de_prova/`, do zero, sem a nota aberta. Compare com o `*_solucao.tex`.

O gabarito ao lado da tentativa estraga o treino. O gabarito depois de uma tentativa errada é o treino.

## Primeiro passo

Abra `00_revisao_base/01_desigualdades.tex`.

Hoje só isto:

- a definição de valor absoluto e a tradução `\abs{x-2}<1` como intervalo;
- a prova da desigualdade triangular, copiada uma vez com a nota aberta e uma vez com a nota fechada;
- os exercícios básicos desse arquivo;
- o item (1) de `cadernos_de_prova/00_triangular_cauchy.tex`.

Não abra `01_limites.tex` nesta sentada. O ε-δ desse arquivo é a mesma desigualdade, e ele não espera por você se a absoluta ainda estiver instável.

A figura `figuras/abs_e_intervalos.png` é o desenho dessa primeira desigualdade.

## Ordem

1. `00_revisao_base/01_desigualdades.tex`
2. `02_funcoes.tex` — logaritmo a partir dos axiomas da exponencial, não de uma tabela.
3. `03_trigonometria.tex` e `04_vetores_conicas.tex`. O caderno `00_triangular_cauchy.tex` fecha a revisão: triangular, diferença dos módulos, Cauchy–Schwarz, norma.
4. `01_calculo_1/01_limites.tex` e, em paralelo no papel, `cadernos_de_prova/01_epsilon_delta.tex`. Um δ por dia.
5. `02_continuidade.tex`. O valor intermediário e Weierstrass. Anote os contraexemplos em que o intervalo não é fechado.
6. `03_derivadas.tex`. Primeiro pela definição. A regra da cadeia só depois de `derivável ⇒ contínua` e dos dois contraexemplos (`\abs{x}` e `x\sin(1/x)`).
7. `04_aplicacoes_derivada.tex` e `05_integral_riemann_tfc.tex`, com o caderno `02_rolle_mvt_tfc.tex`.
8. Cálculo II, nesta ordem: técnicas, paramétricas e polares, sequências e séries, Taylor, curvas no espaço. Caderno `03_series_taylor.tex` quando a geométrica e o resto de Lagrange estiverem escritos.
9. Cálculo III: funções de várias variáveis, derivadas e gradiente, Lagrange, integrais múltiplas, linha, Green–Stokes–Gauss. Caderno `04_green_stokes_gauss.tex` por último.

Séries ficam no Cálculo II de propósito. O Cálculo I acaba na substituição simples.

## O que repetir no Lean

Os arquivos estão em `calculo_estudo/lean/`. Eles usam a mathlib que o projeto `matematica/` já baixou.

```sh
cd matematica
lake build Calculo
```

Abra `lean/Calculo/Treino.lean`. Há três `sorry`. A linha de cima de cada um é a tática que fecha. Substitua o `sorry`, salve, e olhe o InfoView. Não cole a tática antes de ler o enunciado.

Ordem de leitura, uma prova por vez: `Fundamentos.lean` (triangular), `Limites.lean` (constante, identidade, soma, confronto), `Derivada.lean` (derivável implica contínua), `Series.lean` (soma finita da geométrica).

`Matematica.lean` não importa a Aula 1. `zero_add` nesse arquivo tem o mesmo nome que na mathlib, e os dois juntos quebram o build. A Aula 1 compila sozinha: abra `matematica/Matematica/Aula01.lean`. Também não importe `Calculo` dentro da Aula 1.

## Figuras

Os PNG e os SVG já estão em `figuras/`. Para gerar de novo:

```sh
cd calculo_estudo/figuras
python3 gerar_figuras.py
python3 verificacoes_sympy.py
```

O `python3` do Homebrew, nesta máquina, não tem matplotlib, numpy nem sympy. O script rodou num virtualenv do Python 3.14 que já tinha os três. `verificacoes.txt` fecha com as checagens do SymPy, inclusive o Jacobiano esférico `\rho^2\sin\varphi` e o rotacional da forma angular, que é zero fora da origem.

## PDF

Os 50 `.tex` (notas, gabaritos e cadernos) compilaram. O PDF fica ao lado do fonte. Para gerar de novo:

```sh
cd calculo_estudo
sh compilar.sh
```

O comando roda `pdflatex` na pasta de cada `.tex`, que é o que faz `../preambulo.tex` e `../figuras/` resolverem. Os gabaritos também compilam: deixe-os fechados até a tentativa existir.

## O que estas notas tomam como axioma

Não procure nestes arquivos uma construção dos reais, nem a prova de Bolzano–Weierstrass, nem Heine–Cantor. Eles são citados por nome quando entram. A exponencial entra como função cuja derivada é ela mesma; o seno da soma entra como identidade da revisão e o arco duplo é deduzido. A série infinita no Lean para na soma finita `(1-r)\sum_{k=0}^{n-1} r^k = 1-r^n`. O passo que falta para `\abs{r}<1` está na nota de séries, não no Lean.
