#' Make a Shiny Application Package directory
#'
#' \code{mk_shiny_pkg_dir} creates a directory of folders for a Shiny Application package.
#'
#' These folders will also contain \code{/ui.R}, \code{/server.R}, and \code{/global.R}.
#' @note This file director comes from the a \href{https://community.rstudio.com/t/best-practices-shiny-development/1694/5?u=tiernan}{post} in the RStudio Community Forum
#' @importFrom readr "read_rds"
#' @importFrom purrr "pluck"
#' @importFrom purrr "map_chr"
#' @importFrom purrr "walk"
#' @importFrom dplyr "pull"
#' @importFrom magrittr "%>%"
#' @importFrom stringr "str_c"
#' @export
mk_shiny_pkg_dir <- function(){

  # Read the directory template file from /data

  data("shiny_pkg_template")

  f <- shiny_pkg_template

  # Create directories

  f %>%
    pull(FULLPATH) %>%
    map_chr(~ str_c(getwd(),.x,sep = "/")) %>%
    walk(dir.create)


  # Create Shiny Application files

  files <-
    f %>%
    pull(FULLPATH) %>%
    map_chr(~ str_c(getwd(),.x,sep = "/")) %>%
    pluck(2) %>%
    str_c(c('ui.R', 'server.R', 'global.R'),sep = "/")

  files %>%
    map_chr(~ str_c('touch ', .x, collapse = "")) %>%
    walk(system)


  # system("touch .nojekyll")  # this is no longer necessary
  return(NULL)
}
