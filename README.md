[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.582898.svg)](https://doi.org/10.5281/zenodo.582898)


# sempsychiatry

Set of utilities for data analysis of neuroimaging and genetic data with SEM.

`anonym()`: Is a function that easily anonymizes the dataset so to remove personal information identification. It is useful for the creation of minimal working examples allowing the researcher to discuss the statistical findings with other colleagues without giving away sensitive information. Its advantage over the package `anonimizer()` is that it does a better job in keeping the variance and the relation between factors in the data. 

`dependencies()`: This function can be used to load all packages required to SEM data analysis. One can pass package names as arguments and if these are not installed, they are download and installed. If they are in the system, they are not updated. The reason for this function is that updating packages can cause incompatibilities over time, as statistical packages are quickly updated by their owners. This approach makes sure to maintain the base installation as stable as possible.

`genotypestoordinals()`: Utility that takes variables containing minor and heteropositions for genotypes and convert these to a single ordinal variable. The new variable will contain zero if none of the alleles are present, one for heterozygous and two for homozygous.

`loadFreeSurfer()`: A function to load required files in csv format in any subdirectory given as argument. It allows the user to easily import FreeSurfer csv parcellations and segmentations.

`remove_zero_cols()`: A function to remove empty variables that might have ended up in the dataset after concatenating data.


`transformDivideThousand()`: A function to perform transformation to the data. The transformation it performs is a simple division by one thousand to the numeric variables sent as argument. In the case a vector is passed, it applies the transformation to all variables in the vector.

`write_descriptive_stats()`: Function that appends descriptive statistics information in a file by further using the function `describe()`, it does not overwrite previous information.  Useful in cases where one is working with numerous variables and needs to print descriptive statistical information for these.

Finally, the sempsychiatry package can be installed and loaded with three simple lines of code (@lst:sempsy).

```{.r .numberLines #lst:sempsy}
library(devtools)
install_github("lf-araujo/sempsychiatry")
library("sempsychiatry")
```
Above is the code to install and load the sempsychiatry package for the SEM analyses below. After the first run, only the last line is actually required.
<!--  -->

Cite with:

- Castro-de-Araujo, LFS. (2017) sempsychiatry: utilities for SEM analyses in psychiatry and psychology. doi: https://doi.org/10.5281/zenodo.582898
