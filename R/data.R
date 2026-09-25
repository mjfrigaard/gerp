#' Wu-Tang Clan members
#'
#' Example data stored as a `data.frame` (`wu_df`), `data.table` (`wu_dt`),
#' and `tibble` (`wu_tbl`). The raw data is in `inst/extdata/wu_data.csv`.
#'
#' @format A dataset with 10 rows and 5 variables:
#' \describe{
#'   \item{member}{Wu-Tang Clan Member Name}
#'   \item{name}{Wu-Tang Clan Given Name}
#'   \item{born}{Birth Year}
#'   \item{city}{Birth City}
#'   \item{alive}{Still Alive?}
#' }
#' @source <https://en.wikipedia.org/wiki/Wu-Tang_Clan>
#' @keywords internal
"wu_df"

#' @rdname wu_df
#' @keywords internal
"wu_dt"

#' @rdname wu_df
#' @keywords internal
"wu_tbl"

#' Example date formats and regular expressions
#'
#' `date_formats` is a character vector of common date formats and
#' `date_patterns` is a named list of regular expressions for matching them.
#'
#' @format `date_formats`: character vector (16). `date_patterns`: named list (7).
#' @keywords internal
"date_formats"

#' @rdname date_formats
#' @keywords internal
"date_patterns"
