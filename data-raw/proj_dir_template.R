template <-
tibble::tribble(
  ~ROWID,                               ~FULLPATH,                                       ~DIR_LIST, ~DEPTH,              ~X1st,           ~X2nd,      ~X3rd,
      1L,                                "1-data",                                     c("1-data"),     1L,           "1-data",              NA,         NA,
      2L,                          "1-data/1-raw",                            c("1-data", "1-raw"),     2L,           "1-data",         "1-raw",         NA,
      3L,                     "1-data/2-external",                       c("1-data", "2-external"),     2L,           "1-data",    "2-external",         NA,
      4L,                      "1-data/3-interim",                        c("1-data", "3-interim"),     2L,           "1-data",     "3-interim",         NA,
      5L,                        "1-data/4-ready",                          c("1-data", "4-ready"),     2L,           "1-data",       "4-ready",         NA,
      6L,                       "2-communication",                            c("2-communication"),     1L,  "2-communication",              NA,         NA,
      7L,          "2-communication/1-rnotebooks",            c("2-communication", "1-rnotebooks"),     2L,  "2-communication",  "1-rnotebooks",         NA,
      8L,  "2-communication/1-rnotebooks/archive", c("2-communication", "1-rnotebooks", "archive"),     3L,  "2-communication",  "1-rnotebooks",  "archive",
      9L,      "2-communication/1-rnotebooks/tmp",     c("2-communication", "1-rnotebooks", "tmp"),     3L,  "2-communication",  "1-rnotebooks",      "tmp",
     10L,            "2-communication/2-bookdown",              c("2-communication", "2-bookdown"),     2L,  "2-communication",    "2-bookdown",         NA,
     11L,           "2-communication/3-rmarkdown",             c("2-communication", "3-rmarkdown"),     2L,  "2-communication",   "3-rmarkdown",         NA,
     12L,           "2-communication/4-shinyapps",             c("2-communication", "4-shinyapps"),     2L,  "2-communication",   "4-shinyapps",         NA,
     13L,                "2-communication/others",                  c("2-communication", "others"),     2L,  "2-communication",        "others",         NA,
     14L,         "2-communication/others/images",        c("2-communication", "others", "images"),     3L,  "2-communication",        "others",   "images",
     15L,         "2-communication/others/msword",        c("2-communication", "others", "msword"),     3L,  "2-communication",        "others",   "msword",
     16L,            "2-communication/others/pdf",           c("2-communication", "others", "pdf"),     3L,  "2-communication",        "others",      "pdf",
     17L,        "2-communication/others/spatial",       c("2-communication", "others", "spatial"),     3L,  "2-communication",        "others",  "spatial",
     18L,                           "3-resources",                                c("3-resources"),     1L,      "3-resources",              NA,         NA
  )

readr::write_rds(template, "data-raw/proj_dir.rds")
devtools::use_data(template, overwrite = TRUE, compress = 'xz')
