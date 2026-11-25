"""Figuras do curso de cálculo.

Grava PNG (dpi 140) e SVG em calculo_estudo/figuras/.
Os caminhos são absolutos: o script pode ser chamado de qualquer diretório.
"""

from pathlib import Path
import math

SAIDA = Path("/Users/italo/apps/Leetcodes/calculo_estudo/figuras")
STATUS = SAIDA / "STATUS_PYTHON.txt"

try:
    import matplotlib

    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    import numpy as np
    from matplotlib.patches import FancyArrowPatch, Polygon, Rectangle
    from mpl_toolkits.mplot3d.art3d import Poly3DCollection
except Exception as erro:
    SAIDA.mkdir(parents=True, exist_ok=True)
    STATUS.write_text(
        "erro de importação em gerar_figuras.py\n"
        f"{type(erro).__name__}: {erro}\n",
        encoding="utf-8",
    )
    raise SystemExit(1) from erro

AZUL = "#1f4e79"
LARANJA = "#e07a3d"
VERDE = "#2e7d4f"
VERMELHO = "#c0392b"
CINZA = "#4a4a4a"
CINZA_CLARO = "#8a8a8a"

plt.rcParams.update(
    {
        "font.size": 11,
        "axes.titlesize": 12,
        "axes.labelsize": 11,
        "legend.fontsize": 9,
        "axes.unicode_minus": False,
        "figure.facecolor": "white",
        "savefig.facecolor": "white",
        "axes.facecolor": "white",
        "axes.edgecolor": "#333333",
        "text.color": "#222222",
        "axes.labelcolor": "#222222",
        "xtick.color": "#222222",
        "ytick.color": "#222222",
        "xtick.direction": "out",
        "ytick.direction": "out",
    }
)


def salvar(fig, nome):
    SAIDA.mkdir(parents=True, exist_ok=True)
    base = SAIDA / nome
    fig.savefig(
        base.with_suffix(".png"),
        dpi=140,
        bbox_inches="tight",
        pad_inches=0.16,
        facecolor="white",
    )
    fig.savefig(
        base.with_suffix(".svg"),
        bbox_inches="tight",
        pad_inches=0.16,
        facecolor="white",
    )
    plt.close(fig)
    print(f"gravado {nome}.png e {nome}.svg", flush=True)


def grade(ax):
    ax.grid(True, linestyle=":", linewidth=0.7, color="#b5b5b5", alpha=0.9)
    ax.set_axisbelow(True)


def seta(ax, inicio, fim, cor, largura=1.8, escala=13):
    patch = FancyArrowPatch(
        inicio,
        fim,
        arrowstyle="-|>",
        mutation_scale=escala,
        lw=largura,
        color=cor,
        shrinkA=0,
        shrinkB=0,
    )
    ax.add_patch(patch)
    return patch


def figura_abs_e_intervalos():
    fig, ax = plt.subplots(figsize=(7.2, 2.45))
    ax.annotate(
        "",
        xy=(4.35, 0),
        xytext=(-0.35, 0),
        arrowprops=dict(arrowstyle="<|-|>", color=CINZA, lw=1.15, mutation_scale=12),
    )
    ax.plot([1, 3], [0, 0], color=AZUL, lw=6, solid_capstyle="butt", zorder=2)
    ax.scatter([1, 3], [0, 0], s=110, color="white", zorder=3)
    ax.scatter(
        [1, 3],
        [0, 0],
        s=110,
        facecolors="white",
        edgecolors=AZUL,
        linewidths=2.0,
        zorder=4,
    )
    ax.scatter([2], [0], s=38, color=VERMELHO, zorder=5)
    ax.annotate(
        "",
        xy=(3, 0.28),
        xytext=(1, 0.28),
        arrowprops=dict(arrowstyle="<->", color=AZUL, lw=1.2),
    )
    ax.text(2, 0.40, r"$(1,3)$", ha="center", va="bottom", color=AZUL, fontsize=12)
    ax.text(2, 0.68, r"$|x-2|<1$", ha="center", va="bottom", fontsize=14)
    for valor in (0, 1, 2, 3, 4):
        ax.plot([valor, valor], [-0.07, 0.07], color=CINZA, lw=1.0, zorder=2)
        cor = VERMELHO if valor == 2 else CINZA
        ax.text(valor, -0.16, str(valor), ha="center", va="top", color=cor, fontsize=11)
    ax.text(4.48, 0.0, r"$x$", ha="left", va="center", fontsize=12)
    ax.set_xlim(-0.55, 4.85)
    ax.set_ylim(-0.48, 1.05)
    ax.set_axis_off()
    ax.set_title(r"Reta real: $|x-2|<1$ é o intervalo aberto $(1,3)$")
    salvar(fig, "abs_e_intervalos")


