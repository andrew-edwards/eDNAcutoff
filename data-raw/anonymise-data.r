# Anonymise the species and sample names in Davon's raw data and the simplified
#  data set, and simplify Davon's data set (remove Category_Sample_blank column).

big_example <- readr::read_csv("data-raw/data_for_andy.csv",
                               comment="#")

# Remove blank samples and the Category_Sample_blank column
big_example <- dplyr::filter(big_example, Category_Sample_blank != "b") %>%
    dplyr::select(-Category_Sample_blank)

# Anonymise and save
names(big_example) <- c("Sample", "m1", "m2", "m3", "m4",
                        1:(length(names(big_example))-5))
big_example$Sample = c("M", 1:(length(big_example$Sample)-1))

usethis::use_data(big_example, overwrite = TRUE)

# Do same for small example

small_example <- readr::read_csv("data-raw/data_manual_test.csv",
                               comment="#")

# Remove blank samples and the Category_Sample_blank column
small_example <- dplyr::select(small_example, -Category_Sample_blank)

# Anonymise and example
names(small_example) <- c("Sample", "m1", "m2", "m3", "m4",
                        1:(length(names(small_example))-5))
small_example$Sample <- c("M", 1:(length(small_example$Sample)-1))

usethis::use_data(small_example, overwrite = TRUE)

# Save here to then manually edit for expected result after using
#  remove_false_pos().  So if re-run this line then have to manually edit again.
# readr::write_csv(small_example, "data-raw/data_manual_test_result.csv")

small_example_result <- readr::read_csv("data-raw/data_manual_test_result.csv")

usethis::use_data(small_example_result, overwrite = TRUE)
