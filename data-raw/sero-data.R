# load required packages ----
if (!require("pacman")) install.packages("pacman") 
pacman::p_load(dplyr)

# clean data ----
sero <- read.csv(here::here("data-raw","sero.csv"))
sero = sero |>
  transmute(cd_2022 = jitter(cd_2022), vl_2022 = jitter(vl_2022))

# write data in correct format to data folder ----
usethis::use_data(sero, overwrite = TRUE)