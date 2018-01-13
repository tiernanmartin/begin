template <-
tibble::tribble(
  ~ROWID,                               ~FULLPATH,                                       ~DIR_LIST, ~DEPTH,             ~first,         ~second,     ~third,
      1L,                                "1-data",                                     c("1-data"),     1L,           "1-data",              NA,         NA,
      2L,                          "1-data/1-raw",                            c("1-data", "1-raw"),     2L,           "1-data",         "1-raw",         NA,
      3L,                     "1-data/2-external",                       c("1-data", "2-external"),     2L,           "1-data",    "2-external",         NA,
      4L,                      "1-data/3-interim",                        c("1-data", "3-interim"),     2L,           "1-data",     "3-interim",         NA,
      5L,                        "1-data/4-ready",                          c("1-data", "4-ready"),     2L,           "1-data",       "4-ready",         NA,
      6L,                       "2-communication",                            c("2-communication"),     1L,  "2-communication",              NA,         NA,
      7L,            "2-communication/1-rscripts",              c("2-communication", "1-rscripts"),     2L,  "2-communication",    "1-rscripts",         NA,
      8L,    "2-communication/1-rscripts/archive",   c("2-communication", "1-rscripts", "archive"),     3L,  "2-communication",    "1-rscripts",  "archive",
      9L,        "2-communication/1-rscripts/tmp",       c("2-communication", "1-rscripts", "tmp"),     3L,  "2-communication",    "1-rscripts",      "tmp",
     10L,          "2-communication/2-rnotebooks",            c("2-communication", "2-rnotebooks"),     2L,  "2-communication",  "2-rnotebooks",         NA,
     11L,  "2-communication/2-rnotebooks/archive", c("2-communication", "2-rnotebooks", "archive"),     3L,  "2-communication",  "2-rnotebooks",  "archive",
     12L,      "2-communication/2-rnotebooks/tmp",     c("2-communication", "2-rnotebooks", "tmp"),     3L,  "2-communication",  "2-rnotebooks",      "tmp",
     13L,            "2-communication/3-bookdown",              c("2-communication", "3-bookdown"),     2L,  "2-communication",    "3-bookdown",         NA,
     14L,           "2-communication/4-rmarkdown",             c("2-communication", "4-rmarkdown"),     2L,  "2-communication",   "4-rmarkdown",         NA,
     15L,           "2-communication/5-shinyapps",             c("2-communication", "5-shinyapps"),     2L,  "2-communication",   "5-shinyapps",         NA,
     16L,                "2-communication/others",                  c("2-communication", "others"),     2L,  "2-communication",        "others",         NA,
     17L,         "2-communication/others/images",        c("2-communication", "others", "images"),     3L,  "2-communication",        "others",   "images",
     18L,         "2-communication/others/msword",        c("2-communication", "others", "msword"),     3L,  "2-communication",        "others",   "msword",
     19L,            "2-communication/others/pdf",           c("2-communication", "others", "pdf"),     3L,  "2-communication",        "others",      "pdf",
     20L,        "2-communication/others/spatial",       c("2-communication", "others", "spatial"),     3L,  "2-communication",        "others",  "spatial",
     21L,                           "3-resources",                                c("3-resources"),     1L,      "3-resources",              NA,         NA
  )


readr::write_rds(template, "data-raw/proj_dir.rds")
devtools::use_data(template, overwrite = TRUE, compress = 'xz')
