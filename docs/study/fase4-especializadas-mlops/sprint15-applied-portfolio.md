# Sprint 15 — Applied Portfolio Project (semanas 27-28)

**Pergunta nuclear:** *"Vou construir um projeto end-to-end portfolio-quality que demonstre todas as skills das fases anteriores."*

> Sprint walkthrough-light. Made-With-ML (vendored em Sprint 14, partilhado) é o **scaffold de referência** para a estrutura do teu repo público — não copia, **espelha-o nos pontos certos** (config, data, train, evaluate, serve, tests, deploy). O conteúdo do projeto é teu; a forma é industry-standard.

**Substituí o Sprint 15-21 original (paper writing PhD-style).** Em vez disso, **constróis 1 projeto público** com todos os ingredientes que recruiters de quant/ML want ver:
- Problema real, dataset não-toy
- Pipeline de dados reprodutível
- Modelos comparativos (baseline + ML + DL/RL)
- Evaluation rigorosa (CV honesta, CIs, statistical tests, behavioral tests)
- Deployment vivo (URL pública)
- Documentação clara
- Código limpo no GitHub

### Sessão 0 — Estudar a forma Made-With-ML antes de começar

Build:        Re-ler `README.md` do MWML focando agora em **estrutura repo** (não conteúdo). Identificar o esqueleto reutilizável: config single-source-of-truth, separação data/models/serve, tests/{code,data,model}, deploy/{jobs,services}. Listar 5-7 ficheiros-pilar que vais espelhar no teu repo.
Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/README.md
Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/pyproject.toml
Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/Makefile
Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/notebooks/madewithml.ipynb
Reference:    Huyen — *Designing ML Systems* (estrutura mental para o projeto). Goku Mohandas — *Made With ML* lessons (referência integradora).
Source:       https://github.com/GokuMohandas/Made-With-ML
Output:       Fase4_SpecializedMLOps/Sprint15_Portfolio/notebooks/00_scaffold_plan.md

### Escolher 1 de 3 tracks (ou propor outro)

**Track A — Trading agent end-to-end** (alinha com quant career):
- Universe: top 100 stocks S&P por market cap.
- Strategy: combinar XGBoost predictions + RL allocation + risk management.
- Backtesting: walk-forward, costs realistas, deflated Sharpe.
- Deploy: dashboard web vivo com simulated portfolio P&L diário.
- Repo: público com README forte.
- Cross-fase: reutiliza Fase 3 (RL) + Fase 4 (MLOps) + lições do QuantHome.

**Track B — NLP product** (mais wide industry appeal):
- Problema: financial sentiment / earnings transcript Q&A.
- Stack: HuggingFace + RAG + vector DB (Chroma/Qdrant). Antecipa Fase 5.
- Frontend: Streamlit ou Next.js.
- Deploy: vivo com auth simples.
- Demo: video curto + blog post.
- Cross-fase: Fase 2 (transformers) + Fase 4 (MLOps) + preview Fase 5 (RAG).

**Track C — Computer vision SaaS** (se vision te puxar):
- Problema: visual quality control / OCR / anomaly detection num domain específico.
- Stack: PyTorch + ViT/CNN + FastAPI.
- Frontend: upload page com inference em tempo real.
- Deploy: vivo.
- Demo: video + landing page.
- Cross-fase: Fase 2 (CNN/ViT) + Fase 4 (MLOps).

### Estrutura semanal

**Semana 1 — Skeleton + baseline**

1. **Decidir track + escopo concreto.** 1 página de PRD (problem, users, success metric, non-goals). Output: `notas/sprint15-prd.md`.
2. **Acquisition + cleaning de dados.** Espelhar `madewithml/data.py` se aplicável. Output: `data/` + `src/data.py`.
3. **Baseline simples a funcionar end-to-end** (mesmo que mau): a model trivial mas a infra completa (load → train → eval → predict, sem serving ainda). Output: `01_baseline/`.
4. **Repo público criado**, README inicial com PRD + roadmap, primeiro commit.

**Semana 2 — Production-grade + deploy**

1. **Modelo principal treinado e avaliado rigorosamente.** Aplicar Sprint 13 stack: bootstrap CIs, slice metrics, behavioral tests, calibration onde aplicável. Output: `src/{train,evaluate}.py` + `02_model_eval/`.
2. **Serving + deploy vivo (URL pública partilhável).** FastAPI + Docker + Railway/Fly.io. Espelhar `serve.py` + `deploy/services/serve_model.py` do MWML em versão mais leve. Output: `src/serve.py` + URL viva no README.
3. **Tests + CI.** Replicar `tests/{code,data,model}/` do MWML. GitHub Actions a correr pytest em cada PR. Output: `tests/` + `.github/workflows/ci.yml`.
4. **Documentation + blog post** (Medium/Substack/dev.to) — escolher 2-3 takeaways não óbvios e escrever 600-800 palavras.
5. **Partilhar no LinkedIn / Twitter / r/MachineLearning.**

### Walkthrough de referência integrado (sessão recurrent)

Sempre que estagnares numa parte estrutural (e.g. "como organizo config? como separo train/serve? que padrão de teste para data?"), volta ao MWML:

Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/madewithml/config.py
Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/madewithml/utils.py
Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/tests/code/conftest.py
Source:       https://github.com/GokuMohandas/Made-With-ML

> **Regra:** ler MWML primeiro, decidir o que keep/drop/adapt para o teu contexto, **depois** escrever próprio. Não copiar literal — o objetivo é internalizar a forma.

### Entrega final da Fase 4

- 1 link público vivo (URL partilhável).
- 1 repo GitHub starred-worthy (README forte, tests verdes, CI verde).
- 1 blog post / video demo.
- `notas/fase4-retrospectiva.md` — o que aprendeste sobre construir ML real (não Kaggle)? Onde é que a forma MWML te poupou tempo? Onde é que a sentiste over-engineered para o teu escopo?

**Pergunta-teste:** "Em 3 minutos a um recruiter: o que faz o teu projeto, qual foi a decisão técnica não-óbvia, e como o avaliarias se fosse um peer review?"
