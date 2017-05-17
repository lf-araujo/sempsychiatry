#' Function that appends descriptive stats with describe() 
# ' into a file, it does not overwrite previous information. 
#' 
#'
#' Useful in cases where one is working with a large number of
#' variables and needs to perform that several times to print
#' a report.
#' Originally from a question on SO: http://stackoverflow.com/a/43490045/4417072
#'
#' @param vars = variables to be described
#' @param filename = directory path
#' @export

write_descriptive_stats <- function ( vars, filename ) {
    for (i in names(vars)) {
        cat(paste0(i, "\n"), file=filename, append=TRUE)
        cat(capture.output(psych::describe(vars[,i])),
            file=filename, 
            sep="\n",append=TRUE)
    }
}
