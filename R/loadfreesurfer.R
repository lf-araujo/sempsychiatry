#' Function used to load freesurfer data.
#'
#' The segmentations must be named aseg.allsegs
#' @param x = directory


loadFreeSurfer <- function(x){
    files <- list.files(path = x, recursive=T, full.names=T)
    for (i in files) {
        if (grepl("aseg.allsegs",i)){
            aseg <- read.table(i, header=T)
            colnames(aseg)[1] <- "subjectid"
        } else if (grepl("lh",i)){
            lh_aparc <- read.table(i, header=T)
            colnames(lh_aparc)[1] <- "subjectid"
        } else if (grepl("rh",i)){
            rh_aparc <- read.table(i, header=T)
            colnames(rh_aparc)[1] <- "subjectid"
        }
    }
    finaldf <- full_join(aseg, lh_aparc,  by="subjectid")
    finaldf <- full_join(finaldf, rh_aparc,  by="subjectid")

    return(finaldf)
}