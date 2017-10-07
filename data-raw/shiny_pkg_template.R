shiny_pkg_template <-
tibble::tribble(
  ~ROWID,               ~FULLPATH,                       ~DIR_LIST, ~DEPTH,  ~first,        ~second, ~third, ~fourth, ~fifth,
     36L,                  "inst",                            "inst",     1L,  "inst",             NA,     NA,      NA,     NA,
     37L,      "inst/application",        c("inst", "application"),     2L,  "inst",  "application",     NA,      NA,     NA,
     38L,  "inst/application/www", c("inst", "application", "www"),     3L,  "inst",  "application",  "www",      NA,     NA
  )

readr::write_rds(shiny_pkg_template , "data-raw/shiny_pkg_dir.rds")
devtools::use_data(shiny_pkg_template, overwrite = TRUE, compress = 'xz')
