# Sprint 8 — Modelos Generativos (semanas 15-16)

**Pergunta nuclear:** *"Como é que um modelo aprende a gerar dados (imagens, text, etc.)? VAE, GAN, Diffusion."*

1. **Autoencoder simples.** Build: AE para MNIST. Visualizar reconstrução vs original. Visualizar latent space 2D. Output: `01_autoencoder.py`.
2. **VAE (PyTorch, NÃO NumPy).** Build: VAE com reparameterization trick. Treinar MNIST. Generate samples. Output: `02_vae.py`. Reference: Kingma & Welling (2013).
3. **VAE latent space exploration.** Build: interpolar 2 pontos no latent space. Mostrar smooth transitions. Output: `03_vae_latent.py`.
4. **GAN (PyTorch).** Build: DCGAN simples em MNIST. Mostrar mode collapse / training instability. Output: `04_dcgan.py`. Reference: Goodfellow et al. (2014).
5. **WGAN-GP.** Build: improvement sobre DCGAN. Mostrar treino mais estável. Output: `05_wgan_gp.py`. Reference: Gulrajani et al. (2017).
6. **Diffusion model (mini).** Build: DDPM para MNIST (32-step). Reference: Ho et al. (2020). Library: `diffusers` para versão pré-feita também. Output: `06_ddpm.py`.
7. **Stable Diffusion API usage.** Build: usar `diffusers` para gerar imagens com prompt. Não training — usage prático. Output: `07_stable_diffusion_demo.py`.
8. **Avaliar generative models.** Build: calcular FID e Inception Score para os teus models. Output: `08_eval_generative.py`. Reference: Heusel et al. (2017).

**Reference:** Foster — *Generative Deep Learning*. Karpathy: NN tutorials.

**Entrega Sprint 8 + Fase 2:**
- `notas/sprint08-resumo.md`.
- `notas/fase2-retrospectiva.md` — comparar com Fase 1 em densidade e enjoyment.
