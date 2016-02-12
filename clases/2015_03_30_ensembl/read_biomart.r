##read_biomart.r
##2015-03-30 dmontaner@cipf.es
##reading biomart matrices and comparing IDs

rm (list = ls ())
R.version.string ##"R version 3.1.3 (2015-03-09)"


## DATA
short <- read.table (file = "mart_export_short.txt", header = TRUE, sep = "\t", quote = "", as.is = TRUE)
dim (short)
sapply (short, class)
short[1:3,]

somat <- read.table (file = "mart_export_somatic_short.txt", header = TRUE, sep = "\t", quote = "", as.is = TRUE)
dim (somat)
sapply (somat, class)
somat[1:3,]


## find out common IDs
intersect (short[,"Variation.Name"], somat[,"Variation.Name"])
