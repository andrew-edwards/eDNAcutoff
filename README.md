# eDNAcutoff - an R package for detecting suspected false positives in eDNA samples

[![Travis-CI Build Status](https://travis-ci.org/andrew-edwards/eDNAcutoff.svg?branch=master)](https://travis-ci.org/andrew-edwards/eDNAcutoff)

Not operational yet. Based on a manuscript in preparation.

Davon and Ben - you should be able to install and play around with it (providing the badge above says 'build' and then 'passing' in green, else it won't install). 

### To install from GitHub

You need the package `devtools`, so you need to install it once:
```
install.packages("devtools")
```

This enables installation directly from the GitHub site:

```
devtools::install_github("andrew-edwards/eDNAcutoff", build_vignettes = TRUE)
library(eDNAcutoff)
```

Then try

```
vignette("remove-false-positives", package="eDNAcutoff")
```

which should show the vignette in an html browser.

It's hard for me to test a clean build, so make an Issue on this repo to let me know if it's working. I'm not convinced that it will.

There's also a way to extract just the R code from the vignette that I'll look into. And also copy some of the results here to show what the package does so far. 
