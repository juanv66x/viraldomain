# load required packages ----
if (!require("pacman")) install.packages("pacman") 
pacman::p_load(dplyr)

# clean data ----
sero <- read.csv(here::here("data-raw","sero.csv"))
sero = sero |>
#  transmute(cd_2022 = jitter(cd_2022), vl_2022 = jitter(vl_2022))
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
usethis::use_data(sero, overwrite = TRUE)