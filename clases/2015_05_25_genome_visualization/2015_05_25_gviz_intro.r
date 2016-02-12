##' # Genome visualization using the Bioconductor library Gviz
##' [David Montaner](http://www.dmontaner.com "my home page") _(2015-05-25)_
##'
##' The script provides a first overview of the [Gviz](http://www.bioconductor.org/packages/release/bioc/html/Gviz.html) [Bioconductor](http://master.bioconductor.org/) library.
##' 
##' ----------------------------------------------------------------------------

##' This script is modified from the script to build up the vignette for the documentation of the Gviz package.
##' See <http://www.bioconductor.org/packages/release/bioc/html/Gviz.html> for full documentation.

##' ##  Complex objects in R

##' This script was prepared using "R version 3.1.0 (2014-04-10)"
##' You can find out your R version using looking at the R internal variable `R.version.string`
R.version.string

##' Clear the work space
# rm (list = ls ())

##' and load the package
library (Gviz)

##' Remember you can find out help for the library using the command
#help (package  = "Gviz")


##' For this practical we will use some example data form the library `GenomicRanges`.
##' Lets also load it
library (GenomicRanges)

##' and attach the example data set using the command `data`.
##' Observe the output of the two 'ls' commands. 
ls ()
data (cpgIslands)
ls ()


##' Now the object `cpgIslands` is in our working directory.
##' We can see how it is _printed_ in the screen,
##' and find out its class
cpgIslands
class(cpgIslands)


##' You can find a full description of the class typing
#?GenomicRanges-class

##'    The GRanges class stores the sequences of genomic locations and
##'    associated annotations. Each element in the sequence is comprised
##'    of a sequence name, an interval, a strand, and optional metadata
##'    columns (e.g. score, GC content, etc.). This information is stored
##'    in four components ...


##' cpgIslands is a complex object of type __S4__.
##' You can find an explanation of S3, S4 objects in `?S4`,
##' but let's see how they work


##' You can fin out the _slots_ that is, the sub parts of the object using the command
slotNames (cpgIslands)

##' You can access the _slots_ directly using the `@` operator
cpgIslands@seqnames   ##direct access to slots

##' but usually, _when defined_, is preferable to use _accessor_ functions
##' to reach each part of the object
seqnames (cpgIslands)
ranges (cpgIslands)
strand (cpgIslands)
mcols (cpgIslands)

##' Each slot itself is a data object and hence has its own class
seqnames (cpgIslands)
class (seqnames (cpgIslands))


##' Classes may transformed to other formats
as.character (seqnames(cpgIslands))

chr <- as.character (unique (seqnames (cpgIslands)))
chr
gen <- genome (cpgIslands)
gen





##' ## Plotting genomic data
##' The package `Gviz` allows for plotting several types of genomic features in different _tracks_.
##' Here we will see how to use the most common of those tracks.


##' ### Annotation Track
##' Is a 
##'    A fairly generic track object for arbitrary genomic range annotations ...
##'    Annotation-Track object can be created from a variety of different inputs ... 
##     ... most likely a ‘GRanges’ object, or, for grouped elements, a GRanges-List 

##' We first create an object to be plotted
atrack <- AnnotationTrack (cpgIslands, name = "PG")
class (atrack)

##' you can find out the _slots_ of the _track_ object
slotNames (atrack)

##' But independently of the data object, what is important to us is to get the desired plot.
##' Once the track object is configured we can plot it 
plotTracks (atrack)


##' Close all graphical devices
graphics.off ()


##' ### Genome Axis Track
##' A class representing a customizable genomic axis
##' can be defined as
gtrack <- GenomeAxisTrack ()
gtrack
class (gtrack)

##' But the track has no data to be plotted.
##' It is just initialized with no data,
##' so it cannot be plotted straight forward,
##' returning an error message

try (plotTracks (gtrack))

##' __Note__ the `try` function above let's the error occur, without stooping the process.


##' The GenomeAxisTrack is designed to be plotted with some other  track.
##' This can be done combining several tracks in a _list_.
plotTracks (list (gtrack, atrack))

##' The order of the list changes the order of the tracks
plotTracks (list (atrack, gtrack))

##' Remember that in this case `gtrack`, the Genome Axis Track, did not have data.
##' the plot range is taken form the object `atrack`.

##' Nevertheless we could also create a Genome Axis Track with self contained data:
##' Fist we define the _ranges_ we want to cover
my.iranges <- IRanges (start = c(100, 300, 800), end = c(150, 400, 1000))
class (my.iranges)
my.iranges

##' and then we can define and plot the track
axTrack <- GenomeAxisTrack (name = "Axis", range = my.iranges)
axTrack
plotTracks (axTrack)



##' names of the tracks can be accessed and changed
names (atrack)
names (atrack) <- "CpG islands"
names (atrack)
plotTracks (list (atrack, gtrack))

##' Close all plots
graphics.off ()




