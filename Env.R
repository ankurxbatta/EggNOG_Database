# List of required packages for this course
pkg_list <- c("Gviz", "GenomicFeatures", "rtracklayer", "Biostrings", "tidyverse")

# Conditional installation and loading loop
invisible(lapply(pkg_list, function(pkg) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    message(paste("Installing", pkg, "..."))
    if (pkg %in% c("Gviz", "GenomicFeatures", "rtracklayer", "Biostrings")) {
      if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
      BiocManager::install(pkg, update = FALSE, ask = FALSE)
    } else {
      install.packages(pkg, repos = "[http://cran.us.r-project.org](http://cran.us.r-project.org)")
    }
    library(pkg, character.only = TRUE)
  } else {
    message(paste(pkg, "is already installed and loaded."))
  }
}))

