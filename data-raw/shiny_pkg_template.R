shiny_pkg_template <-
tibble::tribble(
  ~ROWID,                       ~FULLPATH,                                  ~DIR_LIST, ~DEPTH,  ~first,        ~second, ~third,    ~fourth, ~fifth, ~sixth, ~seventh,
    103L,                          "inst",                                     "inst",     1L,  "inst",             NA,     NA,         NA,     NA,     NA,       NA,
    104L,              "inst/application",                   c("inst", "application"),     2L,  "inst",  "application",     NA,         NA,     NA,     NA,       NA,
    105L,          "inst/application/www",            c("inst", "application", "www"),     3L,  "inst",  "application",  "www",         NA,     NA,     NA,       NA,
    106L,  "inst/application/www/content", c("inst", "application", "www", "content"),     4L,  "inst",  "application",  "www",  "content",     NA,     NA,       NA,
    107L,      "inst/application/www/css",     c("inst", "application", "www", "css"),     4L,  "inst",  "application",  "www",      "css",     NA,     NA,       NA,
    108L,     "inst/application/www/data",    c("inst", "application", "www", "data"),     4L,  "inst",  "application",  "www",     "data",     NA,     NA,       NA,
    109L,   "inst/application/www/images",  c("inst", "application", "www", "images"),     4L,  "inst",  "application",  "www",   "images",     NA,     NA,       NA
  )

readr::write_rds(shiny_pkg_template , "data-raw/shiny_pkg_dir.rds")
devtools::use_data(shiny_pkg_template, overwrite = TRUE, compress = 'xz')

