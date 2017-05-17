#' Function used to load freesurfer data. 
#'
#' A function to load required files in csv format in any subdirectory given as argument. It allows the user to easily  import FreeSurfer csv parcellations and segmentations.The segmentations must be named aseg.allsegs, it will parse
#' all files with .table extension. It can manage segmentations
#' and parcellations.
#' @param x = directory
#' @export

loadFreeSurfer <- function(x){
    files <- list.files(path = x, recursive=T, full.names=T)
    for (i in files) {
        if (grepl(".table",i)) {
            if (grepl("aseg.allsegs",i)){
                aseg <- read.csv(i, header=T)
                colnames(aseg)[0] <- "subjectid"
            } else if (grepl("lh",i)){
                lh_aparc <- read.csv(i, header=T)
                colnames(lh_aparc)[0] <- "subjectid"
            } else if (grepl("rh",i)){
                rh_aparc <- read.csv(i, header=T)
                colnames(rh_aparc)[0] <- "subjectid"
            }
        }
    }
    finaldf <- full_join(aseg, lh_aparc,  by="subjectid")
    finaldf <- full_join(finaldf, rh_aparc,  by="subjectid")

    return(finaldf)
}
