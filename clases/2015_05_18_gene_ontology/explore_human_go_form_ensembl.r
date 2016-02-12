##explore_human_go_form_ensembl.r
##2015-05-18 dmontaner@cipf.es
##We explore the distribution of GO annotation across human genes and transcripts

rm (list = ls ())

options (width = 170)

###DATA GENES
setwd ("datos")

datos.gt <- read.table (file = "mart_export_gene_and_transcript.txt", header = TRUE, sep = "\t", as.is = TRUE)
dim (datos.gt)
datos.gt[1:3,]

table (duplicated (datos.gt))
table (duplicated (datos.gt[,"Ensembl.Transcript.ID"]))  ## ok no duplicated transcript -> no transcript to more than one gene
table (duplicated (datos.gt[,"Ensembl.Gene.ID"]))
length (unique (datos.gt[,"Ensembl.Gene.ID"]))


###DATA GOS
datos <- read.table (file = "mart_export.txt", header = TRUE, sep = "\t", as.is = TRUE, comment.char = "", quote = "\"")
sapply (datos, class)
dim (datos)
colnames (datos)
datos[1:3,]

table (is.na (datos)) ## OK no missing
table (datos == "")   ## but many empty 

table (datos[,"Ensembl.Gene.ID"]       == "")  ## OK no missing
table (datos[,"Ensembl.Transcript.ID"] == "")  ## OK no missing
table (datos[,"GO.Term.Accession"]     == "")  ##  some missing

## KEEP just the rows with annotation
touse <- datos[,"GO.Term.Accession"] != ""
table (touse)
datos <- datos[touse,]
dim (datos)
datos[1:10,]

################################################################################

## annotated genes
all.genes <- unique (datos.gt[,"Ensembl.Gene.ID"])
ann.genes <- unique (datos[,"Ensembl.Gene.ID"])

length (all.genes)
length (ann.genes)

100 * table (all.genes %in% ann.genes) / length (all.genes) ##31 % annotation in genes

## annotated transcripts
all.transcripts <- unique (datos.gt[,"Ensembl.Transcript.ID"])
ann.transcripts <- unique (datos[,"Ensembl.Transcript.ID"])

length (all.transcripts)
length (ann.transcripts)

100 * table (all.transcripts %in% ann.transcripts) / length (all.transcripts) ##35 % annotation in genes

################################################################################

## evidence code distribution
table (datos[,"GO.Term.Evidence.Code"])

## remove duplicated annotations
gene2go <- unique (datos[,c("Ensembl.Gene.ID", "GO.Term.Accession", "GO.domain")])
dim (gene2go)
gene2go[1:10,]

## gene annotation ontology percent
table (gene2go[,"GO.domain"])
100 * table (gene2go[,"GO.domain"]) / nrow (gene2go)

## go ontology percent
doms <- unique (datos[,c("GO.Term.Accession", "GO.domain")])
table (doms[,"GO.domain"])
table (doms[,"GO.domain"]) / nrow (doms)

## distribution of the number of annotations
ta <- as.data.frame (table (gene2go[,"Ensembl.Gene.ID"]))
ta[1:10,]
summary (ta[,2])
boxplot (ta[,2])

################################################################################

## genes related to apoptosis
pos <- grep ("apoptosis", datos[,"GO.Term.Name"])

apo <- unique (datos[pos, c("GO.Term.Accession", "GO.Term.Name")])
apo

cat (apo[,"GO.Term.Accession"], sep = "\n")

###EXIT
warnings ()
sessionInfo ()
q ("no")
