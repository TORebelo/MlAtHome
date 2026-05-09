# Slides (external, vendored)

Slides PDF de cursos externos, usados como **camada de intuição visual** dentro dos sprints do MlAtHome. Não são curso paralelo — abrir antes do sprint relevante para dar o "mental model" antes de atacar exercícios/projecto.

Mapeamento curso→sprint vive em `docs/study/README.md` (secção bibliografia "Slides").

## Como referenciar num sprint (LearningHub)

Para que apareça clicável no painel Recursos do LearningHub, usar markdown link com caminho relativo a partir da raiz do repo:

```markdown
[Slides DLS C2_W2 — Optimization](resources/slides/DLS/DLS_C2/C2_W2.pdf)
```

O LearningHub serve o PDF via `/api/resources/ml/...` (rota com path-traversal protection). Caminhos absolutos ou que escapem a `resources/` são rejeitados.

## Sources

| Pasta | Curso | Autor | URL |
|---|---|---|---|
| `MLS/` | Machine Learning Specialization (C1-C3) | Andrew Ng — Stanford Online / DeepLearning.AI | https://www.deeplearning.ai/courses/machine-learning-specialization/ |
| `DLS/` | Deep Learning Specialization (C1-C5) | Andrew Ng — DeepLearning.AI | https://www.deeplearning.ai/courses/deep-learning-specialization/ |

## License

Ambos os conjuntos de slides estão sob **Creative Commons Attribution-ShareAlike 2.0 (CC BY-SA 2.0)**, com a restrição adicional **non-commercial** declarada pela DeepLearning.AI no copyright notice da primeira página de cada PDF:

> *"DeepLearning.AI makes these slides available for educational purposes. You may not use or distribute these slides for commercial purposes. You may make copies of these slides and use or distribute them for educational purposes as long as you cite DeepLearning.AI as the source of the slides."*

Full license text: https://creativecommons.org/licenses/by-sa/2.0/legalcode

### Implicações para este repo

- **Uso pessoal local:** OK.
- **Repo público no GitHub:** OK desde que esta attribution se mantenha visível.
- **Redistribuição comercial (incluindo via produtos como o LearningHub se este vier a ser pago/com utilizadores externos):** **NÃO permitido** sem licença comercial separada.

Os PDFs originais são preservados sem modificação. Apenas metadados macOS (`__MACOSX/`, `.DS_Store`, `._*`) foram removidos durante a extracção.
