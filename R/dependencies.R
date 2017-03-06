dependencies <- function(dep){
    for (i in dep){
        ifelse (i %in% installed.packages(), library(i, character.only=TRUE),
                {
                    install.packages(x)
                    install.packages(i)
                })
    }
}