def figura_circulo_trigonometrico():
    fig, ax = plt.subplots(figsize=(6.6, 6.3))
    angulo = np.linspace(0, 2 * np.pi, 500)
    ax.plot(np.cos(angulo), np.sin(angulo), color="#222222", lw=1.3, zorder=1)
    ax.axhline(0, color=CINZA_CLARO, lw=0.8, zorder=0)
    ax.axvline(0, color=CINZA_CLARO, lw=0.8, zorder=0)
    marcas = [
        (0.0, r"$0$"),
        (np.pi / 6, r"$\pi/6$"),
        (np.pi / 4, r"$\pi/4$"),
        (np.pi / 3, r"$\pi/3$"),
        (np.pi / 2, r"$\pi/2$"),
    ]
    cores = ["#4C78A8", "#F58518", "#54A24B", "#E45756", "#B279A2"]
    for (theta, rotulo), cor in zip(marcas, cores):
        cosseno = np.cos(theta)
        seno = np.sin(theta)
        ax.plot([0, cosseno], [0, seno], color=cor, lw=1.15, zorder=2)
        # Horizontal: comprimento |cos θ| na altura sen θ.
        ax.plot([0, cosseno], [seno, seno], color=cor, lw=2.4, solid_capstyle="butt", zorder=3)
        # Vertical: comprimento |sen θ| na abscissa cos θ.
        ax.plot(
            [cosseno, cosseno],
            [0, seno],
            color=cor,
            lw=2.4,
            ls=(0, (3, 1.4)),
            solid_capstyle="butt",
            zorder=3,
        )
        ax.scatter([cosseno], [seno], s=22, color=cor, zorder=4)
        ax.text(
            1.16 * cosseno,
            1.16 * seno + (0.06 if theta == 0 else 0),
            rotulo,
            color=cor,
            ha="center",
            va="center",
            fontsize=12,
        )
    ax.plot([], [], color=CINZA, lw=2.4, label="cosseno (horizontal)")
    ax.plot([], [], color=CINZA, lw=2.4, ls=(0, (3, 1.4)), label="seno (vertical)")
    ax.set_aspect("equal")
    ax.set_xlim(-1.38, 1.48)
    ax.set_ylim(-1.28, 1.48)
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_title("Círculo trigonométrico")
    ax.legend(loc="lower left", framealpha=0.95)
    grade(ax)
    salvar(fig, "circulo_trigonometrico")


def _eixos_cruzados(ax):
    ax.axhline(0, color="#c8c8c8", lw=0.7, zorder=0)
    ax.axvline(0, color="#c8c8c8", lw=0.7, zorder=0)


def figura_conicas():
    fig, eixos = plt.subplots(1, 3, figsize=(8.3, 3.35), layout="constrained")

    ax = eixos[0]
    x = np.linspace(-3, 3, 400)
    ax.plot(x, x**2 / 4, color=AZUL, lw=2)
    _eixos_cruzados(ax)
    ax.set_aspect("equal", adjustable="box")
    ax.set_xlim(-3.2, 3.2)
    ax.set_ylim(-0.35, 2.55)
    ax.set_title(r"Parábola $y=x^2/4$")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    grade(ax)

    ax = eixos[1]
    t = np.linspace(0, 2 * np.pi, 500)
    ax.plot(2 * np.cos(t), np.sin(t), color=VERDE, lw=2)
    _eixos_cruzados(ax)
    ax.set_aspect("equal", adjustable="box")
    ax.set_title(r"Elipse $x^2/4+y^2=1$")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    grade(ax)

    ax = eixos[2]
    y = np.linspace(-2.4, 2.4, 500)
    ramo = np.sqrt(1 + y**2)
    ax.plot(ramo, y, color=VERMELHO, lw=2, label="ramo direito")
    ax.plot(-ramo, y, color=VERMELHO, lw=2, ls="--", label="ramo esquerdo")
    guia = np.linspace(-2.8, 2.8, 40)
    ax.plot(guia, guia, color=CINZA_CLARO, lw=0.8, ls=":", label="assíntotas")
    ax.plot(guia, -guia, color=CINZA_CLARO, lw=0.8, ls=":")
    _eixos_cruzados(ax)
    ax.set_aspect("equal", adjustable="box")
    ax.set_xlim(-2.9, 2.9)
    ax.set_ylim(-2.6, 2.6)
    ax.set_title(r"Hipérbole $x^2-y^2=1$")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.legend(
        loc="center left",
        bbox_to_anchor=(1.02, 0.5),
        fontsize=8,
        frameon=False,
        borderaxespad=0.2,
    )
    grade(ax)
    salvar(fig, "conicas")


def _marca_reto(ax, origem, direcao_a, direcao_b, tamanho=0.16, cor=VERDE):
    a = np.asarray(direcao_a, dtype=float)
    b = np.asarray(direcao_b, dtype=float)
    a = a / np.linalg.norm(a) * tamanho
    b = b / np.linalg.norm(b) * tamanho
    p1 = origem + a
    p2 = origem + a + b
    p3 = origem + b
    ax.plot([p1[0], p2[0], p3[0]], [p1[1], p2[1], p3[1]], color=cor, lw=1.0, zorder=4)


