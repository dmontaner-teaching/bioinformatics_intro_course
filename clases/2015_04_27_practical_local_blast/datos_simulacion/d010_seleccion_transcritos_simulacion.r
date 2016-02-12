##d010_seleccion_transcritos_simulacion.r
##2014-04-14 dmontaner@cipf.es
##generamos los datasets para los alumnos
##Seleccionamos los transcritos de un gen con varios transcritos

## grep "^21" Homo_sapiens.GRCh37.75.gtf > Homo_sapiens_21.gtf

## http://www.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g=ENSG00000166157;r=21:10906201-11029719
## http://www.ensembl.org/info/website/upload/gff.html

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.0.2 (2013-09-25)"
library (Biostrings); packageDescription ("Biostrings", fields = "Version") #"1.20.0"
library (data.table)

###DATOS
setwd ("../data")
dir ()

## GTF
#system.time (gtf <- read.table (file = "Homo_sapiens.GRCh38.79.gtf", header = FALSE, sep = "\t", quote = "", as.is = TRUE))

system.time (gtf <- fread ("Homo_sapiens.GRCh38.79.gtf", header = FALSE, sep = "\t"))
system.time (gtf <- as.data.frame (gtf))

dim (gtf)                 
class (gtf)
sapply (gtf, class)

touse <- gtf[,1] == "21"
table (touse, exclude = NULL)
gtf <- gtf[touse,]
dim (gtf)
gtf[1:3,]

colnames (gtf) <- c("seqname", "source", "feature", "start", "end", "score", "strand", "frame", "attribute")
dim (gtf)
gtf[1:3,]
colnames (gtf)
str (gtf)

table (gtf[,"seqname"])
table (gtf[,"source"])
table (gtf[,"feature"])
table (gtf[,"frame"])

table (gtf[,"source"], gtf[,"feature"])
table (gtf[,"source"], gtf[,"frame"])
table (gtf[,"source"], gtf[,"strand"])

table (gtf[,"feature"], gtf[,"source"])

#touse <- gtf[,"source"] == "protein_coding" & gtf[,"feature"] == "gene"
touse <- gtf[,"source"] == "havana" & gtf[,"feature"] == "transcript"
table (touse)
gtf[touse,][1:10,]

migen <- "ENSG00000166157"
sel <- grepl (migen, gtf[,"attribute"])
table (sel)

touse <- gtf[,"source"] == "protein_coding" & gtf[,"feature"] == "transcript" & sel
table (touse)
gtf[touse,] ## ver : http://www.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g=ENSG00000166157;r=21:10906201-11029719

trans <- c ("ENST00000298232", "ENST00000361285", "ENST00000342420", "ENST00000328758")

################################################################################

###CDS
cds <- readDNAStringSet (filepath = "Homo_sapiens.GRCh37.75.cds.all.fa", format="fasta", use.names=TRUE)

class (cds)
cds
cds[1:3]
#cds[[1:3]]
cds[1:3,]
#cds[1:3,1:2]

ids0 <- names (cds)
class (ids0)
length (ids0)
ids0[1:3]

chr21 <- grep (":GRCh37:21:", ids0)  ##MAS CORTO usamos este
length (chr21)

chr22 <- grep (":GRCh37:22:", ids0)  ##MAS LARGO
length (chr22)
cds[chr22,]


ids1 <- strsplit (ids0, split = " ")
table (sapply (ids1, length))
ids <- sapply (ids1, function (x) x[1])
ids[1:3]
length (ids)

################################################################################

touse <- ids %in% trans
table (touse, exclude = NULL)

cds[touse,]
trans

setwd ("/home/dmontaner/documentos/masterUV/mis_cursos/NOCIONES_BASICAS_2013_2014/clases/2014_14_practical_local_blast/datos")
writeXStringSet (cds[touse,], filepath = "mytranscripts.fa", append = FALSE, format = "fasta")


###EXIT
warnings ()
sessionInfo ()
q ("no")
