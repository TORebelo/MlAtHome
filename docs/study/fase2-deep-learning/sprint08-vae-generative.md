# Sprint 8 — Modelos Generativos (semanas 15-16)

**Pergunta nuclear:** *"Como é que um modelo aprende a gerar dados (imagens, text, etc.)? VAE, GAN, Diffusion."*

### Sessão 1 — Autoencoder simples

Build:        AE para MNIST. Visualizar reconstrução vs original. Visualizar latent space 2D.
Output:       01_autoencoder.py

### Sessão 2 — VAE (PyTorch, NÃO NumPy)

Reference:    Kingma & Welling (2013).
Build:        VAE com reparameterization trick. Treinar MNIST. Generate samples.
Output:       02_vae.py

### Sessão 3 — VAE latent space exploration

Build:        Interpolar 2 pontos no latent space. Mostrar smooth transitions.
Output:       03_vae_latent.py

### Sessão 4 — GAN (PyTorch)

Reference:    Goodfellow et al. (2014).
Build:        DCGAN simples em MNIST. Mostrar mode collapse / training instability.
Output:       04_dcgan.py

### Sessão 5 — WGAN-GP

Reference:    Gulrajani et al. (2017).
Build:        Improvement sobre DCGAN. Mostrar treino mais estável.
Output:       05_wgan_gp.py

### Sessão 6 — Diffusion model (mini)

Build:        DDPM para MNIST (32-step), seguindo a annotated implementation labmlai.
Walkthrough:  ../../../Fase2_DeepLearning/Sprint08_Generative/external/labmlai-annotated-dl/diffusion/ddpm/
Reference:    Ho et al. (2020) — DDPM paper. Library alternativa: `diffusers`.
Source:       https://github.com/labmlai/annotated_deep_learning_paper_implementations
Output:       06_ddpm.py ou 06_ddpm.ipynb.

### Sessão 7 — Stable Diffusion architecture deep-dive

Build:        Compreender a arquitetura SD (latent diffusion + autoencoder + CLIP embedder + UNet). Correr text-to-image com `diffusers` lib. Comparar com a annotated implementation.
Walkthrough:  ../../../Fase2_DeepLearning/Sprint08_Generative/external/labmlai-annotated-dl/diffusion/stable_diffusion/
Reference:    Rombach et al. (2022) — Latent Diffusion Models.
Source:       https://github.com/labmlai/annotated_deep_learning_paper_implementations
Output:       07_stable_diffusion.py

### Sessão 8 — Avaliar generative models

Reference:    Heusel et al. (2017).
Build:        Calcular FID e Inception Score para os teus models.
Output:       08_eval_generative.py

**Reference:** Foster — *Generative Deep Learning*. Karpathy: NN tutorials.

**Entrega Sprint 8 + Fase 2:**
- `notas/sprint08-resumo.md`.
- `notas/fase2-retrospectiva.md` — comparar com Fase 1 em densidade e enjoyment.
