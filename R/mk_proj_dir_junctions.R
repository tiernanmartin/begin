#' @title Make a Project Directory Junctions
#' @description \code{mk_proj_dir_junctions} creates a directory junction between pre-identified
#'   directories.
#' @param template A \code{character} object specifying a file directory structure.
#'   The available templates are:
#'   \itemize{
#'     \item \code{'\link{template_basic}'}
#'     \item \code{'\link{template_osf_package}'}
#'     \item \code{'\link{template_shiny_package}'}
#' }
#' @importFrom magrittr "%>%"
#' @export
mk_proj_dir_junction <- function(template){

    # This function is only available for Windows OS users

  if(! get_os() %in% "win"){stop("This function is only available for Windows OS users")}

    # Create the directory junction between `/extdata` and `/inst`
  if(template %in% "template_osf_package"){

    system2("cmd.exe", args = "/c mklink /J inst\\extdata extdata")

  }

  invisible(NULL)
}
