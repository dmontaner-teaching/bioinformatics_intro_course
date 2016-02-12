##biomart_uniprot.r
##2015-06-11 dmontaner@cipf.es
##Download UniProt data uisng biomaRt 

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.2.0 (2015-04-16)"
library (UniProt.ws); packageDescription ("biomaRt", fields = "Version") #"2.24.0"
help (package = UniProt.ws)

options (width = 170)

###DATOS
setwd ("datos")


### R code from vignette source 'vignettes/UniProt.ws/inst/doc/UniProt.ws.Rnw'

###################################################
### code chunk number 1: loadPkg
###################################################
library(UniProt.ws)
up <- UniProt.ws(taxId=9606)


###################################################
### code chunk number 2: help (eval = FALSE)
###################################################
## help("UniProt.ws")


###################################################
### code chunk number 3: show
###################################################
up


###################################################
### code chunk number 4: availSpecies
###################################################
availableUniprotSpecies(pattern="musculus")


###################################################
### code chunk number 5: setTaxID
###################################################
mouseUp <- UniProt.ws(10090)
mouseUp


class (mouseUp)


###################################################
### code chunk number 6: columns
###################################################
head(keytypes(up))
keytypes(up)


###################################################
### code chunk number 7: keytypes
###################################################
columns(up)


###################################################
### code chunk number 8: keys (eval = FALSE)
###################################################
## egs = keys(up, "ENTREZ_GENE")


###################################################
### code chunk number 9: select
###################################################
keys <- c("1","2")
columns <- c("PDB","UNIGENE","SEQUENCE","ENSEMBL")
kt <- "ENTREZ_GENE"
res <- select(up, keys, columns, kt)
res

head(res)







Examples:

     ## Make a UniProt.ws object
     up <- UniProt.ws(taxId=9606)
     
     ## look at the object
     up
     
     ## get the current species
     species(up)
     
     ## look up available species with their tax ids
     availableUniprotSpecies("musculus")
     
     ## get the current taxId
     taxId(up)
     
     ## look up the species that goes with a tax id
     lookupUniprotSpeciesFromTaxId(9606)
     
     ## set the taxId to something else
     taxId(up) <- 10090
     up
     
     ## list the possible key types
     head(keytypes(up))
     
     ## list the columns that can be retreived
     head(columns(up))
     
     ## list all possible keys of type entrez gene ID.
     ## (this process is not instantaneous)
     if(interactive()){
       egs = keys(up, "ENTREZ_GENE")
     }
     
     ## use select to extract some data
       keys <- c("22627","22629")
       columns <- c("PDB","UNIGENE","SEQUENCE")
       kt <- "ENTREZ_GENE"
       res <- select(up, keys, columns, kt)
       head(res)
     












###EXIT
warnings ()
sessionInfo ()
q ("no")
