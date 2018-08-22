context("test-which_set_to_zero.R")

test_that("removed reads are correctly demonstrated by which_set_to_zero()
           for small example ", {
           expect_equal(which_set_to_zero(small_example, remove_false_pos(small_example)),
                                              small_example_zeros)
})

test_that("removed reads are correctly demonstrated by which_set_to_zero()
           for big example ", {
           expect_equal(which_set_to_zero(big_example, remove_false_pos(big_example)),
                                              big_example_zeros)
})
