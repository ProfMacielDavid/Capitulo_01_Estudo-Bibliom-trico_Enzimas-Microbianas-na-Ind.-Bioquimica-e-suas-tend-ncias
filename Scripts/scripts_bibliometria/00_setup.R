
# 00_setup.R - Configuração inicial do ambiente

# Carregar bibliotecas principais
if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")
library(renv)

# Inicializar ambiente renv, se necessário
if (!file.exists("renv.lock")) renv::init() else renv::activate()

# Carregar bibliometrix
if (!requireNamespace("bibliometrix", quietly = TRUE)) install.packages("bibliometrix")
library(bibliometrix)

# Outras bibliotecas úteis
packages <- c("writexl", "readxl", "dplyr", "stringr")
for (pkg in packages) if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
lapply(packages, library, character.only = TRUE)

cat("Ambiente carregado com sucesso.\n")
