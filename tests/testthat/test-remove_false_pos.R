context("test-remove_false_pos.R")

test_that("false positives are correctly removed in small example", {
    expect_equal(remove_false_pos(small_example), small_example_result)
})

test_that("false positives are correctly removed in big example", {
    expect_equal(remove_false_pos(big_example), big_example_result)
})

