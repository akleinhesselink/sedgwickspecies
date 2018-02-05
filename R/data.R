#' Sedgwick species names
#'
#' A dataframe with all the species recorded at Sedgwick based on the Calflora
#' species occurence data. Also flags focal whether species are focal species
#' in the experiments conducted by Levine, HilleRisLambers, Godoy, Kraft and
#' others.
#'
#' @format A data frame with 732 rows and 17 variables:
#' \describe{
#'   \item{taxon}{species and genus}
#'   \item{genus}{genus}
#'   \item{species}{species}
#'   \item{ssp.}{subspecies}
#'   \item{var}{intraspecific variety}
#'   \item{common}{common name}
#'   \item{life_history}{annual or perennial}
#'   \item{form}{growth form, herb or grass etc.}
#'   \item{status}{native or non-native}
#'   \item{family}{family}
#'   \item{bloom}{bloom period, months}
#'   \item{code}{four letter code of first two letters of genus and species}
#'   \item{synonym}{hand coded synonym for taxa for which the calflora name is not widely recognized}
#'   \item{prior_name}{prior name used by Levine et al.}
#'   \item{current_code}{current code used by Levine et al.}
#'   \item{prior_code}{prior code used by Levine et al.}
#'   \item{focal_species}{Logical, whether this was used as a focal species in previous research by Levine et al.}
#' }
#' @source \url{http://www.calflora.org/entry/wgh.html#srch=t&group=none&fmt=photo&inma=t&y=34.6927&x=-120.042&z=12&lpstr=t&lpom=d}
"species"