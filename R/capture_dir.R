#' Convert child directories into a tibble
#'
#' \code{capture_dir} creates a \code{tibble} containing the path of each level
#' of child of a given parent directory.
#'
#' @param root_path a character string of a parent directory
#' @param regex_string a regular expression character string use to match directory names
#' @importFrom magrittr "%>%"
#' @importFrom stringr "str_split"
#' @import purrr
#' @import tibble
#' @import dplyr
#' @import tidyr
#' @import toOrdinal
#' @export
capture_dir <- function(root_path = "./rstudio/github/", regex_string = '[\\s\\S]*'){

  data(ordinal_numbers_1to10)

  paths_tbl <- root_path %>%
    list.dirs(full.names = F) %>%
    purrr::discard(stringr::str_detect(.,"^\\.")) %>%
    purrr::discard(~ nchar(.x) < 1) %>%
    unique %>%
    tibble::as_tibble() %>%
    tibble::rowid_to_column("ROWID") %>%
    dplyr::rename(FULLPATH = value)

  paths_long <- paths_tbl %>%
    dplyr::mutate(DIR_LIST = purrr::map(FULLPATH, ~ stringr::str_split(.x,pattern = "/") %>% unlist),
           DIR_LIST_UNNEST = DIR_LIST,
           DEPTH = purrr::map_int(DIR_LIST,length)) %>%
    tidyr::unnest(DIR_LIST_UNNEST,.drop = F) %>%
    dplyr::group_by(ROWID) %>%
   dplyr:: mutate(id = dplyr::row_number(),
           id = purrr::map_chr(id,~ ordinal_numbers_1to10[.x,'ord_word'] %>% dplyr::pull()),
           id = factor(id, levels = ordinal_numbers_1to10$ord_word)) %>%
    dplyr::arrange(id) %>%
    dplyr::ungroup()

  paths_ready <- paths_long %>%
    tidyr::spread(id,DIR_LIST_UNNEST)

  return(paths_ready)

}
