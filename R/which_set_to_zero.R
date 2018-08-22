##' @title Show which reads were set to zero
##'
##' @description Subtracts the result of remove_false_pos(original) [already done]
##' from original, which has to be done through this function which takes care
##' of the first column containing characters (the word 'mock').
##'
##' @param original Original tibble data frame of numbers of reads.
##' @param result Resulting tibble from doing remove_false_pos(original).
##' @return A tibble showing which of the original positive reads were set to zero.
##' @author Andrew Edwards
which_set_to_zero = function(original, result) {
  if(class(original)[1] != "tbl_df") stop("First argument needs to be a tibble dataframe.")
  if(class(result)[1] != "tbl_df") stop("First argument needs to be a tibble dataframe.")
  if(dim(original)[1] != dim(result)[1]) stop("Both arguments need to have the same dimension.")
  if(dim(original)[2] != dim(result)[2]) stop("Both arguments need to have the same dimension.")

  ans <- dplyr::select(original, -1) - dplyr::select(result, -1)
  cbind(dplyr::select(original, 1), ans)
}
