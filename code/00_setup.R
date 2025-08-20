# code/00_setup.R

# Configurações gerais
options(stringsAsFactors = FALSE)

# Pacotes principais
library(bibliometrix)
library(openxlsx)
library(data.table)
library(stringr)

# Caminho base do projeto
ROOT <- normalizePath(".")

# Caminhos padronizados
PATH_RAW     <- file.path(ROOT, "data", "raw")
PATH_PROC    <- file.path(ROOT, "data", "processed")
PATH_CODE    <- file.path(ROOT, "code")
PATH_FIGURES <- file.path(ROOT, "outputs", "figures")
PATH_TABLES  <- file.path(ROOT, "outputs", "tables")

# Criação das pastas, se necessário
dir.create(PATH_RAW, recursive = TRUE, showWarnings = FALSE)
dir.create(PATH_PROC, recursive = TRUE, showWarnings = FALSE)
dir.create(PATH_CODE, recursive = TRUE, showWarnings = FALSE)
dir.create(PATH_FIGURES, recursive = TRUE, showWarnings = FALSE)
dir.create(PATH_TABLES, recursive = TRUE, showWarnings = FALSE)
