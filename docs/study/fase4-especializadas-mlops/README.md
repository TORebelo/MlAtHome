# Fase 4 — Especializadas + MLOps + Applied Portfolio

> 4 sprints, 6 semanas. Substitui a Fase 5+ original (paper publication PhD-style). Aqui o objetivo é **portfolio aplicado employable** — Sprint 12 (GNNs como specialty), Sprint 13 (evaluation rigorosa), Sprint 14 (MLOps deployment), Sprint 15 (1 projeto end-to-end portfolio-quality).

**Pasta de output:** `Fase4_Applied/Sprint1X_Y/`.

---

## Sprint 12 — Graphs & GNNs (semana 23)

**Pergunta nuclear:** *"Quando os dados são relacionais (social networks, molecules, supply chains), GNNs vencem MLPs/CNNs. Como?"*

1. **PageRank from-scratch.** Build: PageRank em pequeno graph dirigido. Output: `01_pagerank.py`. Reference: Page & Brin (1998).
2. **Spectral graph theory intuição.** Build: Laplacian de um graph, eigenvectors → community detection. Output: `02_spectral.py`. Reference: Chung — *Spectral Graph Theory*.
3. **GCN com PyTorch Geometric.** Build: GCN para node classification em Cora dataset. Output: `03_gcn_cora.py`. Reference: Kipf & Welling (2017). Library: `torch_geometric`.
4. **GraphSAGE para large graphs.** Build: aplicar a OGB dataset. Output: `04_graphsage.py`. Reference: Hamilton et al. (2017).
5. **GAT (attention em graphs).** Build: comparar com GCN no mesmo dataset. Output: `05_gat.py`. Reference: Veličković et al. (2018).
6. **Aplicação financeira: stock graph.** Build: construir graph de correlações entre stocks S&P, aplicar GCN para predição de moves. Output: `06_stock_graph.py`.

**Reference:** Hamilton — *Graph Representation Learning* (open access). PyTorch Geometric tutorials.

**Entrega:** `notas/sprint12-resumo.md`.

---

## Sprint 13 — Evaluation Rigorosa (semana 24)

**Pergunta nuclear:** *"O meu modelo tem accuracy 0.92 no test set. Que confiança real é que tenho neste número?"*

1. **Confidence intervals para métricas.** Build: bootstrap CI para accuracy, AUC, F1. Aplicar a um classifier qualquer. Output: `01_bootstrap_ci.py`.
2. **Significance testing entre modelos.** Build: paired t-test e McNemar test para comparar 2 classifiers. Output: `02_model_comparison.py`. Reference: Dietterich (1998).
3. **Multiple testing correction.** Build: comparar 10 modelos, mostrar que sem Bonferroni/FDR tens false positives. Output: `03_multiple_testing.py`.
4. **Calibration.** Build: reliability diagrams + Brier score. Aplicar Platt scaling e Isotonic. Output: `04_calibration.py`. Reference: Niculescu-Mizil & Caruana (2005).
5. **Distribution shift detection.** Build: usar `evidently` ou `alibi-detect` para detectar drift entre train e production data. Output: `05_drift_detection.py`.
6. **Fairness audit.** Build: demographic parity, equalized odds em dataset com protected attribute (Adult). Output: `06_fairness.py`. Reference: Hardt et al. (2016).
7. **Adversarial robustness.** Build: avaliar robustness a perturbações input (FGSM, PGD). Output: `07_adversarial_eval.py`. Library: `foolbox`.
8. **Final evaluation suite.** Build: package `evaluation/` reusable que aplica tudo a qualquer model. Output: `08_eval_suite/`.

**Reference:** ESL cap 7. López de Prado caps 11-14. Dietterich (1998) — paper sobre statistical tests.

**Entrega:** `notas/sprint13-resumo.md`.

---

## Sprint 14 — MLOps & Deployment (semanas 25-26)

**Pergunta nuclear:** *"Treinaste um modelo bom. Agora — como é que ele serve predictions em prod, com monitorização?"*

### Semana 1 — Serving + monitoring

1. **FastAPI ML serving.** Build: API que serve um classifier treinado. Endpoints: `/predict`, `/health`, `/metrics`. Output: `01_fastapi_serving/`. Reference: FastAPI docs.
2. **Docker containerization.** Build: Dockerfile multi-stage para a API. `docker-compose.yml`. Output: `02_docker/`.
3. **Load testing.** Build: usar Locust para load test. Medir latency p50/p95/p99 e throughput. Output: `03_load_test/`.
4. **Model registry com MLflow.** Build: track experiments + register model versions. Output: `04_mlflow/`.
5. **Monitoring com Prometheus + Grafana.** Build: instrumentar API com `prometheus_client`. Dashboard com latency + error rate + prediction distribution. Output: `05_monitoring/`.
6. **Data drift detection em produção.** Build: integrar `evidently` ou `nannyml` para alertas de drift. Output: `06_drift_prod/`.

### Semana 2 — CI/CD para ML

1. **GitHub Actions para ML.** Build: workflow com `pytest` + model validation + deploy. Output: `07_gha_ml/`.
2. **Feature store básico.** Build: Feast ou simple Postgres-based feature store. Output: `08_feature_store/`.
3. **A/B testing infrastructure.** Build: serve 2 model versions, route 50/50, comparar metrics. Output: `09_ab_test/`.
4. **Retraining pipeline.** Build: scheduled retraining quando drift detected. Output: `10_retraining/`.
5. **Final deployment.** Build: deploy real (Railway / Fly.io / Render) de um model com monitoring. URL pública. Output: `11_deploy/` + URL viva no README.

**Reference:** Huyen — *Designing Machine Learning Systems* (referência core). Sculley et al. (2015) — *Hidden Technical Debt in Machine Learning Systems*.

**Entrega:** `notas/sprint14-resumo.md`.

---

## Sprint 15 — Applied Portfolio Project (semanas 27-28)

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

**Entrega final da Fase 4 e do MlAtHome:**
- 1 link público vivo
- 1 repo GitHub starred-worthy
- 1 blog post / video demo
- `notas/fase4-retrospectiva.md` — o que aprendeste sobre construir ML real (não Kaggle)?

---

## Bibliografia da Fase 4

- Hamilton — *Graph Representation Learning*
- Huyen — *Designing Machine Learning Systems* (MLOps Bible)
- López de Prado — para evaluation rigor
- Dietterich (1998) — statistical tests
- Sculley et al. (2015) — hidden technical debt

---

## Próximos passos depois desta Fase

Não há "Fase 5". Se chegaste aqui, tens:
- ML solid (Fase 1-2)
- RL applied (Fase 3)
- Portfolio público + MLOps stack (Fase 4)

Decisões a tomar (alinhadas com `/plan` de carreira):
- **Industry:** aplicar a ML/quant roles. Portfolio + GitHub + LinkedIn levam-te longe.
- **Specialization:** mergulhar em sub-area (RL research, NLP, vision, MLOps engineering).
- **Academia:** se quiseres voltar a paper writing, a Fase 5+ original do roadmap fica disponível no `README.md` original como referência.
