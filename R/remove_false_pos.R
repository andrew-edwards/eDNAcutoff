##' Removes suspected false positives from a data frame
##'
##' Removes suspected false positives from a data frame of numbers of reads
##' from machine fragments of DNA that match each species in each sample.
##' @title Maybe it goes here
##' @param data A tbl_df (table data frame, using dplyr) consisting of each row
##' representing a sample with values indicating the number of reads of each
##' species, with species represented by columns. The first row represents a
##' mock sample and remaining rows are real samples. The first column must be
##' called Sample_name and gives the name of the samples (mock sample must be
##' called 'mock'), next column is the category (if category == TRUE) which
##' gets removed for this function, next mN columns are reads of mock species,
##' and the remaining columns are reads of non-mock species.
##' @param mN Total number of mock species.
##' @param category TRUE if second column is a category column, FALSE if there
##' is no category column.
##' @param tol Tolerance for keeping potential false positive reads -- a number
##' of reads is only declared to be a false positive if it is less than 'tol'
##' proportion of the maximum number of reads of that speces across all samples.
##' @param ...
##' @return A tbl_df with susepcted false positive reads set to 0.
##' @author Andrew Edwards
##' @export
##' @examples
##'
remove_false_pos = function(data, mN=4, category = FALSE, tol = 0.2, ...) {
  if(class(data)[1] != "tbl_df") stop("First argument needs to be a dataframe.")
  if(!("mock" %in% data$Sample_name)) stop("Need a mock sample.")

  data.use = data
  if(category) { data.use = select(data.use, -2) }

  ncol = dim(data.use)[2]

  # names of the mN mock species:
  mock.spec.names = names(data.use)[2:(2+mN-1)]

  # names of the non-mock species:
  non.mock.spec.names = names(data.use)[(2+mN):ncol]

  non.mock.samples = filter(data.use, Sample_name != "mock")
  non.mock.samples.mock.spec = select(non.mock.samples, mock.spec.names)
  max.reads = max(non.mock.samples.mock.spec)

  max.row.col = which(non.mock.samples.mock.spec == max.reads, arr.ind=TRUE)
  imax.num = max.row.col[,"row"]
  # only refers to non.mock.samples

  imax = pull(non.mock.samples[imax.num, "Sample_name"])   # name of imax row
  # imax as per write up (row name of non-mock sample that has the maximum
  #  number of reads of any of the mock species), but could be more than one row.
  if(length(imax) > 1) stop("Not implemented for imax > 1 yet.")

  imax.row.sum = sum(select( filter(data.use, Sample_name == imax), -Sample_name))

  P = max.reads / imax.row.sum
  sample.total.reads = rowSums(data.use[, 2:ncol])
  threshold = P * sample.total.reads

  max.species.read = c(NA, sapply(data.use[,2:ncol], max))

  output = data.use

  # Set the suspected false positives to zero.
  for(i in 1:dim(output)[1]) {
      for(j in 2:dim(output)[2]) {
          output[i,j] = output[i,j] *
                        !( (output[i,j] <= threshold[i]) &
                           (output[i,j] <= tol * max.species.read[j])
                         )
      }
  }
  if(category) {
      output = bind_cols(output[,1], select(data, 2), output[,-1])
  }
  return(output)
}
