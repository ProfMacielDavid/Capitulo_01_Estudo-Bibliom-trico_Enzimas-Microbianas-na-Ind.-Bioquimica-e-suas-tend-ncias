
# 01_importar_bases.R - Importação dos arquivos .bib e .csv

ROOT <- "D:/PROJETOS_2025/ARTIGOS_2025/Capitulo_01_Estudo-Bibliométrico_Enzimas Microbianas na Ind. Bioquimica e suas tendências"
PATH_ARQ <- file.path(ROOT, "Arquivos")

file_pubmed <- file.path(PATH_ARQ, "pubmed_bibdata_tratada.xlsx")
file_wos    <- file.path(PATH_ARQ, "wos_bibdata_tratada.xlsx")
file_scopus <- file.path(PATH_ARQ, "scopus_bibdata_tratada.xlsx")

library(readxl)
df_pubmed <- readxl::read_excel(file_pubmed)
df_wos    <- readxl::read_excel(file_wos)
df_scopus <- readxl::read_excel(file_scopus)
