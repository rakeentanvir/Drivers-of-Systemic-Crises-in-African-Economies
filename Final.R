# Install packages if you need to
install.packages(c("tidyverse", "fs", "countrycode"))

library(tidyverse)  # attaches purrr and readr
library(fs)
library(countrycode)


# https://www.gerkelab.com/blog/2018/09/import-directory-csv-purrr-readr/
data_dir = "Documents/GitHub/systemic_crises_africa_535_final/reference" # it might be different for you!
# fs::dir_ls() to see where your project working directory is
fs::dir_ls(data_dir)
csv_files <- fs::dir_ls(data_dir, regexp = "\\.csv$")
readr::read_csv(csv_files[1])

(df = csv_files %>% 
  map_dfr(
    read_csv,
    col_types = cols(
      "cc3" = col_factor(),
      "case" = col_integer(),
      "systemic_crisis"=col_logical(),
      "year" = col_integer()
    )
  )
)
