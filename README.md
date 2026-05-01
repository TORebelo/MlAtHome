# 🎓 AI Architect & Research Engineer Roadmap — VERSÃO UNIFICADA

**Objetivo:** Dominar a criação de algoritmos de raiz (First Principles), desde a estatística clássica até Agentes RL de topo (AlphaZero), com aplicação final em Finanças Quantitativas.

**Bibliografia Nuclear:**

1. **[ESL]** *The Elements of Statistical Learning* (Hastie et al.)
2. **[Boyd]** *Convex Optimization* (Boyd & Vandenberghe)
3. **[DL Book]** *Deep Learning* (Goodfellow et al.)
4. **[Sutton]** *Reinforcement Learning* (Sutton & Barto)

**Recursos:**

- **Vídeos:** K. Weinberger (Cornell CS4780), Andrew Ng, David Silver
- **Exercícios Práticos:** Site (100 exercícios NumPy)
- **Links:** [Cornell Lectures](https://www.cs.cornell.edu/courses/cs4780/2018fa/lectures/) | [Homeworks](https://www.dropbox.com/scl/fi/y5gp6rtpjo4ycs9bfhyzf/Homeworks.zip?rlkey=4dj8mbn19y6injbjmuxwwck35&e=1&dl=0) | [Ml"leetcode"](https://www.tensortonic.com/)

---

## 🧪 OPCIONAL: Preparação Prática (Sprint 0)

**Recurso de vídeo:** [MIT 6.0002 — Computational Thinking & Data Science](https://ocw.mit.edu/courses/6-0002-introduction-to-computational-thinking-and-data-science-fall-2016/) (Prof. John Guttag), aulas 4-10.

**Notebook hands-on:** [`Fase1_Foundation/Sprint00_StochasticThinking/`](Fase1_Foundation/Sprint00_StochasticThinking/) — 15 micro-tasks com assertions, do random walk ao two-sample t-test. Vê o capítulo do Guttag, abre o notebook, escreve o código.

**Quando usar:**
- Se precisares de ponte entre programação básica e estatística aplicada
- Foco em: Monte Carlo, intervalos de confiança, amostragem, erros experimentais
- Útil antes de mergulhar em ESL (Sprint 2)

**Convenção:** O `scaffolded.ipynb` é o template (committed). Trabalhas em `solutions/local.ipynb` (gitignored). Vê o README do sprint para os detalhes.

---

## 🏗️ FASE 1: Fundamentos Matemáticos & Estatísticos (12 semanas)

### **Sprint 1: Otimização Convexa** (Semanas 1-4)

**Notebooks hands-on:** [`Fase1_Foundation/Sprint01_Optimization/`](Fase1_Foundation/Sprint01_Optimization/) — 5 checkpoints (Engine, Geometry, Velocity, Newton, Showdown), ~38 micro-tasks com asserts, do GD 1D ao showdown final de 7 otimizadores em Rosenbrock. Mesma convenção do Sprint 0: `scaffolded.ipynb` é template, trabalhas em `solutions/local.ipynb` (gitignored).

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| **K. Weinberger:** 1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15🎥 **Stephen Boyd** — Convex Optimization (Stanford EE364a)🎥 **freeCodeCamp:** [Machine Learning for Everybody](https://www.youtube.com/watch?v=i_LwzRVP7bg) (3:53:53)🎥 **freeCodeCamp:** [No Black Box Machine Learning Course](https://www.youtube.com/watch?v=vDDjtwQDw2k) (3:51:31)🎥 **Stanford CS229:** Lectures 1-2 (Andrew Ng) - Introduction, Linear Regression, Gradient Descent | **[Boyd]:**• Cap 2 (Convex Sets)• Cap 3 (Convex Functions)• Cap 4 (Convex Problems)• Cap 9 (Newton's Method)📄 Boyd lecture notes on Newton's Method | **Álgebra Linear:**(21) Dot Product(38) Matrix Transpose(35) Matrix Trace(30) 3D Vector Norm(20) Normalize Vectors(63) Angle Between Vectors(92) Make Diagonal Matrix**Otimização:**(25) Gradient Descent 1D(55) Mean Squared Error(3) Adam, (36) AdaGrad(93) RMSProp, (50) Nesterov(15) AdamW, (12) Nadam(61) AdaDelta(13) Learning Rate Scheduler | **Optimization Showdown:**1. Implementar biblioteca álgebra linear do zero2. Implementar 8 otimizadores3. Testar em Rosenbrock (não-convexo)4. **Implementar Newton's Method 2D manualmente**5. Provar convergência quadrática Newton vs linear GD**Relatório LaTeX:** Análise comparativa com provas matemáticas |

---

### **Sprint 2: Generalização & Bias-Variance** (Semanas 5-7)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| **Andrew Ng:** Bias/Variance concepts**K. Weinberger:** 16, 17, 18, 19, 20, 28, 29, 30, 31, 32, 33, 34🎥 **StatQuest** — Bias/Variance🎥 **freeCodeCamp:** [Machine Learning Course for Beginners](https://www.youtube.com/watch?v=NWONeJKn6kc) (9:52:19)🎥 **Stanford CS229:** Lectures 8-10 - Data Splits, Models, Cross-Validation, Decision Trees | **[ESL]:**• Cap 2 (Overview/Decision Theory)• Cap 7 (Model Assessment)  *Foco: Eq 7.9 (Effective Parameters)*📘 Hastie & Tibshirani — *An Introduction to Statistical Learning* (versão curta) | **Estatística:**(47) Mean, Median, Mode(78) Sample Variance & Std Dev(57) Percentiles/Quantiles(40) Bernoulli PMF(4) Binomial PMF(59) Poisson PMF & CDF(99) Geometric PMF(100) Expected Value(88) One-Sample t-Test(41) Chi-Square Test(44) Bootstrap CI | **Bias-Variance Lab:**1. Gerar dados sintéticos2. Fit polinómios de grau crescente3. **Criar visualização bias-variance decomposition** (não no site)4. Plotar train vs test error curves5. Decompor erro em Bias², Variância, Erro Irredutível**Relatório LaTeX:** Explicar "Optimism of Training Error" |

---

### **Sprint 3: Modelos Lineares & Regularização** (Semanas 8-10)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| **Andrew Ng:** GMMs & EM Algorithm, Regularization**K. Weinberger:** 7, 8, 9, 10, 26, 27📄 Tibshirani (1996) — Lasso original🎥 **freeCodeCamp:** [Scikit-Learn Course](https://www.youtube.com/watch?v=0B5eIE_1vpU) (2:54:25)🎥 **freeCodeCamp:** [Scikit-learn Crash Course](https://www.youtube.com/watch?v=M9Itm95JzL0) (2:09:22)🎥 **Stanford CS229:** Lectures 3-7 - Logistic Regression, Perceptron, GDA, Naive Bayes, SVM, Kernels🎥 **Stanford CS229:** Lectures 14-15 - EM Algorithm, Factor Analysis | **[ESL]:**• Cap 3 (Linear Methods: Ridge/Lasso)• Cap 4.4 (LDA)• Cap 8.5 (EM Algorithm) | **Modelos & Métricas:**(6) Covariance Matrix(83) Pearson Correlation(2) Logistic Regression Loop(1) Sigmoid(54) Accuracy, Precision, Recall, F1(48) Micro-F1(62) R² Score(67) Confusion Matrix(45) AUC, (76) ROC Curve(8) Euclidean Distance(77) Manhattan Distance(24) Cosine Similarity | **The Linear Suite:**1. **Implementar Ridge (L2) do zero**2. **Implementar Lasso (L1) do zero**3. **Implementar GMM com EM Algorithm**4. Implementar Logistic Regression completa5. **Plotar geometria L1 vs L2** (diamante vs círculo)6. Aplicar testes estatísticos (Sprint 2) para validar modelos**Relatório LaTeX:** Demonstração geométrica da sparsity do Lasso |

---

### **Sprint 4: Alta Dimensão (p >> N)** (Semanas 11-13)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| **S. Brunton:** Sparsity & Compressed Sensing📄 Donoho — High-Dimensional Data Analysis🎥 **Stanford CS229:** Lecture 9 - Approximation/Estimation Error & ERM | **[ESL]:**• Cap 18 (High-Dimensional)  Sec 18.3, 18.4, 18.6 | **Data Engineering:**(89) Eigenvalues(33) Matrix Inverse(18) Batch Shuffling ⭐(23) K-Fold Split(87) Stratified Split(73) Impute Missing Values(46) Min-Max Normalization(97) z-Score Standardization(95) Streaming Min-Max(26) Matrix Normalization(52) One-Hot Encoding | **Curse of Dimensionality:**1. Criar dataset onde p cresce até ultrapassar N2. **Implementar PCA do zero usando SVD** (não no site)3. Demonstrar colapso de Regressão Linear padrão4. Mostrar recuperação via L1 regularization5. Construir pipeline completo de dados**Relatório LaTeX:** Análise teórica de quando L1 recupera soluções esparsas |

---

## 🧬 FASE 2: Deep Learning & Representação (10 semanas)

### **Sprint 5: DL Optimization & Redes Neurais** (Semanas 14-16)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| **Andrew Ng:** Momentum / Adam**K. Weinberger:** 35, 36, 37🎥 **CS231n** — Optimization & Backprop📄 Goodfellow — Saddle Points paper🎥 **freeCodeCamp:** [TensorFlow 2.0 Complete Course](https://www.youtube.com/watch?v=tPYj3fFJGjk) (6:52:08)🎥 **freeCodeCamp:** [PyTorch for Deep Learning & ML](https://www.youtube.com/watch?v=V_xro1bcAuA) (25:37:26)🎥 **freeCodeCamp:** [Practical Deep Learning (fast.ai)](https://www.youtube.com/watch?v=0oyCUWLL_fU) (11:12:32)🎥 **freeCodeCamp:** [Deep Learning Crash Course](https://www.youtube.com/watch?v=VyWAvY2CF9c) (1:25:39)🎥 **freeCodeCamp:** [Keras with TensorFlow Course](https://www.youtube.com/watch?v=qFJeN9V1ZsI) (2:47:55)🎥 **freeCodeCamp:** [How Deep Neural Networks Work](https://www.youtube.com/watch?v=dPWYUELwIdM) (3:50:57)🎥 **freeCodeCamp:** [TensorFlow 2.0 Crash Course](https://www.youtube.com/watch?v=6g4O5UOH304) (2:13:17)🎥 **Stanford CS229:** Lectures 11-13 - Neural Networks, Backprop, Debugging ML Models | **[DL Book]:**• Cap 4 (Numerical)• Cap 6 (Deep Feedforward)• Cap 7 (Regularization)• Cap 8 (Optimization)  *Foco: Saddle Points & Hessians* | **DL Building Blocks:**(10) Dropout(16) Batch Normalization(11) Gradient Clipping(65) ReLU, (31) Leaky ReLU(14) GELU, (37) Swish(80) Tanh, (79) Softmax**Loss Functions:**(70) Cross-Entropy Loss(72) Hinge Loss(27) Huber Loss(42) Focal Loss(32) Dice Loss | **Optimizer Benchmark + MLP:**1. Implementar MLP de 3 camadas em NumPy puro2. Treinar no MNIST com diferentes otimizadores3. Analisar estabilidade em Saddle Points4. **Computar Hessian eigenvalues manualmente** (não no site)5. Comparar convergência em loss landscapes**Relatório LaTeX:** Análise de por que Adam funciona melhor em high-dimensional spaces |

---

### **Sprint 6: Latent Variables & VAE** (Semanas 17-19)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| **Arxiv Insights:** Variational Autoencoders📄 Rezende et al. — Stochastic Backprop | **[DL Book]:** Cap 20.10 (VAEs)**Paper:** Kingma & Welling (VAE) | **Métricas de Divergência:**(75) KL Divergence(22) InfoNCE Loss ⭐(56) Contrastive Loss(85) Triplet Loss(29) Wasserstein Critic Loss(7) Silhouette Score | **VAE from Scratch:**1. **Implementar encoder-decoder completo** (não no site)2. **Implementar Reparameterization Trick**3. Treinar em MNIST4. Derivar fórmula do ELBO matematicamente5. Visualizar latent space com t-SNE**Relatório LaTeX:** Derivação completa do ELBO e conexão com KL Divergence |

---

### **Sprint 7: Attention & Kernels** (Semanas 20-22)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| **CS224n (Stanford):** Transformers**K. Weinberger:** 21, 22, 23, 24, 25, 40[Additional Lecture 2023](https://youtu.be/kCc8FmEb1nY)📄 Rahimi & Recht — Random Features🎥 **freeCodeCamp:** [Python TensorFlow - Neural Network Text Classification](https://www.youtube.com/watch?v=VVpRWTEedc8) (1:54:11) | **[ESL]:** Sec 12.3 (SVMs & Kernels)*Estudar SVM como problema dual + kernel trick, NÃO como classificador***Paper:** Attention Is All You Need | **Sequências & NLP:**(9) RNN Step Forward(68) RNN Step Backward ⭐(17) Mini GRU Cell(98) Positional Encoding ⭐(69) Causal Masking ⭐(60) Pad Sequences(39) Bag-of-Words(82) TF-IDF ⭐(64) Bigram Probabilities(96) Word Count(66) Remove Stopwords(34) BM25 Ranking | **Attention Anatomy:**1. **Implementar Scaled Dot-Product Attention** (não no site completo)2. Implementar Transformer encoder-only (1 head)3. Testar em classificação de texto4. Comparar matematicamente attention com kernel smoothing5. Mostrar: primal→dual, kernel como inner product**Relatório LaTeX:** Demonstrar analogia entre attention e kernels aprendidos |

---

### **Sprint 8: CNNs & Visão** (Semanas 21-22)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **CS231n** — CNNs🎥 **freeCodeCamp:** [Self-Driving Car with JavaScript](https://www.youtube.com/watch?v=Rs_rAxEsAvI) (2:32:40)🎥 **freeCodeCamp:** [OpenCV Course - Full Tutorial](https://www.youtube.com/watch?v=oXlwWbU8l2o) (3:41:42)🎥 **freeCodeCamp:** [Computer Vision and Perception for Self-Driving Cars](https://www.youtube.com/watch?v=cPOtULagNnI) (1:59:38) | **[DL Book]:** Cap 9 (CNNs)*Convolution mathematics* | (94) Simple CNN Layer(19) Global Average Pooling(91) 4x4 Homogeneous Transform | **LeNet-5 Clone:**1. **Implementar conv2d com im2col** (não no site)2. Construir CNN completa em NumPy3. Treinar no MNIST**Relatório LaTeX:** Análise matemática de convolução como operação linear |

---

## 🎲 FASE 3: Aprendizagem Avançada (10 semanas)

### **Sprint 9: Árvores & Information Theory** (Semanas 23-24)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| *(Revisar StatQuest para árvores)* | **[ESL]:** Cap 9 (Additive Models & Trees)*Gradient Boosting theory* | (49) Entropy for Node(51) Gini Impurity(53) Information Gain(28) KNN Distance(74) Majority Class Classifier(81) Naive Bayes ⭐ | **Decision Tree from Scratch:**1. Implementar árvore de decisão pura2. Comparar com sklearn3. Estudar teoria de Random Forest/XGBoost (usar sklearn, não implementar)**Relatório LaTeX:** Análise de information gain vs Gini impurity |

---

### **Sprint 9.5 Novo — Boosting & Time-Series (3 semanas)**

Inserir **ANTES** de Sprint 10 (RL):

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos** | **Entrega** |
| --- | --- | --- | --- |
| 🎥 **StatQuest:** XGBoost, Gradient Boosting🎥 **ritvikmath:** Time-Series📄 **XGBoost paper** (Chen & Guestrin) | **[ESL]** Cap 10 (Boosting)Cap 14.7 (CART improvements)📘 **Rob Hyndman** — *Forecasting: Principles & Practice*Cap 8 (ARIMA), Cap 9 (Dynamic regression) | **Semana 1:**• Implementar AdaBoost do zero• Usar XGBoost (library) em dataset• Feature importance analysis**Semana 2:**• Implementar ARIMA do zero• Stationarity tests (ADF)• Forecast S&P500 returns**Semana 3:**• Feature engineering financeiro:  - Lag features  - Rolling windows  - Technical indicators  - Fractional differentiation (López de Prado) | **XGBoost vs RL Baseline:**1. Treinar XGBoost para prever direção do mercado2. Comparar com regressão logística3. Feature importance (SHAP)4. Usar como **baseline para Sprint 19Time-Series Report:**1. ARIMA vs persistence model2. Análise de stationarity3. Forecast evaluation (RMSE, MAE)**Relatório LaTeX:** Por que boosting funciona? Conexão com bias-variance. |

---

### **Sprint 10: Reinforcement Learning Core** (Semanas 25-27)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| **David Silver:** Policy Gradients📄 Peters & Schaal — Natural Policy Gradients🎥 **Stanford CS229:** Lectures 16-18 - ICA & RL, MDPs, Value/Policy Iteration, Continuous State MDP | **[Sutton]:**• Cap 6 (TD Learning)• Cap 13 (Policy Gradient)  Sec 13.2 (The Theorem) | (58) Monte Carlo Policy Eval(84) Tabular Q-Learning(90) TD Value Update(71) ε-Greedy Selection(5) Advantage Computation ⭐ | **RL Trilogy:**1. Implementar Tabular Q-Learning, SARSA, Monte Carlo2. **Implementar REINFORCE do zero** (não no site)3. Testar em CartPole4. Derivar ∇J(θ) matematicamente5. Implementar baseline e mostrar redução de variância**Relatório LaTeX:** Derivação do Policy Gradient Theorem e Log-Derivative Trick |

---

### **Sprint 11: Trust Regions & PPO** (Semanas 28-30)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **OpenAI Spinning Up** — PPOYouTube: PPO Explained📄 Schulman — TRPO paper🎥 **Stanford CS229:** Lectures 19-20 - Reward Model, Linear Dynamical System, RL Debugging | **[Boyd]:** Cap 5 (Duality)**Papers:** TRPO / PPO | (5) Advantage (revisão)(75) KL Divergence (revisão) | **PPO Deep Dive:**1. **Implementar PPO com clipping** (não no site)2. Treinar em LunarLander-v23. Comparar com/sem clipping4. Conectar clipping com Dualidade Lagrangiana5. Mostrar restrição de trust region**Relatório LaTeX:** Demonstrar matematicamente porque PPO é aproximação de TRPO |

---

### **Sprint 12: Multi-Agent & Quant Finance** (Semanas 31-32)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **DeepMind** — Multi-Agent RL TalksGame Theory: Nash Equilibrium📘 Shoham & Leyton-Brown — Multiagent Systems | **Paper:** MADDPG (Centralized Training)📘 **Marcos López de Prado** — *Advances in Financial MLleakage, backtest overfitting, purged CV, multiple testing* | *(Nenhum exercício específico no site)* | **Market Sim:**1. Simular compradores/vendedores com PettingZoo2. Analisar convergência para Nash Equilibrium3. Estudar López de Prado: purged k-fold, combinatorial CV4. Aplicar conceitos de ESL 18.7 (multiple testing)**Relatório LaTeX:** Diferenças entre game theory clássica e MARL |

---

## � **SPRINTS OPCIONAIS: Data Science Tradicional**

*Estes sprints são **opcionais** e podem ser feitos em paralelo ou após o roadmap principal. Focam em habilidades práticas de Data Science que complementam o conhecimento teórico de ML.*

---

### **Sprint Opcional A: Data Science Toolkit — EDA & Feature Engineering** (3 semanas)

📍 **Recomendado:** Após Sprint 4 ou em paralelo com Fase 2

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **Kaggle:** Learn courses (Pandas, Data Viz)🎥 **Ken Jee:** Data Science Project Walkthroughs📄 **Tufte** — Visual Display of Quantitative Information | 📘 **Wes McKinney** — *Python for Data Analysis*📘 **Jake VanderPlas** — *Python Data Science Handbook*📄 **Feature Engineering Guide** (Kaggle) | **Semana 1 (EDA):**• Histogramas, box plots, violin plots• Correlation matrices (Seaborn)• Interactive plots (Plotly)• Distribution analysis• Outlier detection (IQR, Z-score, Isolation Forest)**Semana 2 (Feature Engineering):**• Target encoding, frequency encoding• Feature interactions• Polynomial features• Date/time features• Text features (TF-IDF, embeddings)**Semana 3 (Pipeline Completo):**• sklearn Pipeline• Feature selection (RFE, SHAP)• Automated feature engineering (featuretools) | **Kaggle Competition Entry:**1. Escolher competição ativa (tabular data)2. **EDA Notebook:** Top 10% quality• Visualizações publication-ready• Statistical insights documentados3. **Feature Engineering Pipeline:**• Criar 50+ features• Documentar feature importance• Cross-validation rigorosa4. **Submit:** Entrar no top 50%**Relatório:** Storytelling com dados (apresentação de negócio) |

---

### **Sprint Opcional B: Bayesian Methods & Causal Inference** (4 semanas)

📍 **Recomendado:** Após Sprint 6 (VAE) — aproveitas conhecimento de probabilidade

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **Richard McElreath:** Statistical Rethinking lectures🎥 **Ben Lambert:** Bayesian Statistics📄 **Judea Pearl talks** — Causality | 📘 **Richard McElreath** — *Statistical Rethinking*📘 **Judea Pearl** — *Causality*📘 **Gelman et al.** — *Bayesian Data Analysis*📄 **DoWhy documentation** (Microsoft) | **Semana 1 (Bayesian Basics):**• Conjugate priors• MCMC from scratch (Metropolis-Hastings)• Gibbs sampling• PyMC/Stan basics**Semana 2 (Bayesian Modeling):**• Bayesian linear regression• Hierarchical models• Model comparison (WAIC, LOO)• Posterior predictive checks**Semana 3 (Causal Inference):**• DAGs (Directed Acyclic Graphs)• Backdoor criterion• Propensity score matching• Instrumental variables• Difference-in-differences**Semana 4 (A/B Testing):**• Bayesian A/B testing• Sequential testing (early stopping)• Multi-armed bandits (Thompson Sampling)• Power analysis | **Causal Analysis Report:**1. **Implementar MCMC do zero:**• Metropolis-Hastings• Convergence diagnostics (R-hat, ESS)• Trace plots2. **Causal Study:**• Dataset com confounders• Desenhar DAG• Aplicar 3 métodos (PSM, IV, DiD)• Comparar resultados3. **A/B Test Simulation:**• Simular experimento online• Bayesian analysis• Stopping rules• Cost-benefit analysis**Relatório LaTeX:** Provar causalidade vs correlação num caso real |

---

### **Sprint Opcional C: Time Series Avançado & Forecasting** (3 semanas)

📍 **Recomendado:** Expansão do Sprint 9.5 ou após Sprint 14

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **ritvikmath:** Time Series playlist📄 **Rob Hyndman blog** — Forecasting principles🎥 **Kaggle:** Time Series courses | 📘 **Rob Hyndman & George Athanasopoulos** — *Forecasting: Principles & Practice* (online grátis)📘 **James Hamilton** — *Time Series Analysis*📄 **Prophet paper** (Facebook) | **Semana 1 (Classical Methods):**• SARIMA (seasonal ARIMA)• Exponential smoothing (Holt-Winters)• Stationarity tests (ADF, KPSS, PP)• Seasonal decomposition (STL)• Granger causality**Semana 2 (Modern Approaches):**• Prophet (Facebook)• TBATS (multiple seasonality)• State-space models• VAR (Vector AutoRegression)• Multivariate forecasting**Semana 3 (Deep Learning for TS):**• LSTM for time series• Temporal Convolutional Networks (TCN)• Transformer for forecasting (Informer)• Conformal prediction (uncertainty) | **Forecasting Competition:**1. **Implementar SARIMA do zero**2. **Benchmark múltiplos métodos:**• Classical: ARIMA, ETS• Modern: Prophet, TBATS• DL: LSTM, Transformer3. **M5 Competition dataset** (Kaggle/Walmart)4. **Evaluation:**• RMSE, MAE, MAPE• Prediction intervals• Forecast combinations5. **Production deployment:**• API com FastAPI• Automated retraining• Monitoring drift**Relatório:** Quando usar cada método? Decision tree prático |

---

### **Sprint Opcional D: Data Engineering & SQL para Data Scientists** (3 semanas)

📍 **Recomendado:** Após Sprint 14 — antes de projetos aplicados

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **freeCodeCamp:** SQL Full Course🎥 **Corey Schafer:** Pandas tutorials📄 **Designing Data-Intensive Applications** (selected chapters) | 📘 **Martin Kleppmann** — *Designing Data-Intensive Applications*📘 **Joe Reis & Matt Housley** — *Fundamentals of Data Engineering*📄 **dbt documentation** — Analytics engineering | **Semana 1 (SQL Mastery):**• JOINs (inner, left, right, full)• Window functions (ROW_NUMBER, LAG, LEAD)• CTEs (Common Table Expressions)• Subqueries vs JOINs• Query optimization• Indexes**Semana 2 (Data Pipelines):**• ETL vs ELT• Apache Airflow basics• Data validation (Great Expectations)• dbt (data build tool)• Data quality checks**Semana 3 (Big Data & Cloud):**• PySpark basics (RDDs, DataFrames)• Parquet, partitioning strategies• Cloud storage (S3, Azure Blob)• Data warehouses (Snowflake, BigQuery)• Lakehouse architecture | **End-to-End Data Pipeline:**1. **SQL Challenge:**• HackerRank SQL (5-star)• LeetCode SQL (50 problemas)• Window functions mastery2. **Build ETL Pipeline:**• Ingest: API → raw storage• Transform: dbt models• Load: DWH (local Postgres)• Orchestrate: Airflow DAGs• Monitor: data quality tests3. **Big Data Processing:**• Dataset >10GB• Process com PySpark• Optimize partitioning• Compare: Pandas vs Spark vs Polars4. **Dashboard:**• Superset/Metabase/Streamlit• Connect to DWH• Business metrics visualization**Relatório:** Arquitetura completa documentada (diagrams.net) |

---

### **Sprint Opcional E: MLOps & Model Deployment** (3 semanas)

📍 **Recomendado:** Após Sprint 14 ou antes de Fase 5 (research)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **MLOps Community:** Talks🎥 **Made With ML:** MLOps course📄 **Google:** MLOps whitepaper | 📘 **Chip Huyen** — *Designing Machine Learning Systems*📄 **ML Test Score** (Google)📄 **Hidden Technical Debt in ML** (Sculley et al.) | **Semana 1 (Model Serving):**• FastAPI for ML models• Docker containerization• Model versioning (MLflow)• A/B testing infrastructure• Shadow deployment**Semana 2 (Monitoring & Observability):**• Data drift detection• Model performance monitoring• Logging & alerting• Feature store (Feast)• Retraining triggers**Semana 3 (CI/CD for ML):**• GitHub Actions for ML• Model testing (unit, integration)• Automated retraining pipeline• Model registry• Rollback strategies | **Production ML System:**1. **Deploy modelo (Sprint anterior) em produção:**• REST API (FastAPI)• Docker + docker-compose• Load testing (Locust)• Latency <100ms (p99)2. **Monitoring Dashboard:**• Prometheus + Grafana• Track: latency, throughput, errors• Data drift alerts (Evidently)• Model performance decay3. **CI/CD Pipeline:**• GitHub Actions workflow• Automated tests (pytest)• Model validation• Automated deployment• Rollback mechanism4. **Documentation:**• API docs (Swagger)• Architecture diagram• Runbook (incident response)• Cost analysis**Relatório:** Post-mortem de um "incident" simulado |

---

## 🎯 **COMO USAR OS SPRINTS OPCIONAIS:**

### **Opção 1: Integrado (Full Data Scientist)**
Faz todos os sprints opcionais nos momentos recomendados:
- **Total:** 70 semanas (main) + 16 semanas (optional) = **86 semanas (~20 meses)**
- **Perfil:** T-shaped (profundo em ML + amplo em DS)

### **Opção 2: Após o Roadmap Principal**
Completa as 70 semanas primeiro, depois escolhe os opcionais:
- **Vantagem:** Foco total em research/teoria primeiro
- **Usa os opcionais** quando precisares para jobs/projetos

### **Opção 3: Cherry-Pick**
Escolhe só os que interessam:
- **Quant Finance?** → Skip Sprint D (Data Engineering)
- **Research only?** → Faz Sprint B (Bayesian/Causal), skip resto
- **Industry job?** → Todos são úteis, prioriza D e E

### **Opção 4: Em Paralelo (Weekends)**
Faz sprints opcionais nos weekends enquanto avanças no roadmap principal:
- **Exemplo:** Segunda-Sexta (Sprint 5: DL), Sábado-Domingo (Sprint A: Kaggle EDA)

---

## �🔬 FASE 4: Estruturas Especializadas (6 semanas)

### **Sprint 13: Grafos & GNNs** (Semanas 33-35)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| *(Revisar Graph Theory basics)* | **Papers:**• GCN (Kipf & Welling)• GraphSAGE | *(Nenhum exercício de GNN no site)* | **GNN Classifier:**1. **Implementar PageRank** (warm-up)2. **Implementar GCN do zero**3. Usar dataset Cora4. Classificação de nós**Relatório LaTeX:** Conexão entre spectral graph theory e GNNs |

---

### **Sprint 14: Model Evaluation Avançada** (Semanas 36-38)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| *(Revisar cross-validation theory)* | **[ESL]:** Cap 7 (Model Assessment)**López de Prado:** Purged k-fold, combinatorial CV | (43) Mean Average Precision ⭐(76) ROC Curve (revisão)(45) AUC (revisão) | **Evaluation Suite:**1. Implementar framework de avaliação rigorosa2. Purged k-fold para time-series3. Testar em 3 datasets4. Análise de multiple testing bias**Relatório LaTeX:** Demonstrar porque naive CV falha em finanças |

---

## 🎯 **FASE 5: Original Research & Publication** (Semanas 39-60)

### **Sprint 15: Paper Reproduction & Ablation** (Semanas 39-42)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **DeepMind** — AlphaZero Explained🎥 **David Silver** — Planning & Learning📄 **Browne et al.** — MCTS Survey📄 **Papers With Code** — How to reproduce🎥 **freeCodeCamp:** [AlphaZero from Scratch](https://www.youtube.com/watch?v=wuSQpLinRB4) (4:07:54) | **[Sutton]:** Cap 8 (Planning)Sec 8.8 (MCTS)**Papers (Leitura Obrigatória):**• Silver et al. — AlphaZero• Schrittwieser et al. — MuZero• Ye et al. — EfficientZero📄 **ICLR Reproducibility Checklist** | *(Revisão de todos RL anteriores)*(58) Monte Carlo Policy Eval(84) Q-Learning(5) Advantage Computation(75) KL Divergence | **Paper Reproduction (4 semanas):Semana 1: Código Base**• Escolher: AlphaZero OU MuZero• Implementar MCTS + Networks• Testar em Connect4/Tic-Tac-Toe**Semana 2: Reprodução**• Treinar até convergência• Comparar com resultados do paper• Documentar diferenças**Semana 3: Ablation Study**• Remover MCTS → só policy• Remover value → só MCTS• Variar hyperparameters• Medir impacto de cada componente**Semana 4: Análise Crítica**• Identificar **limitações** do método• Onde falha? (ex: sparse rewards, stochastic)• O que é sensível a hyperparameters?**Entrega (Relatório LaTeX 15-20 pág):**• Derivações matemáticas completas• Código no GitHub (limpo, comentado)• Gráficos de convergência• Tabela de ablations• **Secção de limitações identificadas** |

---

### **Sprint 16: Literature Review & Research Gap** (Semanas 43-46)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **Lex Fridman Podcasts:**• Demis Hassabis (DeepMind)• Pieter Abbeel (RL)• Marcos López de Prado📄 **How to Read Papers:**• Keshav — "How to Read a Paper"• Critical reading strategies | **Ler 40-60 Papers:Model-Based RL (15 papers):**• MuZero variants• EfficientZero• Sampled MuZero• Dreamer v2/v3• STEVE, Iris**RL for Finance (15 papers):**• Moody & Saffell (2001) — RL Trading• Deng et al. (2016) — Deep RL Trading• Zhang et al. (2020) — Deep RL Portfolio• Liang et al. (2018) — Adversarial Deep RL• Fischer (2018) — RL Stock Trading**Risk-Sensitive RL (10 papers):**• Chow et al. (2015) — Risk-Constrained• Tamar et al. (2015) — PG w/ CVaR• Mihatsch & Neuneier (2002) — Risk-Sensitive• Dabney et al. (2018) — Distributional RL• Bellemare et al. (2017) — C51📘 **López de Prado (Cap relevantes):**• Backtest overfitting• Purged cross-validation• Combinatorial CV• Multiple testing• Bet sizing | (43) Mean Average Precision(76) ROC Curve(45) AUC*(Para avaliar estratégias)* | **Research Proposal (12-15 páginas LaTeX):Semana 1: Survey Papers**• Ler 20 papers core• Tomar notas estruturadas• Identificar trends**Semana 2: Deep Dive**• Ler 20+ papers específicos• Reproduzir 1-2 experimentos chave• Identificar contradições**Semana 3: Gap Analysis**• O que funciona? O que falha?• Identificar **3 gaps possíveis**• Escolher 1 gap principal**Semana 4: Proposal WritingEstrutura obrigatória:1. Introduction (2 pág)**• Contexto: Por que RL para finanças?• Problema: AlphaZero assume X, mas mercados têm Y• Motivação: Impacto económico potencial**2. Related Work (3-4 pág)**• Model-based RL (1 pág)• RL para trading (1 pág)• Risk-sensitive methods (1 pág)• Síntese: O que falta? (1 pág)**3. Research Gap (1 pág) — CRÍTICO**• **Claim:** "MuZero falha em X porque Y"• **Evidence:** Citar 3-5 papers que mostram isto• **Hypothesis:** "Propor Z vai resolver porque W"**4. Proposed Method (3-4 pág)**• Arquitetura modificada (diagrama)• Algoritmo (pseudo-código)• Justificação teórica de cada modificação• Exemplo toy (CartPole estocástico)**5. Evaluation Plan (2 pág)**• Datasets: Quais mercados? (S&P500, Forex, Crypto?)• Baselines: MuZero vanilla, PPO, Model-Free SOTA• Métricas: Sharpe, Sortino, Max Drawdown, Calmar• Ablations: Provar que cada componente importa**6. Expected Contributions (1 pág)**• Científica: Novel algorithm/theory• Prática: Demonstração em dados reais• Código: Open-source reprodutível**Peer Review:**• Postar em r/MachineLearning (Feedback Friday)• Partilhar com 3+ pessoas (Discord, Twitter)• Iterar baseado em comentários |

---

### **Sprint 17: Core Implementation — Base MuZero** (Semanas 47-52)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **Hands-On Tutorials:**• AlphaZero implementation walkthrough• MuZero code review (YouTube)📄 **Code Study:**• muzero-general (GitHub)• EfficientZero codebase• RLlib MuZero implementation | **Revisão Teórica:**• [Sutton] Cap 8 (Planning)• [Boyd] Cap 5 (Duality) — para MCTS**Implementation Details:**• MuZero Appendix (hyperparameters)• AlphaZero Supplementary Materials• EfficientZero tricks | *(Todos anteriores)*Especialmente:(9) RNN Forward(68) RNN Backward(17) GRU Cell(94) CNN Layer(16) Batch Norm(10) Dropout(98) Positional Encoding(69) Causal Masking | **MuZero Base System (6 semanas):Semana 1-2: Representation Network**• Input: raw observations (OHLCV + features)• Output: hidden state s₀• Arquitetura: ResNet OU Transformer encoder• Normalização: Layer Norm + Batch Norm• Testar: Consegue reconstruir input?**Semana 3: Dynamics Model**• Input: hidden state sₜ + action aₜ• Output: next state sₜ₊₁ + reward rₜ• Arquitetura: ResNet blocks• Treinar em transições conhecidas• Testar: Predição de reward/state accuracy**Semana 4: Prediction Network**• Input: hidden state sₜ• Output: policy πθ(a|sₜ), value vθ(sₜ)• Duas heads separadas• Policy: Softmax sobre acções• Value: Scalar (support transform se distributional)**Semana 5: MCTS Engine**• UCB1 tree policy: aₜ = argmax(Q + c·P·√(N_parent)/N)• Virtual loss (para paralelização)• Dirichlet noise na root (exploration)• Hash maps (state → node mapping)• Backup: Update Q values após simulation**Semana 6: Training Loop**• Self-play: Gerar trajectories com MCTS• Replay buffer: Prioritized (TD-error)• Loss = Σ[policy_loss + value_loss + reward_loss]• Optimizer: Adam com cosine LR schedule• Target network (slow update)**Testes em Toy Environments:**• CartPole-v1• LunarLander-v2• Connect4 (determinístico)**Convergência Goal:**• Bater random policy em 100k steps• Atingir performance perto de PPO**Entrega (Código GitHub):**• Modular (separate files por network)• Testes unitários (pytest)• Config files (hydra/yaml)• README com setup instructions• Docker container (reprodutibilidade)• Logs (TensorBoard/WandB)• Checkpoints salvos |

---

### **Sprint 18: Novel Contribution — Your Innovation** (Semanas 53-58)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| *(Depende da tua contribuição específica)***Exemplo se Risk-Sensitive:**🎥 Distributional RL talks📄 Bellemare et al. — C51📄 Dabney et al. — QR-DQN, IQN**Exemplo se Non-Stationary:**🎥 Meta-Learning talks📄 Finn et al. — MAML📄 Nagabandi et al. — Online Meta-Learning | **Teoria Específica:Se Risk-Sensitive MuZero:**• Chow et al. — Risk-Constrained RL• Tamar et al. — Policy Gradients + CVaR• Portfolio theory (Markowitz)**Se Non-Stationary:**• Change-point detection literature• Online learning theory• Contextual bandits**Se Sample-Efficient:**• Offline RL (CQL, BCQ)• Model-based offline (MOPO, MOReL)• Data augmentation in RL | *(Implementações anteriores como base)* | **Implementação da Tua Contribuição (6 semanas):Semana 1: Architecture Modification**• Modificar networks para tua contribuição• Ex (Risk): Value head → distribuição (não scalar)• Ex (Non-Stat): Adicionar context encoder• Ex (Sample-Eff): Adicionar uncertainty quantification**Semana 2: Algorithm Changes**• Modificar MCTS se necessário• Ex (Risk): UCB com risk penalty• Ex (Non-Stat): Adapt tree policy online• Ex (Sample-Eff): Conservative value estimates**Semana 3: Loss Function**• Modificar training objective• Ex (Risk): Adicionar CVaR term• Ex (Non-Stat): Meta-learning outer loop• Ex (Sample-Eff): Pessimistic value backup**Semana 4-5: Debug & Tune**• Fazer funcionar em toy environment primeiro• **Sanity checks:**  - Overfit num episódio único  - Gradientes não explodem/desaparecem  - Predictions fazem sentido qualitativo• Hyperparameter search (Optuna/Ray Tune)**Semana 6: Toy Experiments**• Testar em 2-3 ambientes controlados• Comparar com MuZero vanilla• **Provar que tua modificação ajuda aquiEntrega (Checkpoint Técnico):**• Código da modificação (clean, testado)• Resultados preliminares (plots)• Análise: Quando funciona? Quando falha?• Next steps claros para finance adaptation |

---

### **Sprint 19: Finance Environment & Adaptation** (Semanas 59-62)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 🎥 **Finance-Specific:**• Market microstructure basics• Order book dynamics📘 **López de Prado (revisão):**• Labeling (triple barrier)• Fractional differentiation• Meta-labeling | **Papers de Trading Environment:**• Liang et al. — Adversarial Deep RL Trading• Zhang et al. — Deep RL Portfolio Management**Market Modeling:**• Kyle model (price impact)• Almgren-Chriss (optimal execution)• Transaction costs modeling | *(Dados & métricas)*(46) Min-Max Norm(97) z-Score(18) Batch Shuffling(87) Stratified Split(23) K-Fold (purged version) | **Trading Environment (4 semanas):Semana 1: Data Pipeline**• Escolher mercados: S&P500 OU Forex OU Crypto• Features engineering:  - OHLCV  - Technical indicators (RSI, MACD, Bollinger)  - Order flow features (se disponível)  - Sentiment (opcional)• Normalização: Rolling z-score• Train/Val/Test split: **Purged K-FoldSemana 2: Environment Definition**• State space: O que o agente observa?• Action space: Long/Short/Hold OU continuous position sizing• Reward: **Sharpe ratio** OU **risk-adjusted return**• Constraints:  - Transaction costs (realistic: 5-10 bps)  - Slippage (price impact model)  - Position limits (max leverage)  - No lookahead bias**Semana 3: Realistic Simulation**• Implementar order execution simulator• Price impact: √(volume) scaling• Market impact persistence (temporary + permanent)• Commission structure• **Teste:** Comparar com backtesting library (backtrader)**Semana 4: Adaptation Testing**• Treinar teu agente modificado• Comparar com:  - Buy & Hold  - Moving Average Crossover  - MuZero vanilla  - PPO• **Initial results** (não precisa ser SOTA ainda)**Entrega (Finance Checkpoint):**• Environment code (gym-compatible)• Data pipeline reprodutível• Baseline comparisons• Relatório: Challenges específicos encontrados |

---

### **Sprint 20: Rigorous Experiments & Ablations** (Semanas 63-66)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 📄 **Experimental Design:**• Henderson et al. — "Deep RL that Matters"• Reproducibility in ML research📊 **Statistics:**• Bootstrap confidence intervals• Multiple hypothesis testing corrections | **[ESL]** Cap 7 (revisão)**López de Prado:**• Deflated Sharpe ratio• Probability of backtest overfitting• Combinatorial purged CV | (44) Bootstrap CI(88) t-Test(41) Chi-Square(45) AUC(76) ROC | **Experimental Campaign (4 semanas):Semana 1: Main Results**• Treinar 5+ seeds• Testar em múltiplos períodos (2015-2020, 2020-2023)• **Métricas principais:**  - Sharpe ratio (annualized)  - Sortino ratio  - Max drawdown  - Calmar ratio  - Win rate  - Profit factor• Comparar com 3+ baselines• **Statistical significance:** Bootstrap CI**Semana 2: Ablation Study**• Remover cada componente da tua contribuição• Medir impacto isolado• **Provar que CADA parte importa**• Exemplo (Risk-Sensitive):  - Sem CVaR term → performance?  - Sem distributional value → performance?  - Sem risk penalty in MCTS → performance?**Semana 3: Robustness Checks**• Variar hyperparameters (±20%)• Testar em mercados diferentes (se S&P, testar Nasdaq)• Stress test: 2008 crash, COVID crash• Out-of-sample: 2024 data (never seen)• **Transaction cost sensitivity:** 1bp vs 10bp**Semana 4: Failure Analysis**• Quando o método falha?• Visualizar episódios de perdas grandes• Análise qualitativa: O que o agente aprendeu?• **Limitações honestasEntrega (Results Package):**• Tabelas de resultados (LaTeX format)• Plots de curvas de equity• Ablation tables• Statistical tests (com p-values)• Failure case analysis• Raw data (CSV) para reviewers |

---

### **Sprint 21: Paper Writing & Submission** (Semanas 67-70)

| **Vídeos (Intuição)** | **Teoria (Livros)** | **Exercícios Práticos (Site)** | **Entrega (Checkpoint)** |
| --- | --- | --- | --- |
| 📄 **Writing Resources:**• "How to Write a Great Research Paper" (Simon Peyton Jones)• NeurIPS/ICML author guidelines🎨 **Visualizations:**• Tufte — Visual Display of Quantitative Info• Matplotlib best practices | **Style Guides:**• Conference-specific formatting• LaTeX templates (NeurIPS, ICML, ICLR)**Example Papers:**• Ler 10 accepted papers da conferência target• Estudar estrutura, flow, figuras | *(Nenhum novo)* | **Paper Completo (4 semanas):Semana 1: Draft WritingStructure (8 páginas ICML format):1. Abstract (150 palavras)**• Problema + Gap + Contribuição + Resultado**2. Introduction (1 pág)**• Contexto: RL para finanças• Problema: MuZero falha em X• Contribuição: Propomos Y que resolve Z• Resultados: Melhora W em N%**3. Related Work (1 pág)**• Model-based RL (0.3 pág)• RL para trading (0.3 pág)• Risk-sensitive/Non-stat/Sample-eff (0.3 pág)• Posicionamento claro vs trabalhos anteriores**4. Background (0.5 pág)**• MuZero recap (muito breve)• Trading environment formalization**5. Method (2 pág)**• Tua modificação (detalhada)• Algoritmo (pseudo-código)• Justificação teórica• Diagrama de arquitetura (figure)**6. Experiments (2 pág)**• Setup: Datasets, baselines, métricas• Main results (table + plot)• Ablations (table)• Analysis: Porque funciona?**7. Discussion (0.5 pág)**• Limitações• Future work• Broader impact**8. Conclusion (0.3 pág)Appendix (ilimitado):**• Hyperparameters completos• Derivações matemáticas• Ablations adicionais• Plots extra**Semana 2: Figures & Tables**• Criar 4-6 figuras high-quality• Refinar tabelas (LaTeX booktabs)• Captions detalhados**Semana 3: Iteration**• Pedir feedback (r/MachineLearning, Twitter, Discord)• Iterar baseado em comentários• Clarificar partes confusas• Proofread (Grammarly + manual)**Semana 4: Submission**• Escolher conferência:  - **Tier 1:** NeurIPS, ICML, ICLR  - **Tier 2:** AISTATS, CoRL, ALT  - **Workshops:** NeurIPS workshops, ICML workshops• Preparar supplementary materials• Code release (GitHub public)• Submeter via OpenReview/CMT**Entrega FINAL:**• Paper PDF (camera-ready)• Código open-source (GitHub)• Data (se possível)• Demo video (opcional mas impressive)• Blog post (divulgação) |

---

## 📊 **RESUMO ESTATÍSTICO COMPLETO (Roadmap 70 semanas = 16 meses)**

| **Fase** | **Semanas** | **Sprints** | **Foco Principal** | **Entregável Chave** |
| --- | --- | --- | --- | --- |
| **Fase 1** | 1-13 | 1-4 | Fundamentos Matemáticos | Optimizer Showdown, Ridge/Lasso, PCA |
| **Fase 2** | 14-22 | 5-8 | Deep Learning Core | MLP, VAE, Transformer, CNN |
| **Fase 3** | 23-32 | 9-12 | RL Avançado | Decision Tree, REINFORCE, PPO, MARL |
| **Fase 4** | 33-38 | 13-14 | Estruturas Especializadas | GNN, Evaluation Suite |
| **Fase 5** | 39-42 | 15 | Paper Reproduction | AlphaZero/MuZero reproduction + ablations |
| **Fase 6** | 43-70 | 16-21 | **Original Research** | **Paper publicável em top conference** |
| **TOTAL** | **70** | **21** | **First Principles → Novel Contribution** | **Published Paper** |

---

## 🎯 **SPRINT 16-21 BREAKDOWN (Fase 6 Detalhada)**

| **Sprint** | **Semanas** | **Objetivo** | **Output** |
| --- | --- | --- | --- |
| **16** | 43-46 | Literature Review (40-60 papers) | Research Proposal (15 pág) |
| **17** | 47-52 | Implementar MuZero base funcional | Código base (GitHub) |
| **18** | 53-58 | Adicionar tua contribuição novel | Modified MuZero working |
| **19** | 59-62 | Adaptar para trading real | Finance environment + baselines |
| **20** | 63-66 | Experiments rigorosos + ablations | Results package completo |
| **21** | 67-70 | Escrever paper + submeter | Paper submitted to conference |

---

## 🔥 **EXEMPLOS CONCRETOS DE CONTRIBUIÇÕES POSSÍVEIS**

### **Opção A: Risk-Sensitive MuZero (RSMuZero)**

**Paper Title:** *"Risk-Aware Model-Based Reinforcement Learning for Financial Portfolio Management"*

**Gap:** MuZero maximiza expected return. Trading real requer risk-adjusted returns (Sharpe).

**Contribuição:**

1. Value head output → **distribuição** (quantiles, não scalar)
2. MCTS usa **CVaR** (Conditional Value at Risk) para action selection
3. Training objective inclui **risk penalty**: L = L_policy + L_value + λ·CVaR_loss

**Claim:** RSMuZero supera MuZero vanilla em mercados com fat tails (crypto, emerging markets).

**Experiments:**

- Datasets: Bitcoin, S&P500, Emerging Markets ETF
- Baselines: MuZero, PPO, SAC, Buy&Hold
- Métricas: Sharpe, Sortino, Max Drawdown
- Ablations: Sem CVaR, sem distributional value, sem risk penalty

---

### **Opção B: Adaptive MuZero (AdaMuZero)**

**Paper Title:** *"Non-Stationary World Models for Adaptive Trading Agents"*

**Gap:** MuZero assume dynamics estático. Mercados mudam (bull → bear → crash).

**Contribuição:**

1. **Change-point detection** module (CUSUM/Bayesian online CP)
2. **Multiple dynamics models** (bull, bear, high-vol regimes)
3. **Online adaptation:** Re-treina dynamics quando detecta regime shift
4. **Meta-learned initialization:** Usa MAML para fast adaptation

**Claim:** AdaMuZero adapta melhor a crashes e regime changes.

**Experiments:**

- Datasets: S&P500 (2000-2024, inclui dotcom, 2008, COVID)
- Baselines: MuZero, PPO, Online Learning baselines
- Métricas: Performance em períodos de transition
- Ablations: Sem change-point, sem multiple models, sem meta-learning

---

### **Opção C: Sample-Efficient MuZero (SEMuZero)**

**Paper Title:** *"Offline Model-Based RL with Pessimistic Value Estimates for Financial Trading"*

**Gap:** MuZero precisa milhões de samples. Dados financeiros são limitados.

**Contribuição:**

1. **Offline training only** (sem simulator, só dados históricos)
2. **Conservative value estimates** (inspirado em CQL)
3. **Uncertainty quantification** em dynamics model (ensemble + epistemic uncertainty)
4. **Pessimistic MCTS:** Penaliza acções com alta uncertainty

**Claim:** SEMuZero atinge 80% da performance com 10x menos dados.

**Experiments:**

- Datasets: Limitar a 1 ano de dados (vs 10 anos baseline)
- Baselines: MuZero (full data), Offline RL methods (CQL, BCQ)
- Métricas: Data efficiency curves
- Ablations: Sem conservatism, sem uncertainty, sem pessimism

---

## ✅ **CHECKLIST PRÉ-SUBMISSION**

Antes de submeter paper, verificar:

- [ ]  **Novelty clara:** Contribuição não é incremental
- [ ]  **≥3 baselines:** Comparação justa
- [ ]  **Ablations completas:** Cada componente justificado
- [ ]  **Statistical significance:** Bootstrap CIs, p-values
- [ ]  **Código público:** GitHub com README detalhado
- [ ]  **Reproducibilidade:** Docker + requirements.txt + seeds
- [ ]  **Figures high-quality:** Vector graphics (PDF), não PNG
- [ ]  **Writing:** Proofread por ≥2 pessoas
- [ ]  **Honest limitations:** Secção de "quando falha"
- [ ]  **Ethical considerations:** Broader impact statement

---