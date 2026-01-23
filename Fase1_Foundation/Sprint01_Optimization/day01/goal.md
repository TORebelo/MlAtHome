Exercise 21: Dot Product

    Objetivo: Entender projeção geométrica.

    Code: Implementa a⋅b=∑ai​bi​ usando loops e depois usando np.dot.

Exercise 1: Sigmoid

    Objetivo: A função de ativação mais básica.

    Fórmula: σ(x)=1+e−x1​

Exercise 25: Gradient Descent (1D Quadratic)

    Objetivo: O "Hello World" da otimização.

    Tarefa: Minimizar f(x)=x2−4x+1. Derivada é 2x−4. Atualiza x=x−η⋅(2x−4)


📺 Passo 2: A Intuição (60 min)

Fecha o código. Pega num caderno e caneta.

    Vê: Kilian Weinberger Lecture 12: Gradient Descent / Newton's Method.

    https://www.youtube.com/watch?v=o6FfdP2uYh4&list=PLl8OlHZGYOQ7bkVbuRthEsaLr7bONzbXS&index=12

    Foco: Ignora a prova formal por agora. Foca-te em entender a diferença geométrica:

        Gradient Descent: Desce a encosta às cegas (1ª ordem).

        Newton's Method: Usa a curvatura (2ª ordem / Hessiana) para saltar direto para o fundo.

📘 Passo 3: A Verdade (45 min)

Abre o [Boyd] Convex Optimization (PDF).

    Lêr: Capítulo 2, Secção 2.1 (Affine and Convex Sets). Páginas 21 a 24.

    Apenas uma pergunta para responder: "O que raio é um conjunto convexo?"

        Teste: Se desenhares uma linha entre dois pontos quaisquer dentro da forma, a linha fica toda lá dentro? Se sim, é convexo. Se não, não é.

        Porquê: Otimização só funciona garantidamente em conjuntos convexos.