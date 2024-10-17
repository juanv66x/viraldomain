# load required packages ----
if (!require("pacman")) install.packages("pacman") 
pacman::p_load(dplyr, purrr)

# clean data ----
viral <- read.csv(here::here("data-raw","viral.csv"))
set.seed(123)
viral = viral |>
  # transmute(cd_2019 = jitter(cd_2019), vl_2019 = jitter(vl_2019),
  #           cd_2021 = jitter(cd_2021), vl_2021 = jitter(vl_2021),
  #           cd_2022 = jitter(cd_2022), vl_2022 = jitter(vl_2022))
  transmute(
    across(everything(), ~ {
      # Step 1: Jitter the values and ensure they are greater than 1
      values <- pmax(1, jitter(.x, amount = 10))
      
      # Step 2: Ensure uniqueness and handle potential duplicates
      unique_values <- unique(values)
      
      # Step 3: If duplicates exist, resolve by adding a random increment
      while (length(unique_values) < length(values)) {
        duplicates <- values[duplicated(values)]
        for (duplicate in duplicates) {
          index <- which(values == duplicate)[1]
          values[index] <- values[index] + runif(1, 0.01, 0.5)  # Add small increment to duplicates
        }
        unique_values <- unique(values)
      }
      
      # Step 4: If any value is exactly 1, add a small random increment
      values[values == 1] <- values[values == 1] + runif(sum(values == 1), 0.01, 0.5)
      
      return(values)
    })
  )

# write data in correct format to data folder ----
usethis::use_data(viral, overwrite = TRUE)