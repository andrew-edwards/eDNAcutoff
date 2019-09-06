##' @title Removes suspected false positives from a data frame
##'
##' @description Removes suspected false positives from a data frame of numbers of reads
##' from machine fragments of DNA that match each species in each sample.
##'
##' @param data A tibble (table data frame, using dplyr) consisting of each row
##' representing a sample with values indicating the number of reads of each
##' species, with species represented by columns. The first row represents a
##' mock sample and remaining rows are real samples. The first column must be
##' called Sample and gives the name of the samples (mock sample must be
##' called 'mock'), next column is the category (if category == TRUE) which
##' gets removed for this function, next aT columns are reads of absent species,
##' and the remaining columns are reads of non-absent species.
##'
##' @param aT Total number of absent species.
##' @param category TRUE if second column is a category column, FALSE if there
##' is no category column.
##' @param alpha Tolerance for keeping potential false positive reads -- a number
##' of reads is only declared to be a false positive if it is less than 'alpha'
##' proportion of the maximum number of reads of that species across all samples.
##' @param ... Additional arguments.
##' @return A tibble with susepcted false positive reads set to 0.
##' @author Andrew Edwards
##' @export
##' @examples
##'
remove_false_pos = function(data, aT=4, category = FALSE, alpha = 0.2, ...) {
  if(class(data)[1] != "tbl_df") stop("First argument needs to be a tibble dataframe.")
  if(!("mock" %in% data$Sample)) stop("Need a mock sample.")

  data_use = data
  if(category) { data_use = dplyr::select(data_use, -2) }

  ncol = dim(data_use)[2]

  # names of the aT absent species:
  mock_spec_names = names(data_use)[2:(2+aT-1)]

  # names of the non-absent species:
  non_mock_spec_names = names(data_use)[(2+aT):ncol]

  non_mock_samples = dplyr::filter(data_use, Sample != "mock")
  non_mock_samples_mock_spec = dplyr::select(non_mock_samples, mock_spec_names)
  max_reads = max(non_mock_samples_mock_spec)

  max_row_col = which(non_mock_samples_mock_spec == max_reads, arr.ind=TRUE)
  imax_num = max_row_col[,"row"]
  # only refers to non_mock_samples

  imax = dplyr::pull(non_mock_samples[imax_num, "Sample"])   # name of imax row
  # imax as per write up (row name of non-mock sample that has the maximum
  #  number of reads of any of the absent species), but could be more than one row.
  if(length(imax) > 1) stop("Not implemented for imax > 1 yet.")

  imax_row_sum = sum(dplyr::select( dplyr::filter(data_use, Sample == imax),
                                   -Sample))

  P = max_reads / imax_row_sum
  sample_total_reads = rowSums(data_use[, 2:ncol])
  threshold = P * sample_total_reads

  max_species_read = c(NA, sapply(data_use[,2:ncol], max))

  output = data_use

  # Set the suspected false positives to zero.
  for(i in 1:dim(output)[1]) {
      for(j in 2:dim(output)[2]) {
          output[i,j] = output[i,j] *
                        !( (output[i,j] <= threshold[i]) &
                           (output[i,j] <= alpha * max_species_read[j])
                         )
      }
  }
  if(category) {
      output = dplyr::bind_cols(output[,1], dplyr::select(data, 2), output[,-1])
  }
  return(output)
}
