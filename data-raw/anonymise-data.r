# Anonymise the species and sample names in Davon's raw data and the simplified
#  data set, and simplify Davon's data set (remove Category_Sample_blank column).

big_example <- readr::read_csv("data-raw/data_for_andy.csv",
                               comment="#")

# Remove blank samples and the Category_Sample_blank column
big_example <- dplyr::filter(big_example, Category_Sample_blank != "b") %>%
    dplyr::select(-Category_Sample_blank)

# Anonymise
names(big_example) <- c("Sample", "m1", "m2", "m3", "m4",
                        1:(length(names(big_example))-5))
big_example$Sample = c("M", 1:(length(big_example$Sample)-1))

usethis::use_data(big_example, overwrite = TRUE)


# From Sean's course:
survey_dat <- readr::read_csv("data-raw/petrale-qcs-survey.csv")
# survey_dat <- readr::read_csv("petrale-qcs-survey.csv")
usethis::use_data(survey_dat, overwrite = TRUE)


small_example <- readr::read_csv("data-raw/data_manual_test.csv",
                               comment="#")

# Remove blank samples and the Category_Sample_blank column
small_example <- dplyr::select(small_example, -Category_Sample_blank)

# Anonymise
names(small_example) <- c("Sample", "m1", "m2", "m3", "m4",
                        1:(length(names(small_example))-5))
small_example$Sample = c("M", 1:(length(small_example$Sample)-1))

usethis::use_data(small_example, overwrite = TRUE)
