#' Make a project directory
#'
#' \code{mk_proj_dir} creates a directory of folders for a generic project.
#'
#' These folders will also contain \code{.gitkeep} or \code{.gitignore}
#' files (if necessary).
#'
#' @importFrom readr "read_rds"
#' @importFrom purrr "walk"
#' @importFrom magrittr "%>%"
#' @importFrom stringr "str_c"
#' @export
mk_proj_dir <- function(){

  # Read "captured" directory file

  f <- read_rds("./inst/proj-dir.rds")

  # Create directories

  f %>%
    pull(FULLPATH) %>%
    map_chr(~ str_c(getwd(),.x,sep = "/")) %>%
    walk(dir.create)


  # Create .gitignore and .gitkeep files

  f %>%
    pull(FULLPATH) %>%
    map_chr(~ str_c('echo "*\n!.gitignore" >',.x,"/.gitignore",collapse = "")) %>%
    walk(system)

  f %>%
    pull(FULLPATH) %>%
    map_chr(~ str_c('touch ',.x,"/.gitkeep",collapse = "")) %>%
    walk(system)


  # system("touch .nojekyll")  # this is no longer necessary

  return(NULL)
}
