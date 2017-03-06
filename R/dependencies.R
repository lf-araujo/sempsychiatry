#' Function to load dependencies
#'
#' This function check for dependencies, if installed they are left as is, 
#' otherwise they are installed
#' @param Conjunction of packages to check
#' @keywords packages installation
#' @examples
#' dependencies(c("dplyr", "memisc"))


dependencies <- function(dep){
    for (i in dep){
        ifelse (i %in% installed.packages(), library(i, character.only=TRUE),
                {
                    install.packages(x)
                    install.packages(i)
                })
    }
}