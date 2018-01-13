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
    keep(grepl(regex_string,.)) %>%
    unique %>%
    as_tibble() %>%
    rowid_to_column("ROWID") %>%
    rename(FULLPATH = value)

  paths_long <- paths_tbl %>%
    mutate(DIR_LIST = map(FULLPATH, ~ str_split(.x,pattern = "/") %>% unlist),
           DIR_LIST_UNNEST = DIR_LIST,
           DEPTH = map_int(DIR_LIST,length)) %>%
    unnest(DIR_LIST_UNNEST,.drop = F) %>%
    group_by(ROWID) %>%
    mutate(id = row_number(),
           id = map_chr(id,~ ordinal_numbers_1to10[.x,'ord_word'] %>% pull),
           id = factor(id, levels = ordinal_numbers_1to10$ord_word)) %>%
    arrange(id) %>%
    ungroup

  paths_ready <- paths_long %>%
    spread(id,DIR_LIST_UNNEST)

  return(paths_ready)

}
