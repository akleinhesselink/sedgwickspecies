rm(list = ls())
library(tidyverse)

focal_species <-
  read_csv('data-raw/SedgwickTaxonomy/focalspecies.csv') %>%
  as.data.frame()

usethis::use_data(focal_species, overwrite = T)

