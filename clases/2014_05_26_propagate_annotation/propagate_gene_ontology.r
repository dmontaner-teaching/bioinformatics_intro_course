##' propagate_gene_ontology.r  
##' 2014-05-26 dmontaner@cipf.es  
##' The script shows how to propagate Gene Ontology annotation using [R](http://www.r-project.org/) and [Bioconductor](http://master.bioconductor.org/).
##' 
##' ----------------------------------------------------------------------------

##' [Amigo]:http://amigo.geneontology.org "AmiGO 2 home page"
##' [Ensembl]:http://www.ensembl.org "Ensembl home page"

##' In this practical we will _propagate_ the Gene Ontology annotation 
##' found in the [AmiGO] browser
##' for the human gene SMN1.
##' 
##' Download the annotation data from the [AmiGO] page
##' and save it in a file named `annotation_smn1.txt`.
##' See video [here](http://youtu.be/wM030HBv1Gg).
##' 
##' You will also need to install the Bioconductor packages
##' [GO.db](http://master.bioconductor.org/packages/release/data/annotation/html/GO.db.html)
##' and
##' [RamiGO](http://master.bioconductor.org/packages/release/bioc/html/RamiGO.html).


##' Read data and keep just Biological Process
##' ============================================================================

##' We will first read the file and explore the data
datos <- read.table (file = "datos/annotation_smn1.txt", header = FALSE, sep = "\t", quote = "", as.is = TRUE)
table (sapply (datos, class))
datos[1:3,]

##' Setting the names of the columns would be a good idea ...
## colnames (datos) <- c ("col1", "col2", ...)

##' You can find the species (NCBI taxon) with GO annotation for SMN1
table (datos[,13])

##' Use just the information for _human_.
##' Find out the NCBI _taxon ID_ for this species in <http://www.ncbi.nlm.nih.gov/taxonomy>
touse <- datos[,13] == "NCBITaxon:9606"
datos <- datos[touse,]
dim (datos)

##' Explore the sources of annotation
table (datos[,1])
##' And the evidence
table (datos[,7])
##' you can sort the table above to quickly find the most common annotations
sort (table (datos[,7]))
##' Remember you can find the interpretation for the annotation codes at:
##' <http://www.geneontology.org/GO.evidence.shtml>

##' Check for duplicated rows
table (duplicated (datos))

##' Keep just the interesting columns
datos[1:3,]
datos <- datos[,c(3, 5, 9)]
dim (datos)
datos[1:3,]

##' Check for duplicated again
table (duplicated (datos))
##' Remove duplicates
dups <- duplicated (datos)
table (dups)
datos <- datos[!dups,]
dim (datos)
datos[1:3,]

##' Explore the amount of annotation within each ontology
table (datos[,3])

##' Keep just those terms in the the Biological Process ontology
touse <- datos[,3] == "P"
datos <- datos[touse,]
datos




##' Propagate the Biological Process annotation
##' ============================================================================

##' We will use the library
library (GO.db)
#help (package = GO.db)

lista <- as.list (GOBPANCESTOR)
##lista <- as.list (GOCCANCESTOR)
##lista <- as.list (GOMFANCESTOR)

milista <- lista[datos[,2]]
length (milista)
dim (datos)
milista[1:3]

propagated.gos <- unlist (milista)
class (propagated.gos)
propagated.gos[1:3]

##' some terms may be duplicated
table (duplicated (propagated.gos))
##' some terms may be already in the direct annotation
intersect (propagated.gos, datos[,2])

all.gos <- c (datos[,2], propagated.gos)
##' there may be several duplicated annotations
table (duplicated (all.gos))
##' we will keep just the unique ones
gos <- unique (all.gos)
length (gos)
##' Thus my annotated and propagated GOs are:
gos

##' what does the "all" annotation mean?
##' You can remove it doing
gos <- setdiff (gos, "all")
length (gos)
gos




##' Plot the DAG structure 
##' ============================================================================

##' We will use the library
library (RamiGO)
#help (package = RamiGO)

##' We can first plot the original terms.
##' Let's set GO ID's and color
goIDs <- datos[,2]
color <- "red"

##' Now we can get the pot in PNG format
pp <- getAmigoTree (goIDs = goIDs, color = color, filename = "datos/annotated_gos")

##' The plot should be now: 
##' ![](datos/annotated_gos.png)

##' get the pot in SVG format
pp <- getAmigoTree (goIDs = goIDs, color = color, filename = "datos/annotated_gos", picType = "svg")

##' The SVM plot must be [here](datos/annotated_gos.svg)


##' We can also plot the _directly annotated_ and the _propagated_ terms
##' using different colors
new.gos <- setdiff (gos, datos[,2])
goIDs <- c (datos[,2], new.gos)
color <- c (rep ("red", times = length (datos[,2])),
            rep ("blue", times = length (new.gos)))
color

length (goIDs)
length (color)

##' Now we can get the pot in PNG format
pp <- getAmigoTree (goIDs = goIDs, color = "blue", filename = "datos/propagated_gos")

##' get the pot in SVG format
pp <- getAmigoTree (goIDs = goIDs, color = color, filename = "datos/propagated_gos", picType = "svg")


##' Some questions
##' ============================================================================

##' - Why did we plot the gos of just one of the ontologies?
##' - What will you need to do to plot the three of them?
##' - What will be different in the process if you want to propagate the annotation of not just one gene but several?
##' - What will change if you download the data from Ensembl instead of [AmiGO]
