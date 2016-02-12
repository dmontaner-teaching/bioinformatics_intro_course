% Practical: Gviz
% Nociones Básicas de Bioinformática y Genómica <br> _[Máster en Bioinformática, Universidad de Valencia](http://www.uv.es/bioinfor/)_
% [David Montaner](http://www.dmontaner.com) <br> _2015-05-25_


The aim of this practical is to get a representation of all transcripts
of the gene _SMN1_ in human. In this case we will extract the data form
the Ensembl database using Biomart web page, and we will use the
R/Bioconductor package `Gviz` to make the graphical display of the data.

Data Download
=============

Although we are now just interested in _SMN1_, it takes the same effort
to prepare the data only for this gene or for all genes in the human
genome. Thus, we will download and prepare data for all human genes.

We will need to download the following information:

-   Gene name

-   Transcript Id

-   Exon Id

-   Chromosome

-   Exon end position

-   Exon end position

-   Strand (not necessary at the moment but must be interesting to keep
    it)

Remember that in Ensembl all information is ultimately linked to the
_Ensemble Gene Identifier_ so we may also need to use this field to
combine all information.

Go to the Ensembl web page at <http://www.ensembl.org/> and follow the
BioMart link. The information we are looking for is in the _Genes
Database_. Once you select the database and the species you will be able
to choose the _Attributes_ to be downloaded.

The information about exons and their position is in the __Structures__
section. As all tables in Ensembl, this table is ultimately linked to
_Ensembl Gene ID_, hence, you will also need to find the information for
the conversion between _Ensembl Gene ID_ and _Gene Names_.

The conversion between Ensembl Gene IDs and all other external databases
is in the section __Features__ of the _Attributes_ section. From this
section you will need to retrieve the _HGNC symbol_ which is the
“common” gen name.

Once you have downloaded the __two tables__ we are ready to format the
data and plot our gene.

Data Display
============

Data Reading
------------

Read the data downloaded form Ensembl using the `R` function
`read.table`.

This parameters of the function are generally suitable:

-   header = TRUE

-   sep = “\\t”

-   quote = “”

-   as.is = TRUE

Data Formatting
---------------

Combine the two data frames using the `R` function `merge`.

Keep just the rows of the combined dataset which have information for
_SMN1_. You can “cut” the data frame doing

`datos[datos$HGNC.symbol == SMN1,]`

Graphical Display
-----------------

Load the `R` library `Gviz` and define a track to store the information
for the genes using the function, `GeneRegionTrack`. Find the help for
this function in writing `?GeneRegionTrack` in the `R` command line if
you need it.

Plot the data using the function `plotTracks`.

Save the plot using the `R` function `png`
