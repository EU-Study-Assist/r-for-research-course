install.packages("tidyverse")

install.packages("skimr")

install.packages("pacman")

library(pacman)

sessionInfo()

detach("package:pacman", unload = TRUE)
detach("package:ggplot2", unload = TRUE)
detach("package:tidyr", unload = TRUE)
remove.packages("dplyr")