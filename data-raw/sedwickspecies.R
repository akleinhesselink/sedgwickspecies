rm(list = ls())
library(tidyverse)
library(stringr)
source('data-raw/species_list_functions.R')
synonyms <- 'data-raw/synonyms.csv'
hyphenated <- 'data-raw/hyphenated_taxa.csv'
focal <- 'data-raw/SedgwickTaxonomy/focalspecies.csv'

sedgwick_plants <- get_species_list()
synonyms <- read_csv(synonyms)
focal <- read_csv(focal)
hyphenated <- read_csv(hyphenated)

##### Remove subspecies and vars and then remove duplicate entries per species ########
sedgwick_plants <-
  sedgwick_plants %>%
  select(-calflora_taxon) %>%
  select(calflora_binomial, common:family, life_history, form, -lifeform) %>%
  distinct() %>%
  group_by( calflora_binomial ) %>%
  filter( row_number() == 1)
########################################################################################


sedgwick_plants <- left_join( sedgwick_plants, synonyms, by = "calflora_binomial")

sedgwick_plants <-
  sedgwick_plants %>%
  mutate( standard_binomial = ifelse(is.na(synonym), calflora_binomial, synonym))

focal <-
  focal %>%
  mutate( focal_species = TRUE) %>%
  mutate(standard_binomial = current_name) %>%
  mutate(standard_binomial = str_replace_all(standard_binomial, 'Acmispon', 'Lotus'))

sedgwick_plants <-
  sedgwick_plants %>%
  full_join(focal %>% select(standard_binomial, prior_name, current_code, prior_code, focal_species), by = 'standard_binomial') %>%
  separate( standard_binomial, c('genus', 'species'), sep = ' ', remove = F)

sedgwick_plants$USDA_symbol <-
  mapply(x= sedgwick_plants$genus, y=sedgwick_plants$species,
         FUN = function(x,y) { get_USDA_symbol(x,y,db_root = root) })

sedgwick_plants <-
  sedgwick_plants %>%
  left_join(hyphenated, by = 'standard_binomial') %>%
  mutate(USDA_symbol = ifelse(is.na(USDA_symbol.x),
                              USDA_symbol.y,
                              USDA_symbol.x)) %>%
  select( -USDA_symbol.x, -USDA_symbol.y) %>%
  as.data.frame()


sedgwick_plants$prior_code[ sedgwick_plants$USDA_symbol == 'ERMO7'] <- NA
sedgwick_plants$prior_name[ sedgwick_plants$USDA_symbol == 'ERMO7'] <- NA

sedgwick_plants$prior_code[ sedgwick_plants$USDA_symbol == 'ERBO'] <- 'ERBO'
sedgwick_plants$prior_name[ sedgwick_plants$USDA_symbol == 'ERBO'] <- 'Erodium botrys'


usethis::use_data(sedgwick_plants, overwrite = T)
