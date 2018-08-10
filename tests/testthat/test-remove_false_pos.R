context("test-remove_false_pos.R")

test_that("false positives are correctly removed in small example", {
    expect_equal(remove_false_pos(small_example), small_example_result)
})
