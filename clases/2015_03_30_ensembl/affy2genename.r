##affy2genename.r
##2015-03-30 dmontaner@cipf.es
##Convert Affymetrix IDs to Gene Name using BioMart information.

rm (list = ls ())
R.version.string ##"R version 3.1.3 (2015-03-09)"


## DATA form GEO:
## ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE35nnn/GSE35972/matrix/GSE35972_series_matrix.txt.gz
datos <- read.table (file = "GSE35972_series_matrix.txt", header = TRUE, sep = "\t", as.is = TRUE, comment.char = "!", row.names = 1)
dim (datos)
sapply (datos, class)

boxplot (datos, las = 3)

colnames (datos)
rownames (datos)[1:10]

datos[1:10,]


################################################################################


## ANNOTATION from Ensembl BioMart
ids <- read.table (file = "mart_export_affy2hgnc.txt", header = TRUE, sep = "\t", quote = "", as.is = TRUE)
dim (ids)
sapply (ids, class)
ids[1:3,]

table (duplicated (ids))  ## OK no duplicates

ids <- ids[, c ("Affy.HG.U133.PLUS.2.probeset", "HGNC.symbol")]
dim (ids)
ids[1:3,]

table (duplicated (ids)) ## WHY ???
ids <- unique  (ids)
table (duplicated (ids)) ## OK

table (ids == "")
buenos <- (ids[,"Affy.HG.U133.PLUS.2.probeset"] != "") & (ids[,"HGNC.symbol"] != "")
table (buenos)
ids <- ids[buenos,]
dim (ids)

table (duplicated (ids[,"Affy.HG.U133.PLUS.2.probeset"])) ## WHY ???
ids[1:10,]


##Eliminate Affy IDs that match to several genes
dup <- duplicated (ids[,"Affy.HG.U133.PLUS.2.probeset"])
multiple <- ids[dup, "Affy.HG.U133.PLUS.2.probeset"]
multiple[1:3]
malos <- ids[,"Affy.HG.U133.PLUS.2.probeset"] %in% multiple
table (malos)
ids <- ids[!malos,]
dim (ids)
ids[1:10,]


################################################################################

## Find out how many IDs form GEO are in Ensembl
inEnsembl <- rownames (datos) %in% ids[,"Affy.HG.U133.PLUS.2.probeset"]
table (inEnsembl)

## Keep just those genes
datos <- datos[inEnsembl,]

## ID conversion 'dictionary'
affy2gen <- ids[,"HGNC.symbol"]
names (affy2gen) <- ids[,"Affy.HG.U133.PLUS.2.probeset"]
affy2gen[1:10]

datos[1:10,]

rownames (datos) <- affy2gen[rownames (datos)]  ## ERROR due to duplicates

datos <- as.matrix (datos)

rownames (datos) <- affy2gen[rownames (datos)]

datos[1:3,]

################################################################################

## SAVE A TEXT FILE (csv)
write.csv (datos, file = "convertidos.csv")
