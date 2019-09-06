## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6
)

## ------------------------------------------------------------------------
library(eDNAcutoff)

## ---- echo=TRUE, results='asis', eval=FALSE------------------------------
#  small_example

## ---- echo=FALSE, results='asis'-----------------------------------------
# kable() is to display the results for vignette, but the chunk above is what you
#  would run in command line. Thus most chunks here are repeated to format the output
#  better in the vignette.
knitr::kable(small_example)

## ---- echo=TRUE, results='asis', eval=FALSE------------------------------
#  small_removed <- remove_false_pos(small_example)
#  small_removed

## ---- echo=FALSE, results='asis'-----------------------------------------
small_removed <- remove_false_pos(small_example)
knitr::kable(small_removed)

## ---- echo=TRUE, results='asis', eval=FALSE------------------------------
#  small_set_to_zero <- which_set_to_zero(small_example, small_removed)
#  small_set_to_zero

## ---- echo=FALSE, results='asis'-----------------------------------------
small_set_to_zero <- which_set_to_zero(small_example, small_removed)
knitr::kable(small_set_to_zero)

## ---- echo=TRUE, results='asis'------------------------------------------
alpha_values <- c(0.01, seq(0.1, 1, 0.1))
small_sens_alpha <- change_alpha(small_example, alpha_vec = alpha_values)

## ---- echo=TRUE----------------------------------------------------------
small_sens_alpha$num_zeroed
plot(alpha_values, small_sens_alpha$num_zeroed,
     type = "o",
     col = "red",
     xlab = "Tolerance level",
     ylab = "Number of reads set to zero",
     ylim = c(0, max(small_sens_alpha$num_zeroed))
    )

## ---- echo=TRUE----------------------------------------------------------
small_sens_alpha$num_mock_sp_left

## ---- echo=TRUE----------------------------------------------------------
small_sens_alpha$num_samp_rem_with_mock_sp

## ---- echo=TRUE----------------------------------------------------------
alpha_values[6]

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  small_sens_alpha$out_list[[6]]

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(small_sens_alpha$out_list[[6]])

## ---- echo=TRUE----------------------------------------------------------
alpha_values[7]

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  small_sens_alpha$out_list[[7]]

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(small_sens_alpha$out_list[[7]])

## ---- echo=TRUE, results='asis', eval=FALSE------------------------------
#  big_example

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(big_example)

## ---- echo=TRUE, results='asis', eval=FALSE------------------------------
#  big_removed <- remove_false_pos(big_example)
#  big_removed

## ---- echo=FALSE, results='asis'-----------------------------------------
big_removed <- remove_false_pos(big_example)
knitr::kable(big_removed)

## ---- echo=TRUE, results='asis', eval=FALSE------------------------------
#  big_set_to_zero <- which_set_to_zero(big_example, big_removed)
#  big_set_to_zero

## ---- echo=FALSE, results='asis'-----------------------------------------
big_set_to_zero <- which_set_to_zero(big_example, big_removed)
knitr::kable(big_set_to_zero)

## ---- echo=TRUE, results='asis'------------------------------------------
big_sens_alpha <- change_alpha(big_example, alpha_vec = alpha_values)

## ---- echo=TRUE----------------------------------------------------------
big_sens_alpha$num_zeroed
plot(alpha_values, big_sens_alpha$num_zeroed,
     type = "o",
     col = "red",
     xlab = "Tolerance level",
     ylab = "Number of reads set to zero",
     ylim = c(400, max(big_sens_alpha$num_zeroed))
    )

## ---- echo=TRUE----------------------------------------------------------
big_sens_alpha$num_mock_sp_left

## ---- echo=TRUE----------------------------------------------------------
big_sens_alpha$num_samp_rem_with_mock_sp

