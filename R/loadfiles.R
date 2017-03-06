#' A function to load required files in csv format
#'
#' Definition: This function is very specific for the data, but automates the
#' process of going into the /input directory (where all the stats files lies)
#' and import them into dataframes. It also removes the entries that are not
#' used in the study. In order for it to work one must have setted the working
#'  directory and added an /input subdirectory.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords csv plain text files
#' @examples
#' df <- loadFiles ()


loadFiles <- function(x){
    files <- list.files(path = x, recursive=T, full.names=T)
    for (i in files) {
        if (grepl("csv",i)) {
            stats <- read.csv(i)
        }
    }
    return(stats)
}
