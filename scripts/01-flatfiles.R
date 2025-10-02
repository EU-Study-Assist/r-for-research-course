# install.packages(tidyverse)
library(tidyverse)

read_table("data/adult_names/adult.data", col_names = FALSE) |>
  set_names(
    "age", "workclass", "fnlwgt", "education",
    "education_num", "marital_status", "occupation",
    "relationship", "race", "sex", "capital_gain",
    "capital_loss", "hours_per_week", "native_country",
    "lob_prob"
  ) |>
  select(-lob_prob) |>
  write_tsv("data/flatfiles/adult_names.txt")


read_table("data/adult_names/adult.test", col_names = FALSE)

read_delim("data/flatfiles/plot_11_tvol.txt")
