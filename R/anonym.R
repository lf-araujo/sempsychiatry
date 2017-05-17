#' Function to anonymize datasets so to create MWEs
#'
#' Is a function that easily anonymizes the dataset so to remove personal information identification. It is useful for the creation of minimal working examples allowing the researcher to to discuss the statistical findings with other colleagues without giving away sensitive information. Its advantage over the package anonimizer() is that it does a better job in keeping the variance and the relation between factors in the data. 
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
