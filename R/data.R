#' Sedgwick species names
#'
#' A dataframe with all the species recorded at Sedgwick based on the Calflora
#' species occurence data. Also flags focal whether species are focal species
#' in the experiments conducted by Levine, HilleRisLambers, Godoy, Kraft and
#' others.
#'
#' @format A data frame with 612 rows and 15 variables:
#' \describe{
#'   \item{calflora_binomial}{scientific binomial, genus, species from Calflora}
#'   \item{common}{common name}
#'   \item{status}{native or non-native}
#'   \item{family}{family}
#'   \item{life_history}{annual or perennial}
#'   \item{form}{growth form, herb or grass etc.}
#'   \item{synonym}{hand coded synonym for taxa for which the Calflora name is not widely recognized}
#'   \item{standard_binomial}{standard scientific binomial}
#'   \item{genus}{genus from standard binomial}
#'   \item{species}{species from standard binomial}
#'   \item{prior_name}{prior name used by Levine et al.}
#'   \item{current_code}{current code used by Levine et al.}
#'   \item{prior_code}{prior code used by Levine et al.}
#'   \item{focal_species}{Logical, whether this was used as a focal species in previous research by Levine et al.}
#'   \item{USDA_symbol}{standard code from the USDA plants database, codes for the basic species are used rather than codes for particular subspecies or varieties}
#' }
#' @source \url{http://www.calflora.org/entry/wgh.html#srch=t&group=none&fmt=photo&inma=t&y=34.6927&x=-120.042&z=12&lpstr=t&lpom=d}
"sedgwick_plants"

#' Focal species names and publication history
#'
#' A dataframe with all the annual plant species used in experiments by
#' Levine, HilleRisLambers, Godoy, Kraft and others. Includes past names used
#' and currently revised names. Dataframe is taken directly from the
#' SedgwickTaxonomy project by Will Petry.
#'
#' @format A data frame with 29 rows and 14 variables:
#' \describe{
#'   \item{prior_code}{four letter code, first two of genus and first two of species, used in previous publications}
#'   \item{prior_name}{prior scientific name}
#'   \item{prior_native}{prior classification as native or non-native}
#'   \item{current_code}{revised code}
#'   \item{current_name}{revised scientific name}
#'   \item{current_native}{revised classification as native or non-native}
#'   \item{family}{family}
#'   \item{reason_updated}{notes on revision}
#'   \item{Levine_HilleRisLambers_2009_Nature}{included in this paper}
#'   \item{Godoy_Levine_2014_Ecology}{included in this paper}
#'   \item{Godoy_etal_2014_EcolLett}{included in this paper}
#'   \item{Kraft_etal_2015_PNAS}{included in this paper}
#'   \item{Godoy_etal_2017_Ecology}{included in this paper}
#'   \item{Saavedra_etal_2017_EcolMono}{included in this paper}
#' }
#' @source \url{https://github.com/wpetry/SedgwickTaxonomy}
"focal_species"