##' ### IdeogramTrack
##' _Ideograms_ are schematic depictions of chromosomes, including
##' chromosome band information and centromer location. The relevant
##' data for various species is stored in the UCSC data base. The
##' initializer method of the class will automatically fetch the
##' respective data for a given genome and chromosome from UCSC and
##' fill the appropriate object slots. When plotting ‘IdeogramTracks’,
##' the current genomic location is indicated on the chromosome by a
##' colored box. (_Extracted from:_ ?IdeogramTrack)

##' We need to indicate the genome version and the chromosome we want to plot.
##' Remember that in our case
gen
chr

##' __NOTE:__   
##' The function `IdeogramTrack` fetches information from the UCSC url,
##' you need to have internet access to run it. 
# itrack <- IdeogramTrack (genome = gen, chromosome = chr)

##' This particular chromosome is also stored as a dataset in the Gviz package.
data (itrack)

itrack

##' Now that the `IdeogramTrack` is available we can include it in our plots
plotTracks(list(itrack, atrack))
plotTracks(list(itrack, gtrack, atrack))
plotTracks(list(atrack, itrack, gtrack)) ##reorder
plotTracks(list(atrack, itrack, gtrack)) ##reorder

##' Close all plots
graphics.off ()




##' ### Gene Region Track
##' A track to plot genes and their transcripts.

##' We load the data from the geneModels data set
.ls.before <- ls ()
data (geneModels)
.ls.after <- ls ()

##' The loaded objects are
setdiff (.ls.after, .ls.before)

class (geneModels)  #probably created using read.table or derived from data analysis
dim (geneModels)
colnames (geneModels)
sapply (geneModels, class)  #class of each column
head (geneModels)

##' You can see the _unique_ genes described in the dataset like this
unique (geneModels[,"gene"])

##' The track may be constructed doing
grtrack <- GeneRegionTrack (geneModels, genome = gen, chromosome = chr, name = "Gene Model")
grtrack

##' and plotted with the other defined tracks as
plotTracks (list (itrack, gtrack, atrack, grtrack))



##' Zooming options may be applied
plotTracks (list (itrack, gtrack, atrack, grtrack), from=25e6, to=28e6)

##' But for zooming up to a nucleotide level we need to download the corresponding
##' genome annotation library for the species under study.
library (BSgenome.Hsapiens.UCSC.hg19)

strack <- SequenceTrack (Hsapiens, chromosome = chr)
plotTracks (list (itrack, gtrack, atrack, grtrack, strack), from = 26591822, to = 26591852, cex = 0.8)





##' ### Data Track
##' Plot numeric data values along genomic coordinates.

##' generate random coordinates between 26880000 and 26890000
set.seed(255)  #to be able to replicate simulations
lim <- c(26880000, 26890000)
coords <- sort (c (lim[1],
                   sample (seq (from = lim[1], to = lim[2]), size = 99),
                   lim[2]))
coords
length (coords)

plot (coords)


##' generate random uniform numbers
##' as measures to be associate to each of the pairs of coordinates
dat <- runif (100, min = -10, max = 10)  
length (dat)

##representation of the segment data
plot (coords[-1], dat)
points (coords[-length (coords)], dat, col = "red")
segments (x0 = coords[-length (coords)], y0 = dat, x1 = coords[-1])

##' generate the track
dtrack <- DataTrack (data = dat, start = coords[-length(coords)], end = coords[-1], chromosome = chr, genome = gen, name = "Uniform")

##' and include it into the plot
plotTracks (list (itrack, gtrack, atrack, grtrack, dtrack), from = lim[1], to = lim[2])

plotTracks (list (itrack, gtrack, atrack, grtrack, dtrack))  ##with no limits

##' And several data tracks may be included in a plot
plotTracks (list (itrack, gtrack, atrack, dtrack, grtrack, dtrack), from = lim[1], to = lim[2])


##' The DataTrackHist may be plotted as a histogram
plotTracks (list (itrack, gtrack, atrack, grtrack, dtrack), from = lim[1], to = lim[2], type = "histogram")


##' Remember we did plot the genes doing:
grtrack <- GeneRegionTrack (geneModels, genome = gen, chromosome = chr, name = "Gene Model")
plotTracks (list (itrack, gtrack, atrack, grtrack))

##' Generally we will be interested in displaying gene names in the plot.
##' We may achieve that doing 
grtrack <- GeneRegionTrack (geneModels, genome=gen, chromosome=chr, name="Gene Model", showId = TRUE, background.title = "orange")
plotTracks (list (itrack, gtrack, atrack, grtrack))




##' ### Plotting Parameters
##' Some parameters of the different tracks may be accessed and customized
head (displayPars (grtrack))
displayPars (grtrack) <- list (background.panel = "#FFFEDB")
head(displayPars(grtrack))
plotTracks (list (itrack, gtrack, atrack, grtrack))

displayPars (itrack)$background.panel
displayPars (itrack) <- list (background.panel = "red")
plotTracks (list (itrack, gtrack, atrack, grtrack))


##' Some parameters may be changed globally
plotTracks (list (itrack, gtrack, atrack, grtrack), from=lim[1]-120000, to=lim[2]+10000, 
            background.panel = "#FFFEDB", background.title = "darkblue")


##' All available parameters may be found as
dp <- availableDisplayPars (grtrack)
dp
