##explore_human_go_form_ensembl.r
##2015-05-18 dmontaner@cipf.es
##We explore the distribution of GO antoation across human genes and transcripts

## grep "#" mart_export.txt
## grep "'" mart_export.txt

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.2.0 (2015-04-16)"
library (data.table); packageDescription ("data.table", fields = "Version") #"1.9.4"

options (width = 170)

###DATOS
setwd ("datos")
dir ()

system.time (datos <- read.table (file = "mart_export.txt", header = TRUE, sep = "\t", as.is = TRUE, comment.char = "", quote = "\""))
system.time (datos <- read.table (file = "mart_export.txt", header = TRUE, sep = "\t", as.is = TRUE, comment.char = "", quote = "\""))
system.time (datos <- read.table (file = "mart_export.txt", header = TRUE, sep = "\t", colClasses = "character", comment.char = "", quote = "\""))

system.time (lineas <- readLines ("mart_export.txt"))
system.time (datos2 <- read.table (text = lineas, header = TRUE, sep = "\t", as.is = TRUE, comment.char = "", quote = "\""))

system.time (datos1 <- read.table (text = system (command = "gunzip -c mart_export.txt.gz", intern = TRUE),
                                   header = TRUE, sep = "\t", as.is = TRUE, comment.char = "", quote = "\""))

system.time (datos3 <- fread (input = "mart_export.txt", sep="\t", sep2=""))


                              header = TRUE, colClasses = "character", comment.char=""))

system.time (datos4 <- fread ("gunzip -c mart_export.txt.gz"))

     fread(input, sep="auto", sep2="auto", nrows=-1L, header="auto", na.strings="NA",
     stringsAsFactors=FALSE, verbose=getOption("datatable.verbose"), autostart=30L,
     skip=-1L, select=NULL, drop=NULL, colClasses=NULL,
     integer64=getOption("datatable.integer64"),         # default: "integer64"
     showProgress=getOption("datatable.showProgress"),   # default: TRUE
     data.table=getOption("datatable.fread.datatable")   # default: TRUE
     )




sapply (datos, class)
dim (datos)
datos[1:3,]



, 
                     read.table(file, 
                                dec = ".", numerals = c("allow.loss", "warn.loss", "no.loss"),
                row.names, col.names, as.is = !stringsAsFactors,
                na.strings = "NA", colClasses = NA, nrows = -1,
                skip = 0, check.names = TRUE, fill = !blank.lines.skip,
                strip.white = FALSE, blank.lines.skip = TRUE,
                
                allowEscapes = FALSE, flush = FALSE,
                stringsAsFactors = default.stringsAsFactors(),
                fileEncoding = "", encoding = "unknown", text, skipNul = FALSE)





### STARTS knitr SPIN output (Some markup is needed straight after)
try (opts_chunk$set (results = "markup")) ## "markup" "hide" "asis"

### CLOSES knitr SPIN output (Some markup is needed straight after)
try (opts_chunk$set (results = "hide")) ## "markup" "hide" "asis"
##' -----------------------
##' Completed:  `r date ()`

###EXIT
warnings ()
sessionInfo ()
q ("no")