def figura_produto_escalar_vetorial():
    fig = plt.figure(figsize=(7.6, 3.9))
    ax = fig.add_subplot(1, 2, 1)
    u = np.array([3.0, 1.0])
    v = np.array([1.0, 2.0])
    proj = (np.dot(v, u) / np.dot(u, u)) * u
    seta(ax, (0, 0), tuple(u), AZUL, largura=2.0)
    seta(ax, (0, 0), tuple(v), LARANJA, largura=2.0)
    seta(ax, (0, 0), tuple(proj), VERDE, largura=2.0)
    ax.plot([proj[0], v[0]], [proj[1], v[1]], color=VERDE, ls="--", lw=1.2, zorder=3)
    _marca_reto(ax, proj, u, v - proj)
    ax.text(3.08, 1.05, r"$(3,1)$", color=AZUL, va="center")
    ax.text(1.12, 2.08, r"$(1,2)$", color=LARANJA, va="bottom")
    ax.text(0.55, 0.22, "projeção", color=VERDE, ha="left")
    ax.set_xlim(-0.25, 3.85)
    ax.set_ylim(-0.35, 2.55)
    ax.set_aspect("equal", adjustable="box")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_title(r"Projeção de $(1,2)$ sobre $(3,1)$")
    grade(ax)

    ax3 = fig.add_subplot(1, 2, 2, projection="3d")
    base = np.array([[0.0, 0.0, 0.0], [1.0, 0.0, 0.0], [1.0, 1.0, 0.0], [0.0, 1.0, 0.0]])
    face = Poly3DCollection([base], alpha=0.28, facecolor="#4C78A8", edgecolor=AZUL, linewidths=1.0)
    ax3.add_collection3d(face)
    ax3.quiver(0, 0, 0, 1, 0, 0, color=AZUL, arrow_length_ratio=0.16, lw=2)
    ax3.quiver(0, 0, 0, 0, 1, 0, color=LARANJA, arrow_length_ratio=0.16, lw=2)
    ax3.quiver(0, 0, 0, 0, 0, 1, color=VERMELHO, arrow_length_ratio=0.16, lw=2)
    ax3.text(1.08, 0.0, 0.06, r"$\mathbf{u}$", color=AZUL)
    ax3.text(0.0, 1.08, 0.06, r"$\mathbf{v}$", color=LARANJA)
    ax3.text(0.06, 0.06, 1.08, r"$\mathbf{u}\times\mathbf{v}$", color=VERMELHO)
    ax3.set_xlim(0, 1.25)
    ax3.set_ylim(0, 1.25)
    ax3.set_zlim(0, 1.35)
    try:
        ax3.set_box_aspect((1, 1, 1))
    except Exception:
        pass
    ax3.set_xlabel(r"$x$")
    ax3.set_ylabel(r"$y$")
    ax3.set_zlabel(r"$z$")
    ax3.set_title(r"$\mathbf{u}\times\mathbf{v}=(0,0,1)$")
    ax3.view_init(elev=24, azim=-58)
    salvar(fig, "produto_escalar_vetorial")


def figura_epsilon_delta():
    fig, ax = plt.subplots(figsize=(6.8, 4.7))
    x = np.linspace(0, 2, 400)
    ax.axhspan(1.5, 2.5, color="#f4c7c3", alpha=0.85, zorder=0, label=r"$|y-2|<0.5$")
    ax.axvspan(0.75, 1.25, color="#c7e3c2", alpha=0.55, zorder=0, label=r"$|x-1|<\delta$")
    ax.plot(x, 2 * x, color=AZUL, lw=2.0, zorder=3, label=r"$f(x)=2x$")
    ax.axhline(1.5, color=VERMELHO, lw=0.8, ls="--", zorder=2)
    ax.axhline(2.5, color=VERMELHO, lw=0.8, ls="--", zorder=2)
    ax.axvline(0.75, color=VERDE, lw=1.05, ls="--", zorder=2)
    ax.axvline(1.25, color=VERDE, lw=1.05, ls="--", zorder=2, label=r"$x=1\pm\delta$")
    ax.scatter([1], [2], s=36, color=VERMELHO, zorder=4)
    ax.annotate(r"$(1,2)$", xy=(1, 2), xytext=(1.12, 2.22), color=VERMELHO, fontsize=10)
    ax.annotate(
        "",
        xy=(1.25, 0.28),
        xytext=(0.75, 0.28),
        arrowprops=dict(arrowstyle="<->", color=VERDE, lw=1.2),
    )
    ax.text(1.0, 0.40, r"$\delta=0.25$", color=VERDE, ha="center", fontsize=11)
    ax.annotate(
        "",
        xy=(1.78, 2.5),
        xytext=(1.78, 1.5),
        arrowprops=dict(arrowstyle="<->", color=VERMELHO, lw=1.15),
    )
    ax.text(1.82, 2.0, r"$\varepsilon=0.5$", color=VERMELHO, va="center", fontsize=11)
    ax.set_xlim(0, 2)
    ax.set_ylim(0, 4)
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_title(r"$\varepsilon$-$\delta$ para $f(x)=2x$ em $x=1$")
    ax.legend(loc="upper left", framealpha=0.94)
    grade(ax)
    salvar(fig, "epsilon_delta")


