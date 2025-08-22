
# Capítulo 01 – Estudo Bibliométrico: Enzimas Microbianas na Indústria Bioquímica e suas Tendências

Este repositório contém o material completo para a análise bibliométrica realizada no âmbito do capítulo de livro sobre aplicações de enzimas microbianas na indústria bioquímica.

## Estrutura do Projeto

```
📁 Arquivos/                 → Bases de dados (.bib e .csv), versões tratadas e unificadas
📁 Scripts/                  → Scripts R utilizados no processamento e análise bibliométrica
📁 Figuras/                  → Saídas gráficas geradas pelo Biblioshiny
📁 data/processed/           → Bases intermediárias em formato .xlsx
📄 README.md                 → Este arquivo
```
## Ferramentas Utilizadas

- **R** e **RStudio**
- **Pacotes**: `bibliometrix`, `biblioshiny`, `writexl`, `readxl`, `dplyr`, `stringr`
- **Interface gráfica**: `Biblioshiny` (distribuída com o pacote bibliometrix)
- **Controle de versão**: `Git + GitHub`

## Objetivo

Realizar um mapeamento científico sobre o uso de enzimas microbianas aplicadas à indústria bioquímica, destacando tendências, autores, fontes e países mais relevantes com base nas bases de dados:

- PubMed
- Web of Science (WoS)
- Scopus

## Etapas Realizadas

1. Extração dos dados das bases científicas em formato `.bib` e `.csv`
2. Conversão dos arquivos para `data.frame` utilizando `convert2df()` do `bibliometrix`
3. Pré-processamento individual das bases (padronização, remoção de duplicatas internas, ajuste de campos)
4. Unificação das bases
5. Sanitização para exportação compatível com `writexl`
6. Análise exploratória por meio do Biblioshiny
7. Geração de gráficos e tabelas para inclusão no capítulo

## Exportação da Coleção

A coleção de dados final utilizada no Biblioshiny está salva em:

```
Arquivos/Bibliometrix-Export-File-2025-08-21.RData
```

Essa coleção é compatível diretamente com a função `biblioshiny()` para carregamento.

## Licença

Este repositório está sob a licença MIT. Consulte o arquivo LICENSE (quando incluído).

---

**Autor**: David Maciel  
**Data de atualização**: Agosto de 2025
