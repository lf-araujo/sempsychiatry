#' Function to load dependencies
#'
#' This function can be used to load all packages required to SEM data analysis. One can pass package names as arguments and if these are not installed, they are download and installed. If they are in the system, they are not updated. The reason for this function is that updating packages can cause incompatibilities over time, as statistical packages are quickly updated by their owners. This approach makes sure to maintain the base installation as stable as possible.
#' @param Conjunction of packages to check
#' @keywords packages installation
#' @export

dependencies <- function(dep){
    for (i in dep){
        if (i %in% installed.packages()){
        	library(i, character.only=TRUE)
        } else {
        	install.packages(i)
        	library(i, character.only=TRUE)
        }
    }
}
