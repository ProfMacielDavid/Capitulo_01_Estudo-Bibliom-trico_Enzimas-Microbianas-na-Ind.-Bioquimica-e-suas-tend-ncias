
# Script para carregar coleção exportada do biblioshiny

# Ativar ambiente renv (se necessário)
if (requireNamespace("renv", quietly = TRUE)) {
  renv::activate()
}

# Carregar bibliometrix
if (!requireNamespace("bibliometrix", quietly = TRUE)) {
  install.packages("bibliometrix")
}
library(bibliometrix)

# Caminho para o arquivo exportado
file_export <- "D:/PROJETOS_2025/ARTIGOS_2025/Capitulo_01_Estudo-Bibliométrico_Enzimas Microbianas na Ind. Bioquimica e suas tendências/Arquivos/Bibliometrix-Export-File-2025-08-21.RData"

# Carregar a coleção exportada
load(file_export)

# Iniciar biblioshiny com o objeto M carregado
biblioshiny(M)
