import numpy as np
import matplotlib.pyplot as plt

def exercise_21_dot_product(a, b):
    """
    Objetivo: Implementar o produto interno (dot product) manualmente.
    Fórmula: sum(a[i] * b[i])
    """
    # 1. Versão Manual (Loop) - Para entenderes a mecânica
    manual_dot = 0.0
    # TODO: Escreve o loop for aqui
    
    # 2. Versão NumPy (Vectorizada) - Para performance
    numpy_dot = 0.0 # TODO: Usa np.dot aqui
    
    print(f"Manual: {manual_dot}, NumPy: {numpy_dot}")
    return numpy_dot

def exercise_01_sigmoid(x):
    """
    Objetivo: Implementar a função de ativação Sigmoid.
    Fórmula: 1 / (1 + e^-x)
    Nota: Usa np.exp() para exponenciais.
    """
    # TODO: Implementar fórmula
    return 0.0

def exercise_25_gradient_descent_1d():
    """
    Objetivo: Encontrar o mínimo de f(x) = x^2 - 4x + 1
    Derivada f'(x) = 2x - 4
    """
    x = -5.0  # Começamos longe do mínimo (que é x=2)
    learning_rate = 0.1
    iterations = 20
    
    history = []
    
    print(f"Start x: {x}")
    for i in range(iterations):
        # 1. Calcular Gradiente
        grad = 0.0 # TODO: Implementar 2x - 4
        
        # 2. Atualizar x (Descida)
        # x_new = x_old - learning_rate * gradient
        x = x # TODO: Atualizar x
        
        history.append(x)
        print(f"Iter {i}: x={x:.4f}, f(x)={x**2 - 4x + 1:.4f}")
        
    return history

if __name__ == "__main__":
    print("--- Exercício 21: Dot Product ---")
    a = np.array([1, 2, 3])
    b = np.array([4, 5, 6])
    exercise_21_dot_product(a, b)

    print("\n--- Exercício 01: Sigmoid ---")
    test_x = np.array([-10, 0, 10])
    print(f"Sigmoid de {test_x}: {exercise_01_sigmoid(test_x)}")

    print("\n--- Exercício 25: Gradient Descent ---")
    history = exercise_25_gradient_descent_1d()
    
    # Visualização rápida (Opcional)
    plt.plot(history, 'o-')
    plt.title("Convergência do Gradient Descent")
    plt.xlabel("Iteração")
    plt.ylabel("Valor de x")
    plt.axhline(y=2, color='r', linestyle='--', label='Mínimo Real (x=2)')
    plt.legend()
    plt.show()