#' Function: trim.trailing(variable_name)
#'
#' Definition: Sometimes when files from SPSS are imported as dataframes to R,
#' or when one works with windows text files in linux some trailing whitespaces
#' creeps in. This function returns the same variable_name but without the
#' extra whitespaces. It only works for final whitespaces.
#'
#' Example: df$variable <- trim.trailing (otherdf$variable)
#'
#' Source: http://stackoverflow.com/a/2261149/4417072
#'
#' @param x = variable
#' @export


trim.trailing <- function (x) sub("\\s+$", "", x)