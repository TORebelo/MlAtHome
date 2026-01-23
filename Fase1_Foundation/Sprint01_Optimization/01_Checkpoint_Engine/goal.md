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
*Implementar em `gym_warmup.py` usando apenas NumPy.*

### (1) Sigmoid Activation
- [ ] **Implementar:** $S(x) = \frac{1}{1 + e^{-x}}$
- *Objetivo:* A "porta lógica" suave das redes neurais.

### (21) Dot Product
- [ ] **Implementar:** $a \cdot b = \sum a_i b_i$
- *Objetivo:* A operação fundamental de projeção. Se for 0, são ortogonais (90º).

### (30) 3D Vector Norm (Euclidean)
- [ ] **Implementar:** $\|v\|_2 = \sqrt{x^2 + y^2 + z^2}$
- *Objetivo:* Calcular a magnitude (tamanho) do vetor.

### (20) Normalize Vectors
- [ ] **Implementar:** $\hat{v} = \frac{v}{\|v\|}$
- *Objetivo:* Transformar num vetor unitário mantendo a direção.

### (63) Angle Between Vectors (Cosine Similarity)
- [ ] **Implementar:** $\cos(\theta) = \frac{a \cdot b}{\|a\| \|b\|}$
- *Objetivo:* A base da "Semantic Search" e LLMs.

### (25) Gradient Descent 1D
- [ ] **Tarefa:** Minimizar $f(x) = x^2 - 4x + 1$
- [ ] **Derivada:** $f'(x) = 2x - 4$
- [ ] **Update Rule:** $x_{new} = x_{old} - \eta \cdot f'(x_{old})$
- *Objetivo:* Ver o `x` convergir para `2.0`.

---

## ✅ 3. Definition of Done
*Só avanças para o Checkpoint 02 se marcares tudo abaixo:*

- [ ] O script `gym_warmup.py` corre sem erros e passa os testes básicos?
- [ ] O Gradient Descent convergiu para `2.0`?
- [ ] Sei explicar a diferença geométrica entre Gradient Descent e Newton?
- [ ] Sei explicar a diferença entre Conjunto Afim (reta infinita) e Convexo (segmento)?