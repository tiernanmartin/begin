#' @title Make a Project Directory
#' @description \code{mk_proj_dir} creates a directory of folders for a generic project.
#'   These folders will also contain \code{.gitkeep} or \code{.gitignore} files (if necessary).
#' @param template A \code{tibble} object containing a file directory structure.
#'   The available templates are:
#'   \itemize{
#'     \item \code{\link{template_basic}()}
#'     \item \code{\link{template_osf_package}()}
#'     \item \code{\link{template_shiny_package}()}
#' }
#' @importFrom magrittr "%>%"
#' @export
mk_proj_dir <- function(template){

  f <- template

  # Create directories

  f %>%
    dplyr::pull(FULLPATH) %>%
    purrr::map_chr(~ stringr::str_c(getwd(),.x,sep = "/")) %>%
    purrr::walk(fs::dir_create)


  # Create .gitignore and .gitkeep files

  f %>%
    dplyr::pull(FULLPATH) %>%
    purrr::map_chr(~ stringr::str_c('echo "*\n!.gitignore" >',.x,"/.gitignore",collapse = "")) %>%
    purrr::walk(system)

  f %>%
    dplyr::pull(FULLPATH) %>%
    purrr::map_chr(~ stringr::str_c('touch ',.x,"/.gitkeep",collapse = "")) %>%
    purrr::walk(system)

  invisible(NULL)
}
