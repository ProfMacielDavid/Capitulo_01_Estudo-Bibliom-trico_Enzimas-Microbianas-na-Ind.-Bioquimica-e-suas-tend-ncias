
# 04_preprocessar_scopus.R

df_scopus <- df_scopus |>
  dplyr::mutate(DB = "Scopus") |>
  dplyr::mutate(across(where(is.character), ~ stringr::str_replace_all(., "[\r\n\t]+", " "))) |>
  dplyr::mutate(across(where(is.character), ~ stringr::str_squish(.))) |>
  dplyr::mutate(NO_DOI = is.na(DI) | DI == "") |>
  dplyr::filter(!NO_DOI) |>
  dplyr::distinct(TI, DI, .keep_all = TRUE)
