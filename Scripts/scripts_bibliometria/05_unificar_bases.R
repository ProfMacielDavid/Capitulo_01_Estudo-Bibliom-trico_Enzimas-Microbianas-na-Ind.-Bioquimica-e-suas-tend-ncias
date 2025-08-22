
# 05_unificar_bases.R

colunas_padrao <- Reduce(intersect, list(colnames(df_pubmed), colnames(df_wos), colnames(df_scopus)))
df_pubmed  <- df_pubmed[, colunas_padrao]
df_wos     <- df_wos[, colunas_padrao]
df_scopus  <- df_scopus[, colunas_padrao]

df_merged <- dplyr::bind_rows(df_pubmed, df_wos, df_scopus)
df_merged <- df_merged |>
  dplyr::distinct(TI, DI, .keep_all = TRUE)

write_xlsx(df_merged, file.path(PATH_ARQ, "base_bibliometrica_unificada.xlsx"))