def figura_descontinuidades():
    fig, eixos = plt.subplots(1, 3, figsize=(8.4, 3.25), layout="constrained")

    ax = eixos[0]
    esquerda = np.linspace(-10, -0.04, 700)
    direita = np.linspace(0.04, 10, 700)
    ax.plot(esquerda, np.sin(esquerda) / esquerda, color=AZUL, lw=1.6)
    ax.plot(direita, np.sin(direita) / direita, color=AZUL, lw=1.6)
    ax.scatter([0], [1], s=46, facecolors="white", edgecolors=VERMELHO, linewidths=1.6, zorder=4)
    ax.text(0.35, 1.08, "buraco", color=VERMELHO, fontsize=9)
    ax.set_xlim(-10, 10)
    ax.set_ylim(-0.35, 1.28)
    ax.set_title(r"Removível: $\sin x/x$")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    grade(ax)

    ax = eixos[1]
    x_esq = np.linspace(-2, 0, 300, endpoint=False)
    x_dir = np.linspace(0, 2, 200)
    ax.plot(x_esq, np.zeros_like(x_esq), color=AZUL, lw=2)
    ax.plot(x_dir, np.ones_like(x_dir), color=AZUL, lw=2)
    ax.scatter([0], [0], s=46, facecolors="white", edgecolors=AZUL, linewidths=1.6, zorder=4)
    ax.scatter([0], [1], s=32, color=AZUL, zorder=4)
    ax.set_xlim(-2, 2)
    ax.set_ylim(-0.25, 1.35)
    ax.set_title(r"Salto: $0$ se $x<0$, $1$ se $x\geq 0$")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    grade(ax)

    ax = eixos[2]
    x_neg = np.linspace(-3, -0.09, 400)
    x_pos = np.linspace(0.09, 3, 400)
    ax.plot(x_neg, 1 / x_neg, color=VERMELHO, lw=1.7)
    ax.plot(x_pos, 1 / x_pos, color=VERMELHO, lw=1.7)
    ax.axvline(0, color=CINZA_CLARO, ls="--", lw=0.9)
    ax.set_xlim(-3, 3)
    ax.set_ylim(-8, 8)
    ax.set_title(r"Infinita: $1/x$")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    grade(ax)
    salvar(fig, "descontinuidades")


def figura_secante_tangente():
    fig, ax = plt.subplots(figsize=(6.6, 4.6))
    x = np.linspace(0, 2, 400)
    ax.plot(x, x**2, color="#222222", lw=2.1, label=r"$f(x)=x^2$", zorder=3)
    ax.plot(x, 2 * x - 1, color=VERMELHO, lw=1.7, label=r"tangente $y=2x-1$", zorder=2)
    for h, cor, estilo in ((0.8, AZUL, "--"), (0.3, VERDE, "-.")):
        x1 = 1 + h
        y1 = x1**2
        secante = 1 + ((y1 - 1) / h) * (x - 1)
        ax.plot(x, secante, color=cor, lw=1.5, ls=estilo, label=rf"secante $h={h}$", zorder=2)
        ax.scatter([x1], [y1], s=28, color=cor, zorder=4)
    ax.scatter([1], [1], s=34, color=VERMELHO, zorder=5)
    ax.set_xlim(0, 2)
    ax.set_ylim(-1.9, 4.35)
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_title(r"Secantes e tangente de $x^2$ em $x=1$")
    ax.legend(loc="upper left", framealpha=0.94)
    grade(ax)
    salvar(fig, "secante_tangente")


def figura_riemann():
    fig, ax = plt.subplots(figsize=(6.6, 4.4))
    a, b, n = 0.0, 2.0, 8
    dx = (b - a) / n
    for i in range(n):
        x0 = a + i * dx
        superior = Rectangle(
            (x0, 0),
            dx,
            x0 + dx,
            facecolor="#c6dbef",
            edgecolor="#2171b5",
            linewidth=0.8,
            label="soma superior" if i == 0 else None,
            zorder=1,
        )
        inferior = Rectangle(
            (x0, 0),
            dx,
            x0,
            facecolor="#fdd0a2",
            edgecolor="#d94801",
            linewidth=0.8,
            label="soma inferior" if i == 0 else None,
            zorder=2,
        )
        ax.add_patch(superior)
        ax.add_patch(inferior)
    x = np.linspace(a, b, 200)
    ax.plot(x, x, color="#222222", lw=1.8, label=r"$f(x)=x$", zorder=3)
    ax.set_xlim(-0.05, 2.05)
    ax.set_ylim(-0.05, 2.25)
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_title(r"Somas inferior e superior, $n=8$")
    ax.legend(loc="upper left", framealpha=0.94)
    grade(ax)
    salvar(fig, "riemann")


