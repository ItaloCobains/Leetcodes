"""Checagens simbólicas do curso de cálculo.

Grava o mesmo relatório impresso em calculo_estudo/figuras/verificacoes.txt.
Caminhos absolutos: pode ser chamado de qualquer diretório.
"""

from pathlib import Path

SAIDA = Path("/Users/italo/apps/Leetcodes/calculo_estudo/figuras")
RELATORIO = SAIDA / "verificacoes.txt"
STATUS = SAIDA / "STATUS_PYTHON.txt"

try:
    import sympy as sp
except Exception as erro:
    SAIDA.mkdir(parents=True, exist_ok=True)
    STATUS.write_text(
        "erro de importação em verificacoes_sympy.py\n"
        f"{type(erro).__name__}: {erro}\n",
        encoding="utf-8",
    )
    raise SystemExit(1) from erro


def expressoes_iguais(obtido, esperado):
    if obtido == esperado:
        return True
    diferenca = sp.simplify(obtido - esperado)
    if diferenca == 0:
        return True
    try:
        iguais = obtido.equals(esperado)
    except Exception:
        return False
    return bool(iguais)


class Relatorio:
    def __init__(self):
        self.linhas = []
        self.falhas = []

    def checar(self, descricao, obtido, esperado):
        ok = expressoes_iguais(obtido, esperado)
        linha = f"{descricao}: {obtido} == {esperado} -> {'ok' if ok else 'FALHOU'}"
        print(linha, flush=True)
        self.linhas.append(linha)
        if not ok:
            self.falhas.append(linha)
        return ok

    def checar_condicao(self, descricao, ok):
        linha = f"{descricao} -> {'ok' if ok else 'FALHOU'}"
        print(linha, flush=True)
        self.linhas.append(linha)
        if not ok:
            self.falhas.append(linha)
        return ok

    def gravar(self):
        SAIDA.mkdir(parents=True, exist_ok=True)
        RELATORIO.write_text("\n".join(self.linhas) + "\n", encoding="utf-8")


def soma_geometrica_confere(soma, r, n):
    """A soma de n termos vale (1-r**n)/(1-r) fora de r=1, e vale n em r=1."""
    racional = (1 - r**n) / (1 - r)
    alternativa = (r**n - 1) / (r - 1)
    por_partes = sp.Piecewise((n, sp.Eq(r, 1)), (racional, True))
    for candidato in (racional, alternativa, por_partes):
        if expressoes_iguais(soma, candidato):
            return True
    resto = sp.simplify(sp.together((soma - racional) * (1 - r)))
    try:
        limite_ok = sp.simplify(sp.limit(soma, r, 1) - n) == 0
    except Exception:
        limite_ok = False
    return resto == 0 and limite_ok


def main():
    rel = Relatorio()
    x = sp.symbols("x")

    rel.checar("derivada de x**2", sp.diff(x**2, x), 2 * x)
    rel.checar("derivada de sin(x)", sp.diff(sp.sin(x), x), sp.cos(x))
    rel.checar("derivada de exp(x)", sp.diff(sp.exp(x), x), sp.exp(x))

    produto = x**2 * sp.sin(x)
    esperado_produto = 2 * x * sp.sin(x) + x**2 * sp.cos(x)
    rel.checar(
        "regra do produto em x**2*sin(x)",
        sp.expand(sp.diff(produto, x)),
        sp.expand(esperado_produto),
    )

    u = x
    dv = sp.exp(x)
    du = sp.diff(u, x)
    v = sp.integrate(dv, x)
    por_partes = sp.simplify(u * v - sp.integrate(v * du, x))
    antiderivada_esperada = sp.exp(x) * (x - 1)
    rel.checar("integral de x*exp(x) por partes", por_partes, antiderivada_esperada)
    rel.checar(
        "derivada da antiderivada recupera x*exp(x)",
        sp.simplify(sp.diff(por_partes, x)),
        x * sp.exp(x),
    )

    k, n = sp.symbols("k n", integer=True, positive=True)
    r = sp.symbols("r")
    soma = sp.summation(r**k, (k, 0, n - 1))
    formula = sp.Piecewise((n, sp.Eq(r, 1)), ((1 - r**n) / (1 - r), True))
    rel.checar_condicao(
        f"soma de r**k, k=0 ate n-1: {sp.simplify(soma)} equivale a {formula}",
        soma_geometrica_confere(soma, r, n),
    )

    taylor_seno = sp.series(sp.sin(x), x, 0, 10).removeO()
    esperado_seno = sum(
        ((-1) ** m) * x ** (2 * m + 1) / sp.factorial(2 * m + 1) for m in range(5)
    )
    rel.checar("Taylor de sin(x) em 0 ate grau 9", taylor_seno, sp.expand(esperado_seno))

    taylor_exp = sp.series(sp.exp(x), x, 0, 10).removeO()
    esperado_exp = sum(x**k / sp.factorial(k) for k in range(10))
    rel.checar("Taylor de exp(x) em 0 ate grau 9", taylor_exp, sp.expand(esperado_exp))

    r_pol, theta = sp.symbols("r theta", real=True)
    x_pol = r_pol * sp.cos(theta)
    y_pol = r_pol * sp.sin(theta)
    jacobiano_polar = sp.simplify(sp.Matrix([x_pol, y_pol]).jacobian([r_pol, theta]).det())
    rel.checar("Jacobiano polar", jacobiano_polar, r_pol)

    rho, phi, theta_esf = sp.symbols("rho phi theta", real=True)
    x_esf = rho * sp.sin(phi) * sp.cos(theta_esf)
    y_esf = rho * sp.sin(phi) * sp.sin(theta_esf)
    z_esf = rho * sp.cos(phi)
    jacobiano_esferico = sp.simplify(
        sp.Matrix([x_esf, y_esf, z_esf]).jacobian([rho, phi, theta_esf]).det()
    )
    rel.checar(
        "Jacobiano esférico (phi colatitude)",
        jacobiano_esferico,
        rho**2 * sp.sin(phi),
    )

    x2, y2 = sp.symbols("x y", real=True)
    rot_simples = sp.simplify(sp.diff(x2, x2) - sp.diff(-y2, y2))
    rel.checar("rotacional 2D de (-y, x)", rot_simples, sp.Integer(2))

    raio2 = x2**2 + y2**2
    P = -y2 / raio2
    Q = x2 / raio2
    rot_furado = sp.simplify(sp.cancel(sp.together(sp.diff(Q, x2) - sp.diff(P, y2))))
    rel.checar(
        "rotacional 2D de (-y/r**2, x/r**2) fora da origem",
        rot_furado,
        sp.Integer(0),
    )

    rel.gravar()
    if rel.falhas:
        raise AssertionError("\n".join(rel.falhas))


if __name__ == "__main__":
    main()
