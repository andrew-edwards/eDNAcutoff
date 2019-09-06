##' @title Loops over values of alpha -- **needs tidying up**
##'
##' @description Removes false positives for various values of the tolerance parameter alpha
##' @param data As for remove_false_pos()
##' @param alpha_vec Vector of alpha (tolerance) values over which to run remove_false_pos().
##' @param aT Total number of absent species.
##' @return List consisting of:
##'    ***:  list of dataframes, one for each result of the corresponding
##'    value of alpha;
##'    num_zeroed: vector corresponding to the number of reads set to zero for each value of alphavec;
##'    num_mock_sp_left: ***
##'    num_samp_with_mock: ***
##' @author Andrew Edwards
##' @export
change_alpha = function(data, alpha_vec = seq(0, 1, 0.1), aT = 4) {

  N <- length(alpha_vec)
  out_list = list()       # Will be a list of dataframes, each being the result for
                          #  the corresponding value of alpha_vec
  num_zeroed = vector(length = N)  # Try vector(length = length(alpha_vec))
  num_mock_sp_left = vector(length = N)
  num_samp_rem_with_mock_sp = vector(length = N)

  for(i in 1:N)
    {
      out_list[[i]] = remove_false_pos(data, aT = aT, alpha = alpha_vec[i])
      diff = which_set_to_zero(data, out_list[[i]])

      num_zeroed[i] = sum(as.vector(diff) > 0,
                           na.rm = TRUE)    # CHECK doesn't give warnings
      mock_sp_out = out_list[[i]][2:dim(out_list[[i]])[1], 2:(aT + 1)]
        # just absent species in non-mock samples. **assumes one mock sample
      # num_mock_sp_zeroed[i] = sum(as.vector(mock_sp_rem) > 0)
      num_mock_sp_left[i] = sum(as.vector(mock_sp_out > 0))
      num_samp_rem_with_mock_sp[i] = sum(rowSums(mock_sp_out) > 0)
    }
  return(list(out_list = out_list,
              num_zeroed = num_zeroed,
              num_mock_sp_left = num_mock_sp_left,
              num_samp_rem_with_mock_sp = num_samp_rem_with_mock_sp))
}
