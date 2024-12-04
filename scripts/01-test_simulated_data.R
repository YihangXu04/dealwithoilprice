#### Preamble ####
# Purpose: Tests the structure and validity of the simulated dataset.
# Author: Yihang Xu
# Date: 3 Dec 2024
# Contact: joker.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` and 'testthat' package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `oil_in_two_vendors` rproj


#### Workspace setup ####
library(tidyverse)
library(testthat)

simulated_data <- read_csv("data/00-simulated_data/simulated_data.csv")

#### Test data ####

# Test that the dataset has 1000 rows
test_that("dataset has 1000 rows", {
  expect_equal(nrow(simulated_data), 1000)
})


# Test that the 'current_price' and 'old_price' columns are numeric types
test_that("'current_price' and 'old_price' are numeric", {
  expect_type(simulated_data$current_price, "double")
  expect_type(simulated_data$old_price, "double")
})

# Test that the 'vendor' column only contains values 'Galleria' and 'TandT'
test_that("'vendor' column only contains values 'Galleria' and 'TandT'", {
  predefined_vendors <- c("Galleria", "TandT")
  expect_true(all(simulated_data$vendor %in% predefined_vendors))
})

#Test that the 'month' column contains values from 6 to 12
test_that("Variable 'month' has unique values 6 to 12",{
  expect_true(all(simulated_data$month %in% 6:12))
})

