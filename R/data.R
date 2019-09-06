#' Small example data set.
#'
#' An example data set containing one mock sample, three non-mock samples, with
#'  reads for four control species and three non-control species. Gives the
#'  numbers in Table 1 of the manuscript.
#'
#' @format A tibble with 4 rows and 8 columns:
#' \describe{
#'   \item{Sample}{Either 'mock', or 1, 2, 3, labelling the samples}
#'   \item{a1, a2, a3, a4}{Reads of control species a1, a2, a3 and a4}
#'   \item{`1`, `2` `3`}{Reads of non-control species 1, 2 and 3}
#' }
#' @source Simplified and anonymised example from a real data set (big_example).
"small_example"

#' Expected result of running `remove_false_pos(small_example)`, for testing.
#'
#' Expected resulting data set containing one mock sample, three non-mock samples, with
#'  reads for four control species and three non-control species. Gives the
#'  numbers in Table ???? of the manuscript.
#'
#' @format A tibble with 4 rows and 8 columns:
#' \describe{
#'   \item{Sample}{Either 'mock', or 1, 2, 3, labelling the samples}
#'   \item{a1, a2, a3, a4}{Reads of control species a1, a2, a3 and a4}
#'   \item{`1`, `2` `3`}{Reads of non-control species 1, 2, 3}
#' }
#' @source From setting false positives to zero in `small_example`.
"small_example_result"

#' Resulting reads that get set to zero when running `remove_false_pos(small_example)`, for testing.
#'
#' Expected resulting data set containing one mock sample, three non-mock samples, with
#'  reads for four control species and three non-control species. Gives the
#'  numbers in Table ???? of the manuscript.
#'
#' @format A tibble with 4 rows and 8 columns:
#' \describe{
#'   \item{Sample}{Either 'mock', or 1, 2, 3, labelling the samples}
#'   \item{a1, a2, a3, a4}{Reads of control species a1, a2, a3 and a4}
#'   \item{`1`, `2` `3`}{Reads of non-control species 1, 2, 3}
#' }
#' @source From setting false positives to zero in `small_example`.
"small_example_zeros"


#' Big example data set.
#'
#' An example data set containing 1 mock sample, 124 non-mock samples, with
#'  reads for 4 control species and 18 non-control species. Gives the
#'  numbers in Table ????? of the manuscript.
#'
#' @format A tibble with 125 rows and 23 columns:
#' \describe{
#'   \item{Sample}{Either 'mock', or 1, 2, 3, ..., 124 labelling the samples}
#'   \item{a1, a2, a3, a4}{Reads of control species a1, a2, a3 and a4}
#'   \item{`1`, `2` `3`, ..., 18}{Reads of non-control species 1, 2, 3, ..., 18}
#' }
#' @source Anonymised example of a real data set (`big_example`).
"big_example"

#' Expected result of running `remove_false_pos(big_example)`, for testing.
#'
#' Expected resulting data set containing 1 mock sample, 124 non-mock samples, with
#'  reads for 4 control species and 18 non-control species. Gives the
#'  numbers in Table ????? of the manuscript.
#'
#' @format A tibble with 125 rows and 23 columns:
#' \describe{
#'   \item{Sample}{Either 'mock', or 1, 2, 3, ..., 124 labelling the samples}
#'   \item{a1, a2, a3, a4}{Reads of control species a1, a2, a3 and a4}
#'   \item{`1`, `2` `3`, ..., 18}{Reads of non-control species 1, 2, 3, ..., 18}
#' }
#' @source From setting false positives to zero in `big_example`.
"big_example_result"

#' Resulting reads that get set to zero when running `remove_false_pos(big_example)`, for testing.
#'
#' Expected resulting data set containing 1 mock sample, 124 non-mock samples, with
#'  reads for 4 control species and 18 non-control species. Gives the
#'  numbers in Table ????? of the manuscript, with non-zero reads indicating the
#'  reads that get to zero to remove false positives.
#'
#' @format A tibble with 125 rows and 23 columns:
#' \describe{
#'   \item{Sample}{Either 'mock', or 1, 2, 3, ..., 124 labelling the samples}
#'   \item{a1, a2, a3, a4}{Reads of control species a1, a2, a3 and a4}
#'   \item{`1`, `2` `3`, ..., 18}{Reads of non-control species 1, 2, 3, ..., 18}
#' }
#' @source From setting false positives to zero in `big_example`.
"big_example_zeros"
