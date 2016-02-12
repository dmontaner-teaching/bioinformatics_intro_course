##biomart_uniprot.r
##2015-06-11 dmontaner@cipf.es
##Download UniProt data using biomaRt 

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.2.0 (2015-04-16)"
library (biomaRt); packageDescription ("biomaRt", fields = "Version") #"2.24.0"
help (package = biomaRt)

options (width = 170)

###DATOS
setwd ("datos")

listMarts ()  ## lists the available BioMart databases

mimart <- useMart ("unimart")
mimart
listDatasets (mimart)

martdset <- useDataset (dataset = "uniprot", mart = mimart)
martdset

##' in a single step
martdset2 <- useMart ("unimart", dataset = "uniprot")
identical (martdset, martdset2)

listFilters (martdset)
listAttributes (martdset)

######################################

mart <- getBM (c ("protein_name", "protein_evidence", "gene_name"), 
               filters = "gene_name",
               values = c ("KRAS", "SMN1"),
               mart = martdset)
class (mart)
mart[1:3,]
