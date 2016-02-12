% Practical: Gene Ontology
% Nociones Básicas de Bioinformática y Genómica <br> _[Máster en Bioinformática, Universidad de Valencia](http://www.uv.es/bioinfor/)_
% [David Montaner](http://www.dmontaner.com) <br> _2015-05-18_


<!--
Clean the starting dataset
================================================================================
#    rm -r data/*
#    cp data0/f* data/
#    cd data
-->

<!-- links -------------------------------------------------------------------->

[blast-web]:http://blast.ncbi.nlm.nih.gov/Blast.cgi "BLAST web application at the NCBI"
[ensembl]:http://www.ensembl.org/ "Ensembl home"



Overview
================================================================================

In this practical we will explore the structure of the Gene Ontology data base
and see how to query gene _annotations_.



Get gene annotation form Ensembl
================================================================================

Go to the [Ensembl] _biomart_ web site and download all human genes and transcripts.

- How many different gene ids are there?
- How many different transcripts ids are there?
- Is there any transcript associated to more than one gene?


Go to the [Ensembl] _biomart_ web site and download the GO annotation for all human genes.

Get the following fields

- Ensembl Gene ID
- Ensembl Transcript ID
- Chromosome Name
- GO Term Accession	
- GO Term Name
- GO Term Evidence Code
- GO domain

<!-- 
- GO Term Definition
-->

__Which information is reported in each of them?__


Use __R__ to read the information and explore the data. 
Answer the following questions:

- Which percentage of genes are annotated?

- Which percentage of transcripts are annotated?

- Are there _duplicated_ annotations (same gene or transcript annotated to the same GO term)?  Why?

- Which percentage of the gene annotations belong to each ontology? (Exclude duplications caused by the the Evidence codes)

- Which percentage of the go terms belong to each ontology? (Exclude duplications caused by the the Evidence codes)

- Why are there so few _cellular component_ annotations?

- Explore the distribution of the number of annotations of each gene.  
  HINT: get the count of the number of GO terms annotated to each gene.
  Make some _Box plots_.

<!--
- Compare those distributions across chromosomes.
-->



Amigo Search
================================================================================

Go to the [Amigo Search page](http://amigo.geneontology.org/amigo) and find the GO id for the term: _regulation of execution phase of apoptosis_.

<!-- GO:1900117 -->

- Which is the ontology of this term?

Find all the human genes associated to this term. 
(HINT: use the _Taxon filter_)

- How many are they?

- Why are there several duplicates?  <!-- there are several protein synonyms -->

Download the table

- Why is the URL so long?

Get the same term in the data you did download from Ensembl.

- Can you read the Amigo data into R?



Amigo Tools
================================================================================

Go to the Amigo Tools web page and find the visualization tool. 

Find several GO terms related to apoptosis form your ensembl dataset or form the Amigo web page
(HINT: you can use the R command `grep`)
and plot them in the visualization tool.

Try to include some colors in the graph. 

<!-- 
http://amigo.geneontology.org/amigo/software_list

http://amigo.geneontology.org/amigo/visualize

http://amigo1.geneontology.org/cgi-bin/amigo/term_enrichment
-->