def figura_cardioide():
    fig, ax = plt.subplots(figsize=(6.3, 6.0), subplot_kw={"projection": "polar"})
    theta = np.linspace(0, 2 * np.pi, 800)
    ax.plot(theta, 1 + np.cos(theta), color=VERMELHO, lw=2.0, label=r"$r=1+\cos\theta$")
    ax.plot(theta, np.ones_like(theta), color=AZUL, lw=1.6, label=r"$r=1$")
    ax.set_theta_zero_location("E")
    ax.set_theta_direction(1)
    ax.set_rlim(0, 2.25)
    ax.set_title("Cardioide e circunferência", pad=14)
    ax.set_xlabel(r"$\theta$")
    ax.set_ylabel(r"$r$", labelpad=18)
    ax.legend(loc="upper left", bbox_to_anchor=(0.92, 1.08), framealpha=0.95)
    ax.grid(True, linestyle=":", linewidth=0.7, color="#b5b5b5")
    salvar(fig, "cardioide")


def figura_somas_parciais():
    fig, eixos = plt.subplots(1, 2, figsize=(7.8, 3.6), layout="constrained")
    n_max = 40
    n = np.arange(0, n_max + 1)
    geom = np.cumsum(0.5**n)
    ax = eixos[0]
    ax.plot(n, geom, color=AZUL, lw=1.7, marker="o", ms=3.2, label=r"$s_n$")
    ax.axhline(2, color=VERMELHO, ls="--", lw=1.1, label="limite 2")
    ax.set_xlim(0, n_max)
    ax.set_ylim(0.8, 2.15)
    ax.set_xlabel(r"$n$")
    ax.set_ylabel(r"$s_n$")
    ax.set_title(r"Geométrica $\sum_{k=0}^{n}(1/2)^k$")
    ax.legend(loc="lower right", framealpha=0.94)
    grade(ax)

    n_h = np.arange(1, n_max + 1)
    harmonica = np.cumsum(1.0 / n_h)
    gamma = 0.5772156649015329
    ax = eixos[1]
    ax.plot(n_h, harmonica, color=VERMELHO, lw=1.8, label=r"$H_n$")
    ax.plot(n_h, np.log(n_h) + gamma, color=CINZA, lw=1.3, ls="--", label=r"$\ln n+\gamma$")
    ax.set_xlim(1, n_max)
    ax.set_xlabel(r"$n$")
    ax.set_ylabel(r"$H_n$")
    ax.set_title(r"Harmônica $H_n=\sum_{k=1}^{n}1/k$")
    ax.legend(loc="upper left", framealpha=0.94)
    grade(ax)
    salvar(fig, "somas_parciais")


def _taylor_seno(x, grau):
    y = np.zeros_like(x, dtype=float)
    sinal = 1.0
    m = 0
    while 2 * m + 1 <= grau:
        potencia = 2 * m + 1
        y = y + sinal * x**potencia / math.factorial(potencia)
        sinal *= -1
        m += 1
    return y


def figura_taylor_seno():
    fig, ax = plt.subplots(figsize=(7.2, 4.3))
    # T9 cresce perto de ±2π; a janela vertical deixa o seno legível.
    x = np.linspace(-2 * np.pi, 2 * np.pi, 1400)
    ax.plot(x, np.sin(x), color="#222222", lw=2.3, label=r"$\sin x$", zorder=4)
    estilos = {
        1: ("#9aa0a6", "--"),
        3: ("#4C78A8", "--"),
        5: ("#54A24B", "-."),
        9: (VERMELHO, "-"),
    }
    for grau, (cor, estilo) in estilos.items():
        y = _taylor_seno(x, grau)
        y = np.where(np.abs(y) > 2.8, np.nan, y)
        ax.plot(x, y, color=cor, lw=1.5, ls=estilo, label=rf"grau {grau}", zorder=3)
    ax.set_xlim(-2 * np.pi, 2 * np.pi)
    ax.set_ylim(-2, 2)
    ax.set_xticks([-2 * np.pi, -np.pi, 0, np.pi, 2 * np.pi])
    ax.set_xticklabels([r"$-2\pi$", r"$-\pi$", r"$0$", r"$\pi$", r"$2\pi$"])
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_title(r"Taylor de $\sin x$ em $0$")
    ax.legend(loc="upper center", bbox_to_anchor=(0.5, -0.18), ncol=5, frameon=False)
    grade(ax)
    salvar(fig, "taylor_seno")


def figura_helice():
    fig = plt.figure(figsize=(6.2, 5.0))
    ax = fig.add_subplot(111, projection="3d")
    t = np.linspace(0, 6 * np.pi, 900)
    ax.plot(np.cos(t), np.sin(t), t, color=AZUL, lw=1.8)
    ax.scatter([1], [0], [0], color=VERMELHO, s=22)
    ax.scatter([np.cos(6 * np.pi)], [np.sin(6 * np.pi)], [6 * np.pi], color=VERDE, s=22)
    ax.text(1.15, 0.0, 0.2, r"$t=0$", color=VERMELHO)
    ax.text(1.15, 0.15, 6 * np.pi, r"$t=6\pi$", color=VERDE)
    try:
        ax.set_box_aspect((1, 1, 2.5))
    except Exception:
        pass
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_zlabel(r"$z$", labelpad=8)
    ax.set_title(r"Hélice $r(t)=(\cos t,\sin t,t)$")
    ax.view_init(elev=22, azim=-62)
    salvar(fig, "helice")


