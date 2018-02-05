rm(list = ls())
library(tidyverse)
source('data-raw/species_list_functions.R')
special_cases <- 'data-raw/special_cases.csv'
focal_species <- 'data-raw/SedgwickTaxonomy/focalspecies.csv'

species <- get_species_list()
special <- read_csv(special_cases)
focal <- read_csv(focal_species)

species <- left_join( species, special, by = 'taxon')

species <-
  species %>%
  mutate( taxon = ifelse(!is.na(synonym), synonym, taxon))

focal <-
  focal %>%
  mutate( focal_species = TRUE) %>%
  rename('taxon' = current_name)

species <-
  left_join(species, focal %>% select(taxon, prior_name, current_code, prior_code, focal_species), by = 'taxon')

devtools::use_data(species, overwrite = T)
