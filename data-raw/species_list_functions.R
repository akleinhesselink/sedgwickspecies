library(tidyverse)

get_species_list <- function(){
  # download species list from Calflora What Grows Here?
  url <- 'http://www.calflora.org/entry/wgh.html#srch=t&group=none&fmt=photo&inma=t&y=34.6927&x=-120.042&z=12&lpstr=t&lpom=d'

  species_list <- 'data-raw/raw_species_list.txt'

  species <-
    read_tsv(species_list) %>%
    separate( taxon, c('taxon', 'var') , sep = ' var. ') %>%
    separate( taxon, c('taxon', 'ssp.'), sep = ' ssp. ') %>%
    separate( taxon, c('genus', 'species'), remove = F) %>%
    separate( lifeform, c('life_history', 'form')) %>%
    mutate( status = str_extract(status, c('^native|non-native'))) %>%
    mutate( code = toupper( paste0( str_sub(genus, 1, 2), str_sub(species, 1,2))))

  return(species)
}


get_focal_species <- function(){
  focal_species <- 'data-raw/SedgwickTaxonomy/focalspecies.csv'
  focals <- read_csv(focal_species)
  return(focals)
}



