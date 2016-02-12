---
title: Genome visualization using Bioconductor packages
footer-right: Genome visualization
date: 2015-05-25
subtitle: 'Nociones Básicas de Bioinformática y Genómica \newline _(Máster en Bioinformática, Universidad de Valencia)_'
author: '[David Montaner](http://www.dmontaner.com)'
footer-left: 'Nociones Básicas de Bioinformática y Genómica'
...

[bioconductor]: http://www.bioconductor.org/ "Bioconductor home page"


Genome browsers
================================================================================

- Ensembl: embedded in their web page <http://www.ensembl.org/Homo_sapiens/Location/View?r=6:133017695-133161157>

- UCSC: <http://genome.ucsc.edu/cgi-bin/hgGateway>

- [CIPF](http://bioinfo.cipf.es/): GenomeMaps <http://www.genomemaps.org/?region=6:133017695-133161157>

- Broad Institute: [Integrative Genomics Viewer](https://www.broadinstitute.org/igv/home): runs locally. Good for NGS data.

\ 

Many other indicated in the [Wikipedia page](http://en.wikipedia.org/wiki/Genome_browser)


Genome browsers
================================================================================

Advantages
----------

- Easy to use
- Databases are provided

Disadvantages
-------------

- Not fully customize
- Not all species or databases available



Bioconductor
================================================================================

[Bioconductor] is a repository of R packages 
aimed at the analysis of high-throughput genomic data.

\ 

Install
-------

Open an R session as _Super User (root)_ and type. 

    source("http://bioconductor.org/biocLite.R")
    biocLite()


See dealer's [here](http://www.bioconductor.org/install/ "Bioconductor install page")




Packages for genome visualization
================================================================================

- [Gviz](http://www.bioconductor.org/packages/release/bioc/html/Gviz.html):
  integrated visualization of known genomic information and new experimental data.

- [ggbio](http://www.bioconductor.org/packages/release/bioc/html/ggbio.html):
  detailed views of particular genomic regions, as well as genome-wide overviews.

- [Sushi](http://www.bioconductor.org/packages/release/bioc/html/Sushi.html): 
  integrative genomic visualizations

\ 

Install Gviz
------------

    source("http://bioconductor.org/biocLite.R")
    biocLite("Gviz")
