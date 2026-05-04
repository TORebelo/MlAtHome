# Sprint 15 — Applied Portfolio Project (semanas 27-28)

**Pergunta nuclear:** *"Vou construir um projeto end-to-end portfolio-quality que demonstre todas as skills das fases anteriores."*

**Substituí o Sprint 15-21 original (paper writing PhD-style).** Em vez disso, **constróis 1 projeto público** com todos os ingredientes que recruiters de quant/ML want ver:
- Problema real, dataset não-toy
- Pipeline de dados reprodutível
- Modelos comparativos (baseline + ML + DL/RL)
- Evaluation rigorosa (CV honesta, CIs, statistical tests)
- Deployment vivo (URL pública)
- Documentação clara
- Código limpo no GitHub

### Escolher 1 de 3 tracks (ou propor outro)

**Track A — Trading agent end-to-end** (alinha com quant career):
- Universe: top 100 stocks S&P por market cap
- Strategy: combinar XGBoost predictions + RL allocation + risk management
- Backtesting: walk-forward, costs realistas, deflated Sharpe
- Deploy: dashboard web vivo com simulated portfolio P&L diário
- Repo: público com README forte

**Track B — NLP product** (mais wide industry appeal):
- Problema: financial sentiment / earnings transcript Q&A
- Stack: HuggingFace + RAG + vector DB (Chroma/Qdrant)
- Frontend: Streamlit ou Next.js
- Deploy: vivo com auth simples
- Demo: video curto + blog post

**Track C — Computer vision SaaS** (se vision te puxar):
- Problema: visual quality control / OCR / anomaly detection num domain específico
- Stack: PyTorch + ViT/CNN + FastAPI
- Frontend: upload page com inference em tempo real
- Deploy: vivo
- Demo: video + landing page

### Estrutura semanal

**Semana 1:**
- Decidir track + escopo concreto.
- Acquisition + cleaning de dados.
- Baseline simples a funcionar end-to-end (mesmo que mau).
- Repo público criado, README inicial, primeira commit.

**Semana 2:**
- Modelo principal treinado e avaliado rigorosamente.
- Deploy vivo (URL pública partilhável).
- Documentation + blog post (Medium/Substack/dev.to).
- Partilhar no LinkedIn / Twitter / r/MachineLearning.

**Entrega final da Fase 4:**
- 1 link público vivo
- 1 repo GitHub starred-worthy
- 1 blog post / video demo
- `notas/fase4-retrospectiva.md` — o que aprendeste sobre construir ML real (não Kaggle)?
