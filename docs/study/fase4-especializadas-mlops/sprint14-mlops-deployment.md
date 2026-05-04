# Sprint 14 — MLOps & Deployment (semanas 25-26)

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