def figura_curvas_nivel():
    fig, eixos = plt.subplots(1, 2, figsize=(7.6, 3.7), layout="constrained")
    xy = np.linspace(-2.2, 2.2, 350)
    X, Y = np.meshgrid(xy, xy)

    ax = eixos[0]
    niveis = ax.contour(X, Y, X**2 + Y**2, levels=[0.5, 1, 2, 4], cmap="viridis")
    ax.clabel(niveis, inline=True, fontsize=8, fmt="%.2g")
    ax.set_aspect("equal")
    ax.set_title(r"$f(x,y)=x^2+y^2$")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")

    ax = eixos[1]
    niveis = ax.contour(
        X,
        Y,
        X**2 - Y**2,
        levels=[-2, -1, 0, 1, 2],
        cmap="coolwarm",
    )
    ax.clabel(niveis, inline=True, fontsize=8, fmt="%.2g")
    ax.set_aspect("equal")
    ax.set_title(r"$g(x,y)=x^2-y^2$")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    salvar(fig, "curvas_nivel")


def figura_gradiente_nivel():
    fig, ax = plt.subplots(figsize=(6.2, 5.6))
    xy = np.linspace(-2.05, 2.05, 400)
    X, Y = np.meshgrid(xy, xy)
    niveis = ax.contour(
        X,
        Y,
        X**2 + Y**2,
        levels=[0.25, 1, 2.25, 4],
        colors=AZUL,
        linewidths=1.3,
    )
    ax.clabel(niveis, inline=True, fontsize=8, fmt="%.2g")
    malha = np.linspace(-2, 2, 9)
    Xq, Yq = np.meshgrid(malha, malha)
    U = 2 * Xq
    V = 2 * Yq
    modulo = np.hypot(U, V)
    mascara = modulo < 1e-9
    modulo = np.where(mascara, 1, modulo)
    Un = np.ma.array(U / modulo, mask=mascara)
    Vn = np.ma.array(V / modulo, mask=mascara)
    ax.quiver(
        Xq,
        Yq,
        Un,
        Vn,
        angles="xy",
        scale_units="xy",
        scale=4.2,
        width=0.0045,
        color=VERMELHO,
        pivot="mid",
        zorder=3,
    )
    ax.plot([], [], color=AZUL, lw=1.4, label=r"níveis de $x^2+y^2$")
    ax.plot([], [], color=VERMELHO, lw=1.6, label=r"direção de $\nabla f=(2x,2y)$")
    ax.set_aspect("equal")
    ax.set_xlim(-2.25, 2.25)
    ax.set_ylim(-2.25, 2.25)
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_title(r"Gradiente ortogonal às curvas de nível")
    ax.legend(loc="upper right", framealpha=0.94)
    salvar(fig, "gradiente_nivel")


def figura_lagrange():
    fig, ax = plt.subplots(figsize=(6.2, 5.8))
    t = np.linspace(0, 2 * np.pi, 500)
    ax.plot(np.cos(t), np.sin(t), color="#222222", lw=2.0, label=r"$x^2+y^2=1$", zorder=3)
    xs = np.linspace(-1.7, 1.7, 80)
    raiz2 = np.sqrt(2)
    for c in (-1.7, -raiz2, -0.7, 0.7, raiz2, 1.7):
        tangente = np.isclose(abs(c), raiz2)
        ax.plot(
            xs,
            -xs + c,
            color=VERMELHO if tangente else CINZA_CLARO,
            lw=1.8 if tangente else 1.0,
            ls="-" if tangente else "--",
            label=r"níveis tangentes $x+y=\pm\sqrt{2}$" if np.isclose(c, raiz2) else (
                r"níveis de $x+y$" if np.isclose(c, 0.7) else None
            ),
            zorder=2 if tangente else 1,
        )
    s = 1 / np.sqrt(2)
    ax.scatter([s, -s], [s, -s], s=42, color=VERMELHO, zorder=5, label="pontos de tangência")
    ax.annotate(
        r"$(1,1)/\sqrt{2}$",
        xy=(s, s),
        xytext=(0.95, 1.22),
        fontsize=10,
        arrowprops=dict(arrowstyle="-", color=CINZA, lw=0.7),
    )
    ax.annotate(
        r"$-(1,1)/\sqrt{2}$",
        xy=(-s, -s),
        xytext=(-1.55, -1.38),
        fontsize=10,
        arrowprops=dict(arrowstyle="-", color=CINZA, lw=0.7),
    )
    ax.set_aspect("equal")
    ax.set_xlim(-1.75, 1.75)
    ax.set_ylim(-1.75, 1.75)
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_title(r"Lagrange para $f=x+y$ na circunferência")
    ax.legend(loc="upper left", fontsize=8, framealpha=0.94)
    grade(ax)
    salvar(fig, "lagrange")


