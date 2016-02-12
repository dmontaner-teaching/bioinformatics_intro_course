##' ensembl_and_plot.r
##' 2013-06-03 dmontaner@cipf.es
##' 2014-05-12 dmontaner@cipf.es
##' Format data form Ensembl and draw transcripts from SMN1
##'
##' -------------------------------------------------------

rm (list = ls ())

### READ DATA
setwd ("datos") # Set the working directory
dir ()

##system.time (exons <- read.table (file = "mart_export_exons.txt", header = TRUE, sep = "\t", quote = "", as.is = TRUE))
system.time (exons <- read.table (file = "mart_export_exons.txt.gz", header = TRUE, sep = "\t", quote = "", as.is = TRUE))
class (exons)
dim (exons)
sapply (exons, class)
exons[1:10,]

genes <- read.table (file = "mart_export_genes.txt.gz", header = TRUE, sep = "\t", quote = "", as.is = TRUE)
dim (genes)
sapply (genes, class)
genes[1:10,]



### COMBINE the two data.frames
datos <- merge (exons, genes)
dim (datos)
datos[1:10,]

colnames (genes)
colnames (exons)
colnames (datos)



###SELECT ROWS for SMN1
#sm.dat <- datos[datos$HGNC.symbol == "SMN1",]  ##make a small dataset just for SMN1
rows.touse <- datos[,"HGNC.symbol"] == "SMN1"
table (rows.touse)

sm.dat <- datos[rows.touse,]  ##make a small dataset just for SMN1
sm.dat

##how many transcripts does SMN1 have
unique (sm.dat[,"Ensembl.Transcript.ID"])


################################################################################


###LOAD THE LIBRARY for making the plots
library(Gviz)           ##this should also load the library GenomicRanges
library (GenomicRanges) ##but we load it just in case

###Generate a Track for the genes
## We may need to change the chromosome names:
## sm.dat[,"Chromosome.Name"] <- paste ("chr", sm.dat[,"Chromosome.Name"], sep = "")

gene.track <- GeneRegionTrack (rstarts = sm.dat[,"Exon.Chr.Start..bp."], rends = sm.dat[,"Exon.Chr.End..bp."],
                               strand = sm.dat[,"Strand"],
                               exon = sm.dat[,"Ensembl.Exon.ID"],
                               chromosome = sm.dat[,"Chromosome.Name"],
                               transcript = sm.dat[,"Ensembl.Transcript.ID"],
                               gene = sm.dat[,"Ensembl.Gene.ID"],
                               symbol = sm.dat[,"HGNC.symbol"],
                               showId = TRUE)

plotTracks (gene.track)


##SAVE IN PNG FORMAT
png (filename = "SMN1_transcripts.png")
plotTracks (gene.track) #, from = min (sm.dat[,"Exon.Chr.Start..bp."]) - 1000)
dev.off ()


###EXIT
warnings ()
sessionInfo ()
q ("no")

