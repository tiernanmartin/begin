#' @title Directory Templates
#' @description Create a \code{tibble} object containing a file directory.
#' @return a \code{tibble} object

#' @rdname directory-templates
#' @export
template_basic <- function(){

  basic <- tibble::tribble(
   ~ROWID,                              ~FULLPATH,                                       ~DIR_LIST, ~DEPTH,            ~first,        ~second,    ~third,
       1L,                               "1-data",                                         "1-data",     1L,          "1-data",             NA,        NA,
       2L,                         "1-data/1-raw",                            c("1-data", "1-raw"),     2L,          "1-data",        "1-raw",        NA,
       3L,                    "1-data/2-external",                       c("1-data", "2-external"),     2L,          "1-data",   "2-external",        NA,
       4L,                     "1-data/3-interim",                        c("1-data", "3-interim"),     2L,          "1-data",    "3-interim",        NA,
       5L,                       "1-data/4-ready",                          c("1-data", "4-ready"),     2L,          "1-data",      "4-ready",        NA,
       6L,                      "2-communication",                                 "2-communication",     1L, "2-communication",             NA,        NA,
       7L,           "2-communication/1-rscripts",              c("2-communication", "1-rscripts"),     2L, "2-communication",   "1-rscripts",        NA,
       8L,   "2-communication/1-rscripts/archive",   c("2-communication", "1-rscripts", "archive"),     3L, "2-communication",   "1-rscripts", "archive",
       9L,       "2-communication/1-rscripts/tmp",       c("2-communication", "1-rscripts", "tmp"),     3L, "2-communication",   "1-rscripts",     "tmp",
      10L,         "2-communication/2-rnotebooks",            c("2-communication", "2-rnotebooks"),     2L, "2-communication", "2-rnotebooks",        NA,
      11L, "2-communication/2-rnotebooks/archive", c("2-communication", "2-rnotebooks", "archive"),     3L, "2-communication", "2-rnotebooks", "archive",
      12L,     "2-communication/2-rnotebooks/tmp",     c("2-communication", "2-rnotebooks", "tmp"),     3L, "2-communication", "2-rnotebooks",     "tmp",
      13L,           "2-communication/3-bookdown",              c("2-communication", "3-bookdown"),     2L, "2-communication",   "3-bookdown",        NA,
      14L,          "2-communication/4-rmarkdown",             c("2-communication", "4-rmarkdown"),     2L, "2-communication",  "4-rmarkdown",        NA,
      15L,          "2-communication/5-shinyapps",             c("2-communication", "5-shinyapps"),     2L, "2-communication",  "5-shinyapps",        NA,
      16L,               "2-communication/others",                  c("2-communication", "others"),     2L, "2-communication",       "others",        NA,
      17L,        "2-communication/others/images",        c("2-communication", "others", "images"),     3L, "2-communication",       "others",  "images",
      18L,        "2-communication/others/msword",        c("2-communication", "others", "msword"),     3L, "2-communication",       "others",  "msword",
      19L,           "2-communication/others/pdf",           c("2-communication", "others", "pdf"),     3L, "2-communication",       "others",     "pdf",
      20L,       "2-communication/others/spatial",       c("2-communication", "others", "spatial"),     3L, "2-communication",       "others", "spatial",
      21L,                          "3-resources",                                     "3-resources",     1L,     "3-resources",             NA,        NA
   )

  return(basic)
}

#' @rdname directory-templates
#' @export
template_osf_package <- function(){

  osf_package <- tibble::tribble(
                       ~ROWID,               ~FULLPATH,                     ~DIR_LIST, ~DEPTH,     ~first,         ~second,
                           1L,                  "data",                          "data",     1L,     "data",              NA,
                           2L,              "data-raw",                      "data-raw",     1L, "data-raw",              NA,
                           3L,            "data-raw/R",            c("data-raw", "R"),     2L, "data-raw",             "R",
                           4L,                   "doc",                           "doc",     1L,      "doc",              NA,
                           5L,               "extdata",                       "extdata",     1L,  "extdata",              NA,
                           6L,   "extdata/data-export",   c("extdata", "data-export"),     2L,  "extdata",   "data-export",
                           7L, "extdata/model-archive", c("extdata", "model-archive"),     2L,  "extdata", "model-archive",
                           8L,           "extdata/osf",           c("extdata", "osf"),     2L,  "extdata",           "osf",
                          15L,             "extdata/R",             c("extdata", "R"),     2L,  "extdata",             "R",
                          16L,        "extdata/source",        c("extdata", "source"),     2L,  "extdata",        "source",
                          36L,                  "inst",                          "inst",     1L,     "inst",              NA,
                          68L,                   "man",                           "man",     1L,      "man",              NA,
                          69L,                     "R",                             "R",     1L,        "R",              NA,
                          70L,             "R/archive",             c("R", "archive"),     2L,        "R",       "archive",
                          71L,             "R/scripts",             c("R", "scripts"),     2L,        "R",       "scripts"
                       )
return(osf_package)

}

#' @rdname directory-templates
#' @export
template_shiny_package <- function(){

  shiny_package <- tibble::tribble(
                         ~ROWID,                      ~FULLPATH,                                  ~DIR_LIST, ~DEPTH, ~first,       ~second, ~third,   ~fourth, ~fifth, ~sixth, ~seventh,
                           103L,                         "inst",                                       "inst",     1L, "inst",            NA,     NA,        NA,     NA,     NA,       NA,
                           104L,             "inst/application",                   c("inst", "application"),     2L, "inst", "application",     NA,        NA,     NA,     NA,       NA,
                           105L,         "inst/application/www",            c("inst", "application", "www"),     3L, "inst", "application",  "www",        NA,     NA,     NA,       NA,
                           106L, "inst/application/www/content", c("inst", "application", "www", "content"),     4L, "inst", "application",  "www", "content",     NA,     NA,       NA,
                           107L,     "inst/application/www/css",     c("inst", "application", "www", "css"),     4L, "inst", "application",  "www",     "css",     NA,     NA,       NA,
                           108L,    "inst/application/www/data",    c("inst", "application", "www", "data"),     4L, "inst", "application",  "www",    "data",     NA,     NA,       NA,
                           109L,  "inst/application/www/images",  c("inst", "application", "www", "images"),     4L, "inst", "application",  "www",  "images",     NA,     NA,       NA
                         )
return(shiny_package)
}