def figura_polar_jacobiano():
    fig, eixos = plt.subplots(1, 2, figsize=(7.8, 3.8), layout="constrained")
    r0, r1 = 0.5, 1.5
    th0, th1 = np.pi / 6, np.pi / 3
    ax = eixos[0]
    ax.add_patch(
        Rectangle(
            (r0, th0),
            r1 - r0,
            th1 - th0,
            facecolor="#c6dbef",
            edgecolor=AZUL,
            lw=1.5,
            zorder=2,
        )
    )
    ax.plot([1, 1], [th0, th1], color=LARANJA, ls="--", lw=1.2, label=r"$r=1$")
    ax.plot([r0, r1], [np.pi / 4, np.pi / 4], color=VERDE, ls="--", lw=1.2, label=r"$\theta=\pi/4$")
    cantos = {
        "A": (r0, th0),
        "B": (r1, th0),
        "C": (r1, th1),
        "D": (r0, th1),
    }
    deslocamentos = {"A": (-0.08, -0.06), "B": (0.08, -0.06), "C": (0.08, 0.05), "D": (-0.08, 0.05)}
    for letra, (r, th) in cantos.items():
        dr, dth = deslocamentos[letra]
        ax.text(r + dr, th + dth, letra, ha="center", va="center", fontsize=11, color=AZUL, zorder=4)
    ax.set_xlim(0.15, 1.9)
    ax.set_ylim(0.25, 1.35)
    ax.set_yticks([np.pi / 6, np.pi / 4, np.pi / 3])
    ax.set_yticklabels([r"$\pi/6$", r"$\pi/4$", r"$\pi/3$"])
    ax.set_xlabel(r"$r$")
    ax.set_ylabel(r"$\theta$")
    ax.set_title(r"Retângulo no plano $(r,\theta)$")
    ax.legend(loc="upper right", fontsize=8, framealpha=0.94)
    grade(ax)

    ax = eixos[1]
    theta = np.linspace(th0, th1, 80)
    externo = np.column_stack((r1 * np.cos(theta), r1 * np.sin(theta)))
    interno = np.column_stack((r0 * np.cos(theta[::-1]), r0 * np.sin(theta[::-1])))
    setor = np.vstack((externo, interno))
    ax.add_patch(Polygon(setor, closed=True, facecolor="#c6dbef", edgecolor=AZUL, lw=1.5, zorder=2))
    arco = np.linspace(th0, th1, 60)
    ax.plot(np.cos(arco), np.sin(arco), color=LARANJA, ls="--", lw=1.2, zorder=3)
    raio = np.linspace(r0, r1, 20)
    ax.plot(raio * np.cos(np.pi / 4), raio * np.sin(np.pi / 4), color=VERDE, ls="--", lw=1.2, zorder=3)
    for letra, (r, th) in cantos.items():
        ponto = np.array([r * np.cos(th), r * np.sin(th)])
        centro = np.array([np.cos(np.pi / 4), np.sin(np.pi / 4)])
        fora = ponto - centro
        fora = fora / np.linalg.norm(fora) * 0.14
        ax.text(*(ponto + fora), letra, ha="center", va="center", fontsize=11, color=AZUL, zorder=4)
    ax.plot([0, 1.65 * np.cos(th0)], [0, 1.65 * np.sin(th0)], color="#dddddd", lw=0.8, zorder=0)
    ax.plot([0, 1.65 * np.cos(th1)], [0, 1.65 * np.sin(th1)], color="#dddddd", lw=0.8, zorder=0)
    ax.set_aspect("equal")
    ax.set_xlim(-0.2, 1.75)
    ax.set_ylim(-0.15, 1.7)
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_title("Imagem: setor anular")
    grade(ax)
    salvar(fig, "polar_jacobiano")


def _arco_theta(ax, raio, theta, n=48):
    t = np.linspace(0, theta, n)
    ax.plot(raio * np.cos(t), raio * np.sin(t), np.zeros_like(t), color=LARANJA, lw=2.0)


def _arco_phi(ax, raio, phi, theta, n=48):
    alfa = np.linspace(0, phi, n)
    ax.plot(
        raio * np.sin(alfa) * np.cos(theta),
        raio * np.sin(alfa) * np.sin(theta),
        raio * np.cos(alfa),
        color="#7b2d8e",
        lw=2.0,
    )


