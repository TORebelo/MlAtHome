# 🚩 Checkpoint 01: The Engine (O Motor)
**Status:** 🟡 In Progress  
**Objetivo:** Construir a base matemática (vetores, normas) e implementar o primeiro algoritmo de otimização (Gradient Descent) do zero.

---

## 🧠 1. Teoria & Intuição
*Combustível mental antes de codar.*

### 📖 Leitura Rápida (Site Modules)
- [ ] **Linear Algebra:** Dot Product & Vector Norms (Base geométrica).
- [ ] **Calculus:** Partial Derivatives (A base da mudança).
- [ ] **Optimization:** Backpropagation & Gradient Descent (O algoritmo).

### 📺 Vídeos (Intuição)
- [ ] **Weinberger Lec 1 & 2:** Intro & Setup (ver a 1.5x).
- [ ] **Weinberger Lec 12 (Parte 1):** [Gradient Descent / Newton's Method](https://www.youtube.com/watch?v=o6FfdP2uYh4&list=PLl8OlHZGYOQ7bkVbuRthEsaLr7bONzbXS&index=12).
    * *Foco:* Diferença geométrica entre descer às cegas (GD) vs usar curvatura (Newton).

### 📘 Livro (A Verdade)
- [ ] **[Boyd] Convex Optimization:** Capítulo 2, Secção 2.1 (Pág 21-24).
    * *Missão:* Responder à pergunta: "O que raio é um conjunto convexo vs afim?"
    * *Teste:* A linha entre dois pontos fica toda lá dentro?

---

## 🛠️ 2. Prática (The Gym)
*Trabalha em `solutions/local.ipynb` (cópia local de `scaffolded.ipynb`).*

```bash
cp scaffolded.ipynb solutions/local.ipynb   # primeira vez
```

Tasks no notebook (todas com asserts):

| § | Task | Foco |
| - | ---- | ---- |
| §1.1 | Sigmoid | porta lógica suave; testas σ(0)=0.5, simetria, derivada numérica |
| §1.2 | Dot product (manual + NumPy) | projeção; ortogonalidade; v·v = ‖v‖² |
| §1.3 | Norma L2 | magnitude; ponte álgebra↔geometria |
| §1.4 | Normalizar | vetor unitário; cuidado com vetor zero |
| §1.5 | Ângulo (cosine similarity) | base de embeddings/LLMs; teste 0°, 45°, 90°, 180° |
| §2.1 | Gradient Descent 1D | minimizar `x² - 4x + 1`, convergência para `x*=2` |
| §2.2 | Visualizar trajetória | plot de `x` e `f(x)` ao longo das iterações |
| §2.3 | Sensibilidade ao `lr` | `lr ∈ [0.01, 0.1, 0.5, 0.99, 1.01]`; ver convergência vs divergência |

---

## ✅ 3. Definition of Done
*Só avanças para o Checkpoint 02 se marcares tudo abaixo:*

- [ ] As 8 tasks do `solutions/local.ipynb` correm sem `AssertionError`
- [ ] O Gradient Descent convergiu para `2.0` (Task 2.1)
- [ ] Sabes explicar (sem ver):
  - [ ] Diferença geométrica entre Gradient Descent e Método de Newton
  - [ ] Diferença entre Conjunto Afim (reta infinita) e Convexo (segmento)
  - [ ] Porque é que existe um `lr` máximo acima do qual GD diverge — relação com curvatura