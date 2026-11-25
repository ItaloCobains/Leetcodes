module

public meta import ProofWidgets.Component.Basic
public meta import ProofWidgets.Component.HtmlDisplay

public meta section

open ProofWidgets
open scoped ProofWidgets.Jsx

-- Cursor nesta linha. O enunciado de `two_div_even`.
#html jsx%{
  <MarkdownDisplay contents={"$$\\forall n \\in \\mathbb{N},\\ \\mathrm{Even}(n) \\rightarrow 2 \\mid n$$"} />
}
