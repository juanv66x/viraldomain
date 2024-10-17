# load required packages ----
if (!require("pacman")) install.packages("pacman") 
pacman::p_load(dplyr, purrr)

# clean data ----
viral <- read.csv(here::here("data-raw","viral.csv"))
viral = viral |>
  # transmute(cd_2019 = jitter(cd_2019), vl_2019 = jitter(vl_2019),
  #           cd_2021 = jitter(cd_2021), vl_2021 = jitter(vl_2021),
  #           cd_2022 = jitter(cd_2022), vl_2022 = jitter(vl_2022))
  transmute(
    across(everything(), ~ {
      # Jitter the values, ensure they are greater than 1, and then make them unique
      values <- pmax(1, jitter(.x, amount = 10))
      unique_values <- unique(values)
      
      # While there are duplicates, add a small random value to duplicates
      while (length(unique_values) < length(values)) {
        duplicates <- values[duplicated(values)]
        for (duplicate in duplicates) {
          index <- which(values == duplicate)[1]
          values[index] <- values[index] + runif(1, 0.1, 5)  # Add a small random value to duplicates
        }
        unique_values <- unique(values)
      }
      return(values)
    })
  )

# write data in correct format to data folder ----
usethis::use_data(viral, overwrite = TRUE)