def figura_coordenadas_esfericas():
    fig = plt.figure(figsize=(6.4, 5.4))
    ax = fig.add_subplot(111, projection="3d")
    rho = 2.0
    phi = np.pi / 3
    theta = np.pi / 6
    x = rho * np.sin(phi) * np.cos(theta)
    y = rho * np.sin(phi) * np.sin(theta)
    z = rho * np.cos(phi)
    limite = 2.35
    for fim in ((limite, 0, 0), (0, limite, 0), (0, 0, limite)):
        ax.plot([0, fim[0]], [0, fim[1]], [0, fim[2]], color="#bbbbbb", lw=0.8)
    ax.text(limite, 0, 0.02, r"$x$", ha="left")
    ax.text(0, limite, 0.02, r"$y$")
    ax.text(0, 0, limite, r"$z$")
    ax.plot([0, x], [0, y], [0, 0], color=CINZA_CLARO, ls="--", lw=1.1)
    ax.plot([x, x], [y, y], [0, z], color=CINZA_CLARO, ls="--", lw=1.1)
    ax.plot([0, x], [0, y], [0, z], color=AZUL, lw=2.2)
    _arco_theta(ax, 0.62, theta)
    _arco_phi(ax, 0.95, phi, theta)
    ax.scatter([0], [0], [0.95], color="#7b2d8e", s=16, zorder=5)
    ax.scatter([x], [y], [z], color=VERMELHO, s=28, zorder=5)
    ax.scatter([x], [y], [0], color=CINZA, s=16)
    meio = phi / 2
    ax.text(0.55 * x + 0.02, 0.55 * y + 0.16, 0.55 * z + 0.08, r"$\rho$", color=AZUL)
    ax.text(0.72, 0.28, 0.02, r"$\theta$", color=LARANJA)
    ax.text(
        0.95 * np.sin(meio) * np.cos(theta) - 0.18,
        0.95 * np.sin(meio) * np.sin(theta) + 0.22,
        0.95 * np.cos(meio) + 0.05,
        r"$\varphi$",
        color="#7b2d8e",
    )
    ax.text(x + 0.06, y + 0.06, z + 0.08, r"$P$", color=VERMELHO)
    ax.set_xlim(0, limite)
    ax.set_ylim(0, limite)
    ax.set_zlim(0, limite)
    try:
        ax.set_box_aspect((1, 1, 1))
    except Exception:
        pass
    ax.set_title(r"Esféricas: $\varphi$ desde $z$, $\theta$ desde $x$")
    ax.view_init(elev=20, azim=-58)
    salvar(fig, "coordenadas_esfericas")


def figura_campo_vetorial():
    fig, eixos = plt.subplots(1, 2, figsize=(7.6, 3.7), layout="constrained")
    malha = np.linspace(-1.8, 1.8, 7)
    X, Y = np.meshgrid(malha, malha)
    campos = (
        (X, Y, AZUL, r"$F=(x,y)$, conservativo"),
        (-Y, X, VERMELHO, r"$F=(-y,x)$, anti-horário"),
    )
    for ax, (U, V, cor, titulo) in zip(eixos, campos):
        modulo = np.hypot(U, V)
        mascara = modulo < 1e-9
        seguro = np.where(mascara, 1.0, modulo)
        ax.quiver(
            X,
            Y,
            np.ma.array(U / seguro, mask=mascara),
            np.ma.array(V / seguro, mask=mascara),
            angles="xy",
            scale_units="xy",
            scale=3.4,
            width=0.006,
            color=cor,
            pivot="mid",
        )
        ax.set_aspect("equal")
        ax.set_xlim(-2.15, 2.15)
        ax.set_ylim(-2.15, 2.15)
        ax.set_xlabel(r"$x$")
        ax.set_ylabel(r"$y$")
        ax.set_title(titulo)
        grade(ax)
    salvar(fig, "campo_vetorial")


def figura_green():
    fig, ax = plt.subplots(figsize=(6.8, 3.9))
    ax.add_patch(
        Rectangle((0, 0), 2, 1, facecolor="#e8f0f8", edgecolor="#222222", lw=1.4, zorder=1)
    )
    seta(ax, (0.28, 0), (1.72, 0), AZUL)
    seta(ax, (2, 0.16), (2, 0.84), AZUL)
    seta(ax, (1.72, 1), (0.28, 1), AZUL)
    seta(ax, (0, 0.84), (0, 0.16), AZUL)
    ax.text(1, -0.18, r"$C_1$ inferior", ha="center", va="top", fontsize=11)
    ax.text(2.18, 0.5, r"$C_2$ direito", ha="left", va="center", fontsize=11)
    ax.text(1, 1.16, r"$C_3$ superior", ha="center", va="bottom", fontsize=11)
    ax.text(-0.16, 0.5, r"$C_4$ esquerdo", ha="right", va="center", fontsize=11)
    ax.set_aspect("equal", adjustable="box")
    ax.set_xlim(-0.95, 3.15)
    ax.set_ylim(-0.48, 1.42)
    ax.set_xticks([0, 1, 2])
    ax.set_yticks([0, 1])
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_title(r"Retângulo $[0,2]\times[0,1]$, bordo anti-horário")
    grade(ax)
    salvar(fig, "green")


def main():
    figura_abs_e_intervalos()
    figura_circulo_trigonometrico()
    figura_conicas()
    figura_produto_escalar_vetorial()
    figura_epsilon_delta()
    figura_descontinuidades()
    figura_secante_tangente()
    figura_riemann()
    figura_cardioide()
    figura_somas_parciais()
    figura_taylor_seno()
    figura_helice()
    figura_curvas_nivel()
    figura_gradiente_nivel()
    figura_lagrange()
    figura_polar_jacobiano()
    figura_coordenadas_esfericas()
    figura_campo_vetorial()
    figura_green()
    print("figuras concluídas", flush=True)


if __name__ == "__main__":
    try:
        main()
    except Exception as erro:
        STATUS.write_text(
            "erro ao gerar figuras\n" f"{type(erro).__name__}: {erro}\n",
            encoding="utf-8",
        )
        raise
