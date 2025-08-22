
# 02_preprocessar_pubmed.R

df_pubmed <- df_pubmed |>
  dplyr::mutate(DB = "PubMed") |>
  dplyr::mutate(across(where(is.character), ~ stringr::str_replace_all(., "[\r\n\t]+", " "))) |>
  dplyr::mutate(across(where(is.character), ~ stringr::str_squish(.))) |>
  dplyr::mutate(NO_DOI = is.na(DI) | DI == "") |>
  dplyr::filter(!NO_DOI) |>
  dplyr::distinct(TI, DI, .keep_all = TRUE)
