# Plano mestre — Cálculo I, II e III

Material para aprender escrevendo: intuição, definição com hipóteses, prova (ou esqueleto com o passo difícil escrito) e exercício em três camadas. O gabarito fica em arquivo separado.

Decisão de ementa: séries numéricas, de potências e de Taylor ficam no Cálculo II. O Cálculo I termina no Teorema Fundamental e na substituição simples. Técnicas pesadas de integração abrem o Cálculo II, porque dependem do TFC.

## Notação (obrigatória em todos os módulos)

| Objeto | Notação |
| --- | --- |
| reais, naturais, inteiros, racionais | `\R`, `\N`, `\Z`, `\Q` |
| valor absoluto, norma | `\abs{}`, `\norm{}` |
| vetor | `\vet{v}` (nunca negrito) |
| produto escalar, vetorial | `\vet{u}\cdot\vet{v}`, `\vet{u}\times\vet{v}` |
| derivada | `f'(x)`; diferencial `\dif x` |
| parcial | `\partial_x f` ou `f_x` |
| gradiente, divergência, rotacional | `\nabla f`, `\nabla\cdot\vet{F}`, `\nabla\times\vet{F}` |
| integral | `\int_a^b f(x)\,\dif x` |

Funções trigonométricas no LaTeX: `\sin`, `\cos`, `\tan`, `\ln`. Na prosa, seno, cosseno, tangente.

Coordenadas esféricas, convenção fixa: \(\rho\ge 0\) é a distância à origem, \(\varphi\in[0,\pi]\) é o ângulo a partir do eixo \(z\) positivo, \(\theta\in[0,2\pi)\) é o ângulo no plano \(xy\) a partir do eixo \(x\).

\[
x=\rho\sin\varphi\cos\theta,\quad
y=\rho\sin\varphi\sin\theta,\quad
z=\rho\cos\varphi,\quad
\dif V=\rho^2\sin\varphi\,\dif\rho\,\dif\varphi\,\dif\theta.
\]

Cilíndricas: \(x=r\cos\theta\), \(y=r\sin\theta\), \(z=z\), \(\dif V=r\,\dif r\,\dif\theta\,\dif z\), com \(r\ge 0\).

Green, para a fronteira do domínio orientada no sentido anti-horário:

\[
\oint_{\partial D} P\,\dif x+Q\,\dif y
=\iint_D\bigl(\partial_x Q-\partial_y P\bigr)\,\dif A.
\]

## Como cada módulo é feito

Cada nota é um `.tex` compilável sozinho (`\input{../preambulo.tex}`). Exercícios ficam na nota. Soluções comentadas ficam em `*_gabarito.tex`. Figuras vêm de `figuras/gerar_figuras.py` e entram com `\figura{../figuras/nome.png}{legenda}`.

Camadas de exercício, em todo módulo:

1. Básico — conta direta e definição.
2. Intermediário — escolha de técnica, modelagem, hipótese.
3. Avançado — prova, contraexemplo, ou estimativa com as constantes explícitas.

## Mapa de arquivos

### Bloco 0 — `00_revisao_base/`

| Arquivo | Conteúdo | Figura |
| --- | --- | --- |
| `01_desigualdades.tex` | ordem, valor absoluto, intervalos, triangular, completamento de quadrado, frações parciais algébricas | `abs_e_intervalos.png` |
| `02_funcoes.tex` | domínio, composição, inversa, exp/log e suas propriedades | — |
| `03_trigonometria.tex` | círculo, identidades, arcos duplos e metade, inversas, equações | `circulo_trigonometrico.png` |
| `04_vetores_conicas.tex` | cônicas, vetores em \(\R^2\) e \(\R^3\), produto escalar e vetorial, retas e planos | `conicas.png`, `produto_escalar_vetorial.png` |

Provas que não podem ser puladas: desigualdade triangular; \(\abs{\vet{u}\cdot\vet{v}}\le\norm{\vet{u}}\norm{\vet{v}}\) (Cauchy–Schwarz em \(\R^n\)); equação do plano por ponto e normal.

Caderno: `cadernos_de_prova/00_triangular_cauchy.tex`.

### Bloco 1 — `01_calculo_1/`

| Arquivo | Conteúdo | Figura |
| --- | --- | --- |
| `01_limites.tex` | intuição, \(\eps\)-\(\delta\), laterais, infinito, confronto, limites fundamentais, álgebra de limites | `epsilon_delta.png` |
| `02_continuidade.tex` | definição, tipos de descontinuidade, TVI, Weierstrass | `descontinuidades.png` |
| `03_derivadas.tex` | definição, reta tangente, diferenciável \(\Rightarrow\) contínua, regras, cadeia, implícita, taxas relacionadas | `secante_tangente.png` |
| `04_aplicacoes_derivada.tex` | Rolle, TVM de Lagrange e de Cauchy, monotonicidade, concavidade, L'Hôpital, otimização, linearização | — |
| `05_integral_riemann_tfc.tex` | partições, somas superiores e inferiores, integrabilidade, propriedades, TFC 1 e 2, antiderivada, substituição simples | `riemann.png` |

Provas centrais: unicidade do limite; confronto; \(\lim_{x\to a}x^2=a^2\) com \(\eps\)-\(\delta\) escrito por completo; diferenciabilidade implica continuidade; \(\abs{x}\) não é derivável em \(0\); Rolle; TVM; TFC parte 1 e parte 2.

Cadernos: `01_epsilon_delta.tex`, `02_rolle_mvt_tfc.tex`.

