#! /usr/local/bin/Rscript --vanilla

##z_make.r
##2014-03-31 dmontaner@cipf.es
##Runs spin using knitr

## NOTE: the scripts are executed one after the other one.
##       The environment is not cleaned up.
##       The q() command at the end of the scripts ends the process.

## NOTE: spin does not stop with errors 

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.0.2 (2013-09-25)"
library (knitr); packageDescription ("knitr", fields = "Version") #"1.5"
##help (package = knitr)

opts_chunk$set (comment = ">")   ## symbol preceding the R output

## clear figure dir
unlink (opts_chunk$get ("fig.path"), recursive = TRUE)

### FILES TO COMPILE:
dir ()

bases <- c ("propagate_gene_ontology")

for (base in bases) {
    print (base)

    rm (list = setdiff (ls (), c("base", "bases")))  

    unlink (paste0 (base, ".html"))
    spin   (paste0 (base, ".r"), doc = "^##+'[ ]?")  ## double has plus quote instead of single has plus quote is used to indicate md/text chunks (as in roxygen doc. using emacs)
    unlink (paste0 (base, ".md"))
    unlink (paste0 (base, ".Rmd"))
}


###EXIT
warnings ()
sessionInfo ()
q ("no")
