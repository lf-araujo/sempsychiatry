#' Function to perform transformation
#'
#' Description: A function to perform transformation to the data. The transformation it performs is a simple division by one thousand to the numeric variables sent as argument. If the vector is passed it applies the transformation to all variables in the dataframe.
#' Source: http://stackoverflow.com/a/36912017/4417072
#'
#' @param dataframe = dataframe
#' @param optional = vectorListOfVariables
#' @export



transformDivideThousand <- function(data_frame, listofvars){
    if (missing(listofvars)) {
        data_frame[, sapply(data_frame, is.numeric)] =
            data_frame[, sapply(data_frame, is.numeric)]/1000
    } else {
        for (i in names(data_frame)) {
            if (i %in% listofvars) {
                data_frame[,i] = data_frame[,i]/1000
            }
        }
    }
    return(data_frame)
}