### Bloco 2 — `02_calculo_2/`

| Arquivo | Conteúdo | Figura |
| --- | --- | --- |
| `01_tecnicas_integracao.tex` | partes, produtos de senos e cossenos, substituição trigonométrica, frações parciais, impróprias tipo I e II, comparação, EDO separável e linear de 1ª ordem | — |
| `02_parametricas_polares.tex` | parametrização, comprimento, área de revolução, área e comprimento em polares, interseção | `cardioide.png` |
| `03_sequencias_series.tex` | sequências, geométrica, telescópica, testes (divergência, integral, comparação, razão, raiz, Leibniz), absoluta vs condicional, rearranjo de Riemann | `somas_parciais.png` |
| `04_taylor.tex` | raio e intervalo, derivação e integração termo a termo, Taylor/Maclaurin, resto de Lagrange | `taylor_seno.png` |
| `05_curvas_espaco.tex` | quádricas, curvas no espaço, comprimento, curvatura e triedro TNB | `helice.png` |

Provas centrais: integração por partes a partir da regra do produto; soma da série geométrica; teste da divergência; teste de Leibniz com estimativa do resto; derivação termo a termo no interior do intervalo (enunciado preciso + o que falha no bordo); fórmula do comprimento de arco.

Caderno: `03_series_taylor.tex`.

### Bloco 3 — `03_calculo_3/`

| Arquivo | Conteúdo | Figura |
| --- | --- | --- |
| `01_funcoes_rn.tex` | domínio, imagem, níveis, limite em \(\R^n\), caminhos, polares para provar limite | `curvas_nivel.png` |
| `02_derivadas_gradiente.tex` | parciais, diferenciabilidade, plano tangente, cadeia, direcional, gradiente, Clairaut | `gradiente_nivel.png` |
| `03_otimizacao_lagrange.tex` | críticos, Hessiana, extremos condicionados, multiplicadores | `lagrange.png` |
| `04_integrais_multiplas.tex` | duplas tipo I e II, mudança de variáveis, Jacobiano, polares, triplas, cilíndricas, esféricas | `polar_jacobiano.png`, `coordenadas_esfericas.png` |
| `05_integrais_linha.tex` | campos, integral de linha escalar e vetorial, potencial, independência de caminho | `campo_vetorial.png` |
| `06_green_stokes_gauss.tex` | Green, rotacional, divergência, superfície paramétrica, fluxo, Stokes, Gauss, e a cadeia Green \(\to\) Stokes \(\to\) Gauss | `green.png` |

Provas centrais: gradiente ortogonal à curva de nível; contraexemplo de Clairaut; teste da Hessiana com as hipóteses; Jacobiano polar calculado; Green no retângulo; direção fácil de “campo conservativo \(\Rightarrow\) rotacional nulo”; forma \((-y/r^2,\, x/r^2)\) no plano furado.

Caderno: `04_green_stokes_gauss.tex`.

## Lean — `lean/`

Projeto próprio, toolchain `leanprover/lean4:v4.36.0`, mathlib `v4.36.0` (o mesmo pin de `matematica/`). A definição de limite é a de \(\eps\)-\(\delta\), escrita na mão, para treinar quantificadores. Não é o `Tendsto` da mathlib.

| Arquivo | O que formaliza |
| --- | --- |
| `Calculo/Fundamentos.lean` | valor absoluto e triangular |
| `Calculo/Limites.lean` | constante, identidade, soma, confronto |
| `Calculo/Derivada.lean` | derivada no ponto e “derivável \(\Rightarrow\) contínua” |
| `Calculo/Series.lean` | soma finita da geométrica |
| `Calculo/Treino.lean` | enunciados com `sorry` e a tática indicada no comentário |

Não há `lakefile` dentro de `lean/`. Os fontes entram no projeto que você já tem, como biblioteca `Calculo`, para reusar a mathlib baixada. `Matematica.lean` não importa a Aula 1: `zero_add` lá tem o mesmo nome que na mathlib, e os dois no mesmo arquivo derrubam o build. A Aula 1 continua compilando sozinha, pelo glob do `lakefile`. Abra `Matematica/Aula01.lean` direto.

```sh
cd matematica
lake build Calculo
```

## Python — `figuras/`

`gerar_figuras.py` grava os PNG listados acima (e um SVG irmão de cada um). `verificacoes_sympy.py` confere derivadas, integrais e a série de seno, e grava `verificacoes.txt`.

```sh
cd calculo_estudo/figuras
python3 gerar_figuras.py
python3 verificacoes_sympy.py
```

## Ordem de estudo

0. Desigualdades e funções, até a triangular e o logaritmo estarem naturais.
1. Trigonometria e vetores, até plano e produto vetorial.
2. Limites com \(\eps\)-\(\delta\) no papel, um por dia, e o caderno `01_epsilon_delta`.
3. Continuidade, TVI, Weierstrass.
4. Derivada pela definição, depois regras.
5. TVM e TFC no caderno `02_rolle_mvt_tfc`.
6. Técnicas, polares, séries, Taylor.
7. \(\R^n\), gradiente, Lagrange, integrais múltiplas.
8. Campos, Green, Stokes, Gauss.

O ciclo diário está em `GUIA_DE_ESTUDO_ATIVO.md`.

## O que este plano não é

Não é um curso de análise com construção dos reais por cortes de Dedekind, nem um curso de EDO, nem Fourier além de um apontamento de que a série de Taylor não é a série de Fourier. Esses três entram só quando o núcleo acima estiver escrito e usado.
