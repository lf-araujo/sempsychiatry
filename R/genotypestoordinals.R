# Utility to convert from minor and hetero to an ordinal variable to be used
# in the SEM
#' @export
genotypesToOrdinals <- function(variables, data){
    rowSums( data[, c(paste0(variables, c("_minorpos", "_heteropos")))] )
}
