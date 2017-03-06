#' Function to remove empty variables and NAs
#' https://stackoverflow.com/questions/21530168/remove-columns-with-zero-values-from-a-dataframe
#' @param df = dataframe

remove_zero_cols <- function(df) {
    rem_vec <- NULL
    for(i in 1:ncol(df)){
        this_sum <- summary(df[,i])
        zero_test <- length(which(this_sum == 0))
        if(zero_test == 6) {
            rem_vec[i] <- names(df)[i]
        }
    }
    features_to_remove <- rem_vec[!is.na(rem_vec)]
    rem_ind <- which(names(df) %in% features_to_remove)
    df <- df[,-rem_ind]
    df<-df[colSums(!is.na(df)) > 0]
    return(df)
}