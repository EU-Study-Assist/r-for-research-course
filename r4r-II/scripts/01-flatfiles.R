# Importing TXT Files



library(tidyverse)

read_table("r4r-II/data/adult_names/adult.data", col_names = FALSE) |>
  set_names(
    "age", "workclass", "fnlwgt",
    "education", "education-num",
    "marital_status", "occupation", "relationship",
    "race", "sex", "capital_gain", "capital_loss",
    "hours_per_week", "native_country", "lab_prob"
  ) |>
  select(-lab_prob) |>
  write_tsv("r4r-II/data/flatfiles/adult_data.txt")

read_tsv("r4r-II/data/flatfiles/adult_data.txt")
