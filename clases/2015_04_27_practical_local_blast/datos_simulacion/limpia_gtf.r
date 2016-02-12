##prueba_lectura_1.r
##2015-04-127dmontaner@cipf.es
##vemos velocidades de lectura

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.2.0 (2015-04-16)"

###DATOS
setwd ("../data")
dir ()

## ## R
## system.time (gtf <- read.table (file = "Homo_sapiens.GRCh38.79.gtf", header = FALSE, sep = "\t", quote = "", as.is = TRUE))
## sapply (gtf, class)
## dim (gtf)

## DATA TABLE
library (data.table)
system.time (gtf <- fread ("Homo_sapiens.GRCh38.79.gtf", header = FALSE, sep = "\t"))
sapply (gtf, class)
dim (gtf)
gtf
gtf2 <- gtf[V3=="gene"]
dim (gtf2)
write.table (gtf2, file = "gtf_gen.gtf", append = FALSE, quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)

###EXIT
warnings ()
sessionInfo ()
q ("no")
