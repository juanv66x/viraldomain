# load required packages ----
if (!require("pacman")) install.packages("pacman") 
pacman::p_load(dplyr)

# clean data ----
viral <- read.csv(here::here("data-raw","viral.csv"))
viral = viral |>
  transmute(cd_2019 = jitter(cd_2019), vl_2019 = jitter(vl_2019),
            cd_2021 = jitter(cd_2021), vl_2021 = jitter(vl_2021),
            cd_2022 = jitter(cd_2022), vl_2022 = jitter(vl_2022))

# write data in correct format to data folder ----
usethis::use_data(viral, overwrite = TRUE)