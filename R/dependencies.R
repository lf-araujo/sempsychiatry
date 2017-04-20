#' Function to load dependencies
#'
#' This function check for dependencies, if installed they are left as is,
#' otherwise they are installed
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
