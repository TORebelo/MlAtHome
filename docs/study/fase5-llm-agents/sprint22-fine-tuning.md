# Sprint 22 — Fine-tuning (semana 37)

**Pergunta nuclear:** *"Quando RAG não chega — porque o domínio precisa de um modelo que **fala** o vocabulário/estilo nativo. LoRA, QLoRA, DPO: como fine-tunar com hardware modesto e avaliar honestamente."*

> Sprint walkthrough-driven. Reusa snapshot **Hands-On LLMs** vendored em Sprint 16 (`Sprint16_LLMInternals/external/handsonllm-hands-on-llms/`). Cobre **caps 11 e 12** (BERT fine-tuning + Generative model fine-tuning com LoRA/QLoRA/DPO). Pré-requisito: Sprint 16 (LLM internals) + Sprint 7 sessão 6 (LoRA preview).

### Sessão 1 — Fine-tuning encoder: BERT (Chapter 11)

Build:        `Chapter 11 - Fine-Tuning BERT.ipynb`. Fine-tunar `bert-base-uncased` numa task downstream (e.g. classification financial sentiment ou NER). Comparar full fine-tuning vs feature extraction (frozen encoder + classifier head). Métricas + curva de learning.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint16_LLMInternals/external/handsonllm-hands-on-llms/chapter11/
Reference:    Hands-On LLMs cap 11. Devlin et al. (2018) — BERT paper. HuggingFace `Trainer` quickstart.
Source:       https://github.com/HandsOnLLM/Hands-On-Large-Language-Models
Output:       Fase5_LLMAgents/Sprint22_FineTuning/notebooks/01_bert_finetune.ipynb

### Sessão 2 — Fine-tuning generative: SFT + LoRA (Chapter 12, parte 1)

Build:        `Chapter 12 - Fine-tuning Generation Models.ipynb` (primeira metade — SFT + LoRA). SFT (supervised fine-tuning) com instruction dataset. LoRA: low-rank adapters em vez de full weights. Verificar % de parâmetros treinados (<<1% do total) e comparar accuracy.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint16_LLMInternals/external/handsonllm-hands-on-llms/chapter12/
Reference:    Hands-On LLMs cap 12. Hu et al. (2021) — *LoRA: Low-Rank Adaptation of Large Language Models*. Mangrulkar et al. (2022) — `peft` library.
Source:       https://github.com/HandsOnLLM/Hands-On-Large-Language-Models
Output:       Fase5_LLMAgents/Sprint22_FineTuning/notebooks/02_sft_lora.ipynb

### Sessão 3 — QLoRA: 4-bit quantization para hardware modesto

Build:        Cap 12 (parte 2 — QLoRA). 4-bit quantization (NF4) + LoRA adapters. Permite fine-tunar 7B params em 1 GPU consumer (16-24 GB). Correr com `bitsandbytes` + `peft` num modelo Llama/Mistral pequeno.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint16_LLMInternals/external/handsonllm-hands-on-llms/chapter12/
Reference:    Dettmers et al. (2023) — *QLoRA: Efficient Finetuning of Quantized LLMs*. `bitsandbytes` docs.
Source:       https://github.com/HandsOnLLM/Hands-On-Large-Language-Models
Output:       Fase5_LLMAgents/Sprint22_FineTuning/notebooks/03_qlora.ipynb

### Sessão 4 — Preference tuning: DPO + estado da arte alignment

Build:        Cap 12 (parte 3 — DPO). DPO (Direct Preference Optimization): substitui RLHF com PPO complicado por uma loss closed-form sobre preference pairs. Treinar em dataset pequeno de preferences (e.g. UltraFeedback subset). Comparar com SFT-only baseline.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint16_LLMInternals/external/handsonllm-hands-on-llms/chapter12/
Reference:    Rafailov et al. (2023) — *Direct Preference Optimization*. Christiano et al. (2017) — RLHF foundational. Hugging Face `trl` library docs.
Source:       https://github.com/HandsOnLLM/Hands-On-Large-Language-Models
Output:       Fase5_LLMAgents/Sprint22_FineTuning/notebooks/04_dpo.ipynb

### Sessão 5 — Evaluation pós-fine-tuning + decisão "RAG vs FT"

Build:        Avaliar o teu modelo fine-tuned em (a) holdout do task domain, (b) MMLU mini ou similar (general capability — para detectar catastrophic forgetting), (c) qualitative review de 20 outputs. Decidir: RAG ou FT ou ambos? Escrever 1 página decision-document para o teu projeto futuro.
Reference:    Cross-link com Sprint 13 (eval) + Sprint 21 (RAG eval). Ouyang et al. (2022) — InstructGPT (alignment + capability trade-offs). Anthropic — *Constitutional AI* (referência paralela).
Output:       Fase5_LLMAgents/Sprint22_FineTuning/notebooks/05_eval_decision.ipynb + nota `notas/sprint22-resumo.md`.

**Reference:** Hu et al. (2021) — LoRA. Dettmers et al. (2023) — QLoRA. Rafailov et al. (2023) — DPO. Hugging Face `peft` + `trl` libraries. Hands-On LLMs caps 11-12.

**Entrega:** `notas/sprint22-resumo.md` — pergunta-teste: "Em 3 minutos: dadas restrições reais (corpus de 10k examples, 1 GPU 24 GB, deadline 1 semana), qual approach escolheres entre RAG, LoRA, QLoRA, DPO? Como decidirias se RAG seria suficiente sem fine-tunar nada?"
