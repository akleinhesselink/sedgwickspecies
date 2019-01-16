library(tidyverse)
library(request)
get_species_list <- function(){
  # download species list from Calflora What Grows Here?
  url <- 'http://www.calflora.org/entry/wgh.html#srch=t&group=none&fmt=photo&inma=t&y=34.6927&x=-120.042&z=12&lpstr=t&lpom=d'

  species_list <- 'data-raw/raw_species_list.txt'
  naat <- 'data-raw/navarretia_atractyloides.txt'  # I add these to the species list to be consistent with lab
  erbo <- 'data-raw/erodium_botrys.txt'

  species <-
    bind_rows( read_tsv(species_list), read_tsv(naat), read_tsv(erbo)) %>%
    rename( 'calflora_taxon' = taxon) %>%
    mutate( calflora_binomial =
              str_replace_all(calflora_taxon, c('var\\..*' = '', 'ssp\\..*'=''))) %>%
    mutate( calflora_binomial = str_trim(calflora_binomial)) %>%
    mutate( life_history = str_extract(lifeform, '^[A-Za-z]+')) %>%
    mutate( form = str_extract( str_extract(lifeform, '[\\(A-Za-z\\)]+$'), '[A-Za-z]+'))  %>%
    mutate( status = str_extract(status, c('^native|non-native'))) %>%
    select( -bloom)

  return(species)
}


get_focal_species <- function(){
  focal_species <- 'data-raw/SedgwickTaxonomy/focalspecies.csv'
  focals <- read_csv(focal_species)
  return(focals)
}


root <- api("https://plantsdb.xyz")

get_USDA_symbol <- function(genus, species, db_root) {
  results <-
    try(
      db_root %>%
        api_path(search) %>%
        api_query_(Genus = genus, Species = species, fields = "Symbol")
      , silent = T)

  if(class(results) == 'try-error'){
    out <- NA
  }else{
    out <- results$data[[1]]$Symbol
  }

  return( out)
}


