#' Definition: Utility that takes variables containing minor and heteropositions for genotypes and convert these to a single ordinal variable. The new variable will contain zero if none of the alleles are present, one for heterozygous and two for homozygous.
#' @export
genotypesToOrdinals <- function(variables, data){
    rowSums( data[, c(paste0(variables, c("_minorpos", "_heteropos")))] )
}
