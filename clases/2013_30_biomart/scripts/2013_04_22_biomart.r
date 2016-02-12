##2013_04_22_biomart.r
##2013-04-21 dmontaner@cipf.es
##Bioconductor biomaRt library usage example

##Start
rm (list = ls ())
R.version.string #"R version 3.0.0 RC (2013-03-26 r62418)"
library (biomaRt); packageDescription ("biomaRt", fields = "Version") #"2.16.0"
help (package = biomaRt)


##List of repositories
marts <- listMarts ()
class (marts)
colnames (marts)
sapply (marts, class)
marts[1:10,]


##Find Ensembl resources
grep ("ensembl", marts[,"biomart"], ignore.case = TRUE, value = "TRUE")
grep ("ensembl", marts[,"version"], ignore.case = TRUE, value = "TRUE")

ids1 <- grep ("ensembl", marts[,"biomart"], ignore.case = TRUE)
ids2 <- grep ("ensembl", marts[,"version"], ignore.case = TRUE)

ids1
ids2

setdiff (ids1, ids2)

ids <- sort (unique (c(ids1, ids2)))
ids

marts[ids,]



##Use ensembl ENSEMBL GENES
marts[1,]

mi.mart <- useMart ("ensembl")
class (mi.mart)
mi.mart


###Find Datasets in the repository
mis.datasets <- listDatasets (mi.mart)
class (mis.datasets)
colnames (mis.datasets)
mis.datasets[1:10,]


###Use the Human dataset
mi.mart2 <- useMart ("ensembl", dataset="hsapiens_gene_ensembl")
class (mi.mart2)
mi.mart2
mi.mart   ##OBS: Dataset was not set before


###Find Filters
filtros <- listFilters (mi.mart2)
class (filtros)
colnames (filtros)
filtros[1:10,]

grep ("affy ", filtros[,2], ignore.case = TRUE, value = TRUE)  ##Filter genes in the Affymetrix arrays
touse <- grep ("affy ", filtros[,2], ignore.case = TRUE)
touse
filtros[touse,]


###Attributes
at <- listAttributes (mi.mart2)
class (at)
dim (at)
at[1:3,]

##Find GO annotation attributes
grep ("go ", at[,2], ignore.case = TRUE, value = TRUE) ## the space is helpful
touse <- grep ("go ", at[,2], ignore.case = TRUE)
touse
at[touse,]


###QUERY: get GO terms for certain Affy ids
res <- getBM (attributes = c("affy_hg_u95av2", "go_id", "name_1006"),
              filters = "affy_hg_u95av2", values = c("1939_at", "1503_at", "1454_at"), mart = mi.mart2)
class (res)
dim (res)
res[1:3,]


###QUERY: get GO terms for certain Affy ids
res.all <- getBM (attributes = c("affy_hg_u95av2", "go_id", "name_1006"), mart = mi.mart2)
class (res.all)
dim (res.all)
res.all[1:3,]


###EXIT
warnings ()
sessionInfo ()
q ("no")
