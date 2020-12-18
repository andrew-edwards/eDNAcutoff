# eDNAcutoff - an R package for detecting suspected false positives in eDNA samples

[![Travis-CI Build Status](https://travis-ci.com/andrew-edwards/eDNAcutoff.svg?branch=master)](https://travis-ci.com/andrew-edwards/eDNAcutoff)

Based on a manuscript in preparation.

Davon and Ben - you should be able to install and play around with it (providing the badge above says 'build' and then 'passing' in green, else it won't install). 

### Vignette

The vignette showing examples of the functions is available [here](http://htmlpreview.github.io/?https://github.com/andrew-edwards/eDNAcutoff/blob/master/doc/remove-false-positives.html), and directly in the package (see below).


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
