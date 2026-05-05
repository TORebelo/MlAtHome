# Sprint 12 — Graphs & GNNs (semana 23)

**Pergunta nuclear:** *"Quando os dados são relacionais (social networks, molecules, supply chains), GNNs vencem MLPs/CNNs. Como?"*

### Sessão 1 — PageRank from-scratch

Reference:    Page & Brin (1998)
Build:        PageRank em pequeno graph dirigido.
Output:       01_pagerank.py

### Sessão 2 — Spectral graph theory intuição

Reference:    Chung — *Spectral Graph Theory*
Build:        Laplacian de um graph, eigenvectors → community detection.
Output:       02_spectral.py

### Sessão 3 — GCN com PyTorch Geometric

Reference:    Kipf & Welling (2017). Library: `torch_geometric`.
Build:        GCN para node classification em Cora dataset.
Output:       03_gcn_cora.py

### Sessão 4 — GraphSAGE para large graphs

Reference:    Hamilton et al. (2017)
Build:        aplicar a OGB dataset.
Output:       04_graphsage.py

### Sessão 5 — GAT (attention em graphs)

Reference:    Veličković et al. (2018)
Build:        comparar com GCN no mesmo dataset.
Output:       05_gat.py

### Sessão 6 — Aplicação financeira: stock graph

Build:        construir graph de correlações entre stocks S&P, aplicar GCN para predição de moves.
Output:       06_stock_graph.py

**Reference:** Hamilton — *Graph Representation Learning* (open access). PyTorch Geometric tutorials.

**Entrega:** `notas/sprint12-resumo.md`.
