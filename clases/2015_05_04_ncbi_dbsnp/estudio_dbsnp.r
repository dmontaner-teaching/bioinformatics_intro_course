## estudio_dbsnp.r
## 2015-05-04 dmontaner@cipf.es 
## Explore dbSNP data using R

### Data download: dbSNP tables for chromosome 21
## ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606_b141_GRCh38/BED/bed_chr_21.bed.gz
## ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606_b141_GRCh38/chr_rpts/chr_21.txt.gz

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.2.0 (2015-04-16)"
library (Biobase); packageDescription ("Biobase", fields = "Version") #"2.28.0"

#options (width = 170)


################################################################################
### Reading and formatting data
################################################################################

## go to the working directory
setwd ("datos")
dir ()

## Read the BED file
system.time (bed <- read.table (file = "bed_chr_21.bed", header = FALSE, sep = "\t",
                                quote = "", as.is = TRUE, skip = 1))
class (bed)
is.list (bed)
dim (bed)
sapply (bed, class)
lapply (bed, class)
bed[1:3,]

colnames (bed) <- c ("chr", "sta", "end", "id", "V5", "strand") ## rename columns
bed[1:3,]

## Read the tabular file
## Headers are:
## rs#	map	snp	chr	ctg	total	chr	ctg	ctg	ctg	ctg	chr	local	avg	s.e.	max	vali-	geno-	link	orig	upd
## 	wgt	type	hits	hits	hits		acc	ver	ID	pos	pos	loci	het	het	prob	dated	types	outs	build	build

datos <- read.table (file = "chr_21.txt", header = FALSE,
                     sep = "\t", quote = "", as.is = TRUE, skip = 7)
dim (datos)
sapply (datos, class)
table (sapply (datos, class))
datos[1:3,]

## Rename some columns
colnames (datos)[1]  <- "id"
colnames (datos)[3]  <- "type"
colnames (datos)[7]  <- "chr"
colnames (datos)[11] <- "sta"
colnames (datos)[12] <- "end"
colnames (datos)[13] <- "gen"
colnames (datos)[26] <- "variant"

datos[1:5,]

## spit the variant column
## We separate in 3 columns containing the genotype, the count and the maf
spl <- strsplit (datos[,"variant"], split = ":")
head (spl)  ## spl is a __list__ with a vector per row in datos

lon <- sapply (spl, length)  ## we compute the length of spl
class (lon)
lon[1:10]
table (lon, exclude = NULL)
## the length of the spl elements is 3 when the {genotype, count, maf} information is available
## and is 1 when the column "variant" was empty.

## now we EXTRACT the first, second and third element of the vectors in the list spl
datos[,"genotipo"] <- sapply (spl, "[", 1)
datos[,"count"]    <- sapply (spl, "[", 2)
datos[,"maf"]      <- sapply (spl, "[", 3)
datos[1:10,]

datos[5, "genotipo"]              ## when "variant" information was empty our new "genotipo" is a white space: " "
datos[lon == 1, "genotipo"] <- NA ## we replace those with proper missing values
datos[1:10,]



################################################################################
### Exploring data
################################################################################

## Display of all (unique) variants; many of them are not SNPs
unique (datos[,"genotipo"])

## But the most common variants are SNPs.
## We can find this at the end of a sorted table
sort (table (datos[,"genotipo"]))


## Further exploration of the "AAAC" variant
table (datos[,"genotipo"])["AAAC"]

## If "genotipo" will not have NAs we could do
# datos[datos[,"genotipo"] == "AAAC",]

## But with NAs we better use the __which__ function
datos[which (datos[,"genotipo"] == "AAAC"),]


## we explore the number of missing genotypes
table (is.na (datos[,"genotipo"]))


## We explore the associated genes
datos[1:10, "gen"]
sort (table (datos[, "gen"]))[1:10]
head (sort (table (datos[, "gen"])))  ## some genes have just one associated SNP
tail (sort (table (datos[, "gen"])))  ## some others have many...

## find out the records associated to gene ETS2
table (datos[, "gen"] == "ETS2", exclude = NULL)

posiciones <- datos[, "gen"] == "ETS2"
datos[posiciones, "id"] ## all rs ids associated to the gene


##Explore the length
##It is too long.
##It must be the gene length, not the variant length.
datos[,"lon"] <- datos[, "end"] - datos[,"sta"]
summary (datos[,"lon"])


################################################################################

## Explore the BED file
bed[1:3,]

## Compute the length of the features (variants)
bed[,"lon"] <- bed[,"end"] - bed[,"sta"]
summary (bed[,"lon"])

## The ids in the bed file have the "rs" prefix but hot the ones in datos
head (bed)
head (datos)

## we create a new variable without the "rs" in bed
bed[,"idSin"] <- as.integer (sub ("rs", "", bed[, "id"]))
class (bed[,"idSin"])
class (as.integer (bed[,"idSin"]))

## and a new variable with the "rs" in datos
datos[,"idCon"] <- paste0 ("rs", datos[, "id"])
datos[1:10,]


## Explore duplicated ids
table (duplicated (datos[,"id"]))
table (duplicated (  bed[,"id"]))


## Explore the common and different ids
length (intersect (bed[, "id"], datos[,"idCon"]))

setdiff (bed[,"id"], datos[,"idCon"]) ## all ids in bed are in datos
setdiff (datos[,"idCon"], bed[,"id"]) ## some ids in datos are not in bed


##There is some duplicated information in datos
table (duplicated (datos[,c("idCon", "genotipo")]))

unico <- unique (datos[,c("idCon", "genotipo")])
dim (unico)
table (duplicated (unico[,"idCon"]))
unico[1:10,]

bed[1:10,]


## Now we can merge the two datasets
## This will include the variant genotype into the bed file
datos2 <- merge (bed, unico, by.x = "id", by.y = "idCon")
dim (datos2)
datos2[1:3,]
