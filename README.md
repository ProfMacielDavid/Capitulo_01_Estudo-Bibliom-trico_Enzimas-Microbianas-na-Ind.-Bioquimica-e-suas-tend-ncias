
# Capitulo_01_Estudo-Bibliométrico_Enzimas Microbianas na Ind. Bioquimica e suas tendências

<!-- badges: start -->
<!-- badges: end -->

The goal of Capitulo_01_Estudo-Bibliométrico_Enzimas Microbianas na Ind. Bioquimica e suas tendências is to ...

library(bibliometrix)
biblioshiny()

# Ativar ambiente renv (caso necessário)
renv::activate()

# Verificar o status do ambiente
renv::status()

# Carregar bibliometrix
library(bibliometrix)

# Abrir a interface gráfica
biblioshiny()

-----------------------------------------------------------------------------
# Ativa o ambiente renv
renv::activate()

# Carrega os pacotes
library(bibliometrix)
library(readr)
library(dplyr)
install.packages("bibliometrix")
library(bibliometrix)

renv::install("massimoaria/bibliometrix")

?convert2df

--------------------------------------------------------------------------------

# Definir caminho base do projeto
ROOT <- "D:/PROJETOS_2025/ARTIGOS_2025/Capitulo_01_Estudo-Bibliométrico_Enzimas Microbianas na Ind. Bioquimica e suas tendências"

# Caminhos dos arquivos
file_pubmed <- file.path(ROOT, "Arquivos", "pubmed-enzimasmic-set.bib")
file_wos    <- file.path(ROOT, "Arquivos", "savedrecs.bib")
file_scopus <- file.path(ROOT, "Arquivos", "scopus.csv")

# Importar as bases
df_pubmed <- convert2df(file_pubmed, dbsource = "pubmed", format = "bibtex")
df_wos    <- convert2df(file_wos,    dbsource = "wos",    format = "bibtex")
df_scopus <- convert2df(file_scopus, dbsource = "scopus", format = "csv")

--------------------------------------------------------------------------------

nrow(df_pubmed)
nrow(df_wos)
nrow(df_scopus)

---------------------------------------------------------------------------------

# Listar nomes das colunas de cada base
vars_pubmed <- colnames(df_pubmed)
vars_scopus <- colnames(df_scopus)
vars_wos    <- colnames(df_wos)

# Criar um data.frame comparativo
library(dplyr)

all_vars <- sort(unique(c(vars_pubmed, vars_scopus, vars_wos)))

compare_vars <- data.frame(
  Variável = all_vars,
  PubMed   = all_vars %in% vars_pubmed,
  Scopus   = all_vars %in% vars_scopus,
  WoS      = all_vars %in% vars_wos
)

# Visualizar em tabela
print(compare_vars, right = FALSE, row.names = FALSE)

# (Opcional) Exportar para Excel
# install.packages("writexl") # caso não esteja instalado
library(writexl)
write_xlsx(compare_vars, file.path(ROOT, "Arquivos", "comparativo_variaveis_bases.xlsx"))

---------------------------------------------------------------------------------

# Carregar pacotes necessários
library(dplyr)
library(stringr)

# 1. Identificar as colunas comuns entre as três bases
common_vars <- Reduce(intersect, list(colnames(df_pubmed), colnames(df_scopus), colnames(df_wos)))

# 2. Filtrar apenas essas colunas nas três bases
df_pubmed_common <- df_pubmed[, common_vars]
df_scopus_common <- df_scopus[, common_vars]
df_wos_common    <- df_wos[, common_vars]

# 3. Adicionar uma coluna com a origem da base
df_pubmed_common$SOURCE <- "PubMed"
df_scopus_common$SOURCE <- "Scopus"
df_wos_common$SOURCE    <- "WoS"

# 4. Unificar os três dataframes
df_merged <- bind_rows(df_pubmed_common, df_scopus_common, df_wos_common)

# 5. Verificar o resultado
cat("Total de artigos unificados:", nrow(df_merged), "\n")
cat("Total de variáveis mantidas:", ncol(df_merged), "\n")

# 6. (Opcional) Visualizar estrutura
str(df_merged)

---------------------------------------------------------------------------------

# Definir limite do Excel
excel_limit <- 32767

# Verificar colunas que ultrapassam o limite
long_cells <- sapply(df_merged, function(col) {
  if (is.character(col)) {
    sum(nchar(col, keepNA = FALSE) > excel_limit, na.rm = TRUE)
  } else {
    0
  }
})

# Exibir colunas e número de células problemáticas
long_cells[long_cells > 0]

-----------------------------------

# Define o limite
excel_limit <- 32767

# Criar função segura para localizar as células com excesso
get_long_cells <- function(df, limit) {
  results <- list()
  
  for (col_name in names(df)) {
    if (is.character(df[[col_name]])) {
      idx_long <- which(nchar(df[[col_name]], keepNA = FALSE) > limit)
      
      if (length(idx_long) > 0) {
        results[[col_name]] <- data.frame(
          linha = idx_long,
          coluna = col_name,
          tamanho = nchar(df[[col_name]][idx_long]),
          conteudo = substr(df[[col_name]][idx_long], 1, 200), # preview dos 200 primeiros caracteres
          stringsAsFactors = FALSE
        )
      }
    }
  }
  return(results)
}

# Aplicar à base
problemas_celulas <- get_long_cells(df_merged, 32767)

# Visualizar
problemas_celulas


--------------------------------------------------------------------------------

df_merged$CR[231] <- substr(df_merged$CR[231], 1, 200)

--------------------------------------------------------------------------------

write_xlsx(df_merged, file.path(PATH_ARQ, "base_bibliometrica_unificada.xlsx"))

--------------------------------------------------------------------------------

# Etapa 1: Carregar o pacote (se ainda não estiver carregado)
library(bibliometrix)

# Etapa 2: Iniciar o Biblioshiny
biblioshiny()











