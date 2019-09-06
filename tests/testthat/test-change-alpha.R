context("test-change_alpha.R")

test_that("change_alpha(small_example) calculations are correct", {
    expect_equal(change_alpha(small_example), small_example_change_alpha_result)
})

#test_that("false positives are correctly removed in big example", {
#    expect_equal(remove_false_pos(big_example), big_example_result)
#})
