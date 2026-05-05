# Sprint 23 — MCP / A2A / Microsoft Agent Framework (semana 38)

**Pergunta nuclear:** *"Como é que agents falam com tools (MCP) e entre si (A2A) de forma standardizada — e como é que se orquestra workflow patterns (sequential, concurrent, conditional, handoff) num framework production-grade?"*

> Sprint walkthrough-driven. **microsoft/ai-agents-for-beginners** (MIT) está vendored em `Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/` — só **lessons 11 (Agentic Protocols) e 14 (Microsoft Agent Framework)**, não o curriculum completo (resto está fora de escopo nesta fase). Sprint final do roadmap.

### Sessão 1 — MCP: Model Context Protocol

Build:        `11-mcp-agent-framework.ipynb`. MCP standard (Anthropic, 2024) para conectar LLMs a tools/data sources de forma uniforme. Construir um MCP server simples + cliente. Comparar com tool-calling ad-hoc dos Sprints 19-20.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/11-agentic-protocols/code_samples/11-mcp-agent-framework.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/11-agentic-protocols/README.md
Reference:    Anthropic — *Model Context Protocol* spec (modelcontextprotocol.io). MCP reference servers (github.com/modelcontextprotocol/servers).
Source:       https://github.com/microsoft/ai-agents-for-beginners
Output:       Fase5_LLMAgents/Sprint23_MCP_A2A/notebooks/01_mcp.ipynb

### Sessão 2 — A2A: Agent-to-Agent Protocol

Build:        `11-a2a-agent-framework.ipynb`. A2A (Google, 2024) protocol para comunicação entre agentes heterogéneos (e.g. agent LangGraph chamar um agent CrewAI). Discovery, capability negotiation, session management.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/11-agentic-protocols/code_samples/11-a2a-agent-framework.ipynb
Reference:    Google A2A spec (a2aproject.github.io). NLWeb (Microsoft, 2024) — alternative discovery protocol.
Source:       https://github.com/microsoft/ai-agents-for-beginners
Output:       Fase5_LLMAgents/Sprint23_MCP_A2A/notebooks/02_a2a.ipynb

### Sessão 3 — MCP server + cliente reais (GitHub MCP)

Build:        Estudar implementações vendored: `mcp-agents/` e `github-mcp/` (cliente MCP real para GitHub API). Adaptar a um data source teu (e.g. file system local, ou API financeira mock).
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/11-agentic-protocols/code_samples/mcp-agents/
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/11-agentic-protocols/code_samples/github-mcp/
Reference:    MCP Python SDK docs.
Source:       https://github.com/microsoft/ai-agents-for-beginners
Output:       Fase5_LLMAgents/Sprint23_MCP_A2A/notebooks/03_mcp_real.ipynb

### Sessão 4 — Microsoft Agent Framework: workflow patterns (sequential + concurrent)

Build:        `14-sequential.ipynb` + `14-concurrent.ipynb`. Sequential: passos ordenados com state passing. Concurrent: fan-out/fan-in para tasks paralelizáveis. Comparar com supervisor+workers do Sprint 20 sessão 1.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/14-microsoft-agent-framework/code-samples/14-sequential.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/14-microsoft-agent-framework/code-samples/14-concurrent.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/14-microsoft-agent-framework/README.md
Reference:    Microsoft Agent Framework docs. Semantic Kernel docs (precursor).
Source:       https://github.com/microsoft/ai-agents-for-beginners
Output:       Fase5_LLMAgents/Sprint23_MCP_A2A/notebooks/04_maf_seq_concurrent.ipynb

### Sessão 5 — MAF: conditional + handoff + human-in-the-loop

Build:        `14-conditional-workflow.ipynb` + `14-handoff.ipynb` + `14-human-loop.ipynb`. Conditional routing baseado em state. Handoff: agent A delega completamente para agent B (não fan-out). HITL: pause workflow para input human, retomar com state restored.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/14-microsoft-agent-framework/code-samples/14-conditional-workflow.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/14-microsoft-agent-framework/code-samples/14-handoff.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/14-microsoft-agent-framework/code-samples/14-human-loop.ipynb
Reference:    LangGraph human-in-the-loop tutorial (paralelo conceitual).
Source:       https://github.com/microsoft/ai-agents-for-beginners
Output:       Fase5_LLMAgents/Sprint23_MCP_A2A/notebooks/05_maf_advanced.ipynb

### Sessão 6 — MAF: middleware + integration project (hotel booking)

Build:        `14-middleware.ipynb` + `hotel_booking_workflow_sample.py`. Middleware patterns: logging, auth, rate limiting, observability cross-cutting. Adaptar o hotel_booking sample a um domain teu (e.g. earnings call processing pipeline) integrando MCP tools da Sessão 3.
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/14-microsoft-agent-framework/code-samples/14-middleware.ipynb
Walkthrough:  ../../../Fase5_LLMAgents/Sprint23_MCP_A2A/external/microsoft-ai-agents-for-beginners/14-microsoft-agent-framework/code-samples/hotel_booking_workflow_sample.py
Reference:    OpenTelemetry para agent observability. Microsoft Agent Framework production guide.
Source:       https://github.com/microsoft/ai-agents-for-beginners
Output:       Fase5_LLMAgents/Sprint23_MCP_A2A/notebooks/06_maf_integration.ipynb + nota `notas/sprint23-resumo.md` + `notas/fase5-retrospectiva.md`.

**Reference:** Anthropic — MCP spec. Google — A2A spec. Microsoft — Agent Framework docs. Semantic Kernel (precursor).

**Entrega Sprint 23 + Fase 5:**
- `notas/sprint23-resumo.md` — pergunta-teste: "Em 3 minutos: MCP vs A2A — em que camada vivem? Quando precisas de ambos? E quando MAF (ou LangGraph) torna o handoff mais simples que orquestração ad-hoc?"
- `notas/fase5-retrospectiva.md` — síntese 38 semanas: Fase 1 (math) → Fase 2 (DL) → Fase 3 (RL) → Fase 4 (MLOps) → Fase 5 (LLM/Agents). O que mudou na tua mental model? Onde é que o currículo tropeçou? Próximo passo (PhD prep, job hunt, OS contributions)?
