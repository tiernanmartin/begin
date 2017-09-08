#' Convert child directories into a tibble
#'
#' \code{capture_dir} creates a \code{tibble} containing the path of each level
#' of child of a given parent directory.
#'
#' @export
capture_dir <- function(root_path = "/home/rstudio/github/"){

  list.dirs(root_path, full.names = F) %>%
    keep(grepl("^[[:digit:]]",.)) %>%
    unique %>%
    as_tibble() %>%
    rowid_to_column("ROWID") %>%
    rename(FULLPATH = value) %>%
    mutate(DIR_LIST = map(FULLPATH, ~ str_split(.x,pattern = "/") %>% unlist),
           LEVEL = map_int(DIR_LIST,length))

}