##' @title Loops over values of alpha -- **needs tidying up**
##'
##' @description Removes false positives for various values of the tolerance parameter alpha
##' @param data As for remove_false_pos()
##' @param alpha.vec Vector of alpha (tolerance) values over which to run remove_false_pos().
##' @param mN Total number of mock species.
##' @return List consisting of:
##'    ***:  list of dataframes, one for each result of the corresponding
##'    value of alpha;
##'    num.zeroed: vector corresponding to the number of reads set to zero for each value of alphavec;
##'    num.mock.sp.left: ***
##'    num.samp.with.mock: ***
##' @author Andrew Edwards
change_alpha = function(data, alpha.vec = seq(0, 1, 0.1), mN = 4) {

  N <- length(alpha.vec)
  out.list = list()       # Will be a list of dataframes, each being the result for
                        #  the corresponding value of alpha.vec
  num.removed = vector(length = N)  # Try vector(length = length(alpha.vec))
  num.mock.sp.left = vector(length = N)
  num.samp.rem.with.mock.sp = vector(length = N)

  for(i in 1:N)
    {
      out.list[[i]] = remove_false_pos(data, mN = mN, alpha = alpha.vec[i])
      diff = which_set_to_zero(data, out.list[[i]])

      num.removed[i] = sum(as.vector(diff) > 0,
                           na.rm = TRUE)    # CHECK doesn't give warnings
      mock.sp.out = out.list[[i]][2:dim(out.list[[i]])[1], 2:(mN + 1)]
        # just mock species in non-mock samples. **assumes one mock sample
      # num.mock.sp.removed[i] = sum(as.vector(mock.sp.rem) > 0)
      num.mock.sp.left[i] = sum(as.vector(mock.sp.out > 0))
      num.samp.rem.with.mock.sp[i] = sum(rowSums(mock.sp.out) > 0)
    }
  return(list(out.list = out.list,
              num.removed = num.removed,
              num.mock.sp.left = num.mock.sp.left,
              num.samp.rem.with.mock.sp = num.samp.rem.with.mock.sp))
}
