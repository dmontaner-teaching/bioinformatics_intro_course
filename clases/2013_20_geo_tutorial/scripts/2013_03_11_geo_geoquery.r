##geo_geoquery.r
##2013-03-03 dmontaner@cipf.es
##GEOquery library example

##Tested using GEOquery Version: "2.25.0"

###Using data from GEO Series GSE37761
## http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE37761


###Clear working environment and load library
rm (list = ls ())
library (GEOquery); packageDescription ("GEOquery", fields = "Version") #"2.25.0"
help (package = GEOquery)


###Download the desired series
datos <- getGEO ("GSE37761")

###Save so you don't need to download them again if the session is closed
save (datos, file = "geo_down.RData")

###Use this if you need to reload the data again
## rm (list = ls ())
## load ("geo_down.RData")


###The data are wrapped in a list
class (datos)
length (datos)
names (datos)

###Unwrap the list (get the first element)
datos <- datos[[1]]
class (datos)
datos


###Explore the ExpressionSet: Expression Values
expr <- exprs (datos)
class (expr)
dim (expr)
expr[1:3,1:5]
boxplot (expr, las = 3)


###Explore the ExpressionSet: Gen Annotation (available information about genes)
fea <- fData (datos)
class (fea)
dim (fea)
colnames (fea)
fea[1:3,]
table (rownames (fea) == rownames (expr))


###Explore the ExpressionSet: Sample Information
sinfo <- pData (datos)
class (sinfo)
dim (sinfo)
sinfo[1:3,1:5]
table (rownames (sinfo) == colnames (expr))

################################################################################


###READING Series Matrix File(s)
datos2 <- getGEO ("GSE17538")  ##usually gives an FTP response timeout error

###Download data form:
## http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE17538
## wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE17nnn/GSE17538/matrix/GSE17538-GPL570_series_matrix.txt.gz
## gunzip GSE17538-GPL570_series_matrix.txt.gz

## wc -l GSE17538-GPL570_series_matrix.txt
## grep "^\!" GSE17538-GPL570_series_matrix.txt | wc -l


###read.table CAN BE USED is slow.
datos2 <- read.table (file = "GSE17538-GPL570_series_matrix.txt", header = TRUE, sep = "\t", comment.char = "!", quote = "\"", as.is = TRUE)
class (datos2)
dim (datos2)
datos2[1:3, 1:5]


rownames (datos2) <- datos2[,1]
datos2 <- datos2[,-1]
dim (datos2)

boxplot (datos2)


###EXIT
warnings ()
sessionInfo ()
q ("no")
