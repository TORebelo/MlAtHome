# Sprint 14 — MLOps & Deployment (semanas 25-26)

**Pergunta nuclear:** *"Treinaste um modelo bom. Agora — como é que ele serve predictions em prod, com monitorização?"*

> Sprint walkthrough-driven. **Made-With-ML domina aqui.** O repo todo está vendored em `Sprint14_MLOps/external/made-with-ml/` — é um curriculum MLOps end-to-end (dataset tagging → train → tune → evaluate → serve via Ray Serve → monitor → CI/CD via Anyscale Jobs/Services). Lê módulo a módulo, depois adapta a estrutura ao teu projeto próprio (não copia, refaz com as tuas decisões). FastAPI/Docker/Prometheus stack continua own work — Ray Serve é a alternativa industry-grade vendored.

### Semana 1 — Pipeline + serving (Made-With-ML como espinha)

1. **Estudar a arquitetura Made-With-ML.**

   Build:        Ler `README.md` + `Makefile` + `pyproject.toml` para perceber o sistema. Mapear como cada módulo (`data → train → tune → evaluate → predict → serve`) encadeia. Desenhar diagrama do data flow.
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/README.md
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/Makefile
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/madewithml/config.py
   Reference:    Goku Mohandas — *Made With ML* (lessons gratuitos em madewithml.com).
   Source:       https://github.com/GokuMohandas/Made-With-ML
   Output:       Fase4_SpecializedMLOps/Sprint14_MLOps/notebooks/01_mwml_arch.md (diagrama + notas)

2. **Data pipeline + preprocessing.**

   Build:        Estudar `data.py` (Ray Data + cleaning + tokenization + preprocessing). Adaptar a um dataset diferente do teu (e.g. financial news headlines em vez de ML projects).
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/madewithml/data.py
   Reference:    Ray Data docs. Huyen — *Designing ML Systems* cap 4 (data engineering).
   Source:       https://github.com/GokuMohandas/Made-With-ML
   Output:       Fase4_SpecializedMLOps/Sprint14_MLOps/notebooks/02_data_pipeline.ipynb

3. **Train + tune com Ray Train + Ray Tune + MLflow.**

   Build:        Estudar `train.py` (Ray Train, distributed) + `tune.py` (HPO via Ray Tune). Compreender integração com MLflow (registry de experiências). Replicar para o teu modelo, mesmo que single-node.
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/madewithml/train.py
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/madewithml/tune.py
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/madewithml/models.py
   Reference:    Ray Train + Ray Tune docs. MLflow tracking quickstart.
   Source:       https://github.com/GokuMohandas/Made-With-ML
   Output:       Fase4_SpecializedMLOps/Sprint14_MLOps/notebooks/03_train_tune_mlflow.ipynb

4. **Serving com Ray Serve (industry reference) + comparativo FastAPI.**

   Build:        Estudar `serve.py` + `deploy/services/serve_model.py`. Compreender deployments, replicas, autoscaling. Construir paralelo: `01_fastapi_serving/` próprio com `/predict`, `/health`, `/metrics`. Comparar trade-offs (Ray Serve = batching automático + autoscaling vs FastAPI = simplicidade).
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/madewithml/serve.py
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/madewithml/predict.py
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/deploy/services/serve_model.py
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/deploy/services/serve_model.yaml
   Reference:    FastAPI docs. Ray Serve docs. Huyen cap 7 (model deployment).
   Source:       https://github.com/GokuMohandas/Made-With-ML
   Output:       Fase4_SpecializedMLOps/Sprint14_MLOps/04_serving/{fastapi,ray_serve}/

5. **Docker containerization.** Build: Dockerfile multi-stage para a tua API FastAPI. `docker-compose.yml` com a API + Postgres + Redis. Output: `05_docker/`.

6. **Load testing.** Build: usar `locust` para load test contra ambas (FastAPI + Ray Serve se conseguires correr local). Medir latency p50/p95/p99 e throughput. Output: `06_load_test/`.

7. **Monitoring com Prometheus + Grafana.** Build: instrumentar API com `prometheus_client`. Dashboard com latency + error rate + prediction distribution. Output: `07_monitoring/`. Reference: Huyen cap 8 (model monitoring).

8. **Data drift detection em produção.** Build: integrar `evidently` ou `nannyml` na API para alertas de drift contínuos. Reusar conhecimento Sprint 13. Output: `08_drift_prod/`.

### Semana 2 — CI/CD + jobs + deployment final

1. **Anyscale Jobs como referência de batch workloads.**

   Build:        Estudar como `deploy/jobs/workloads.{sh,yaml}` orquestra um pipeline batch (data → train → eval → register). Adaptar a estrutura para um GitHub Actions workflow próprio.
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/deploy/jobs/workloads.sh
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/deploy/jobs/workloads.yaml
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/deploy/cluster_compute.yaml
   Reference:    Anyscale Jobs docs. GitHub Actions docs.
   Source:       https://github.com/GokuMohandas/Made-With-ML
   Output:       Fase4_SpecializedMLOps/Sprint14_MLOps/09_gha_ml/

2. **Feature store básico.** Build: Feast ou simple Postgres-based feature store. Demonstrar reutilização entre training e serving. Output: `10_feature_store/`.

3. **A/B testing infrastructure.** Build: serve 2 model versions com weighted routing 50/50, comparar metrics em real-time. Output: `11_ab_test/`.

4. **Retraining pipeline.** Build: scheduled retraining quando drift detected (cron ou GH Actions). Trigger condicional. Output: `12_retraining/`.

5. **Final deployment.** Build: deploy real (Railway / Fly.io / Render) de um model com monitoring + URL pública. Replicar a forma do MWML mas em stack mais leve.
   Walkthrough:  ../../../Fase4_SpecializedMLOps/Sprint14_MLOps/external/made-with-ml/notebooks/madewithml.ipynb (notebook end-to-end como referência integradora)
   Output:       Fase4_SpecializedMLOps/Sprint14_MLOps/13_deploy/ + URL viva no README.

**Reference:** Huyen — *Designing Machine Learning Systems* (referência core). Sculley et al. (2015) — *Hidden Technical Debt in Machine Learning Systems*. Goku Mohandas — *Made With ML* (lessons completos online + repo vendored).

**Entrega:** `notas/sprint14-resumo.md` — pergunta-teste: "Em 2 minutos: trade-offs de Ray Serve vs FastAPI vs SageMaker/Vertex para serving. Quando escolher cada um?"
