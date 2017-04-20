#' Function to anonymize datasets so to create MWEs
#'
#' This function takes a dataframe and creates a dummy dataset, but maintaining
#' sintactical relationships between the variables. This has been tested with
#' multivariate data and works.
#'
#' Source: https://www.jaredknowles.com/journal/2013/5/27/writing-a-minimal-working-example-mwe-in-r
#'
#' @param df = dataframe
#' @export
anonym <- function(df) {
    if (length(df) > 26) {
        LETTERS <- replicate(floor(length(df)/26), {
            LETTERS <- c(LETTERS, paste(LETTERS, LETTERS, sep = ""))
        })
    }
    names(df) <- paste(LETTERS[1:length(df)])

    level.id.df <- function(df) {
        level.id <- function(i) {
            if (class(df[, i]) == "factor" | class(df[, i]) == "character") {
                column <- paste(names(df)[i], as.numeric(as.factor(df[, i])),
                                sep = ".")
            } else if (is.numeric(df[, i])) {
                column <- df[, i]/mean(df[, i], na.rm = T)
            } else {
                column <- df[, i]
            }
            return(column)
        }
        DF <- data.frame(sapply(seq_along(df), level.id))
        names(DF) <- names(df)
        return(DF)
    }
    df <- level.id.df(df)
    return(df)
}
