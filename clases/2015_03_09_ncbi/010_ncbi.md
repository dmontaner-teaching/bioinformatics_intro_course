---
title: NCBI Databases
subtitle: 'Nociones Básicas de Bioinformática y Genómica  \newline _(Máster en Bioinformática, Universidad de Valencia)_'
author: '[David Montaner](http://www.dmontaner.com)'
date: 2015-02-16
footer-left: 'Nociones Básicas de Bioinformática y Genómica'
footer-right: NCBI Databases
...


NCBI
================================================================================

- __National Center for Biotechnology Information__ (NCBI)
<http://www.ncbi.nlm.nih.gov/>

- part of the United States National Library of Medicine (NLM)
<https://www.nlm.nih.gov/>

- a division of the National Institutes of Health (NIH)
<http://www.nih.gov/>


Resources
================================================================================

Databases of biomedical and genomic information for _all_ organisms:  
(and related tools)

- Submission
    - GenBank
- Databases
    - GenBank
    - __RefSeq__ 
	- ...
- Downloads
    - FTP sites
	- PubMed
- Tools
    - Basic Local Alignment Search Tool (BLAST)
    - ...

See: <http://www.ncbi.nlm.nih.gov/guide/all/>


Documents
================================================================================

[NCBI Help Manual](http://www.ncbi.nlm.nih.gov/books/NBK3831/):

- quick overview about topics
- usually just FAQs
- online (HTML) book

[NCBI Handbook](http://www.ncbi.nlm.nih.gov/books/NBK21101/): 

- nice introduction to each tool or database
- online (HTML) book
- but Chapters may be downloaded in PDF format
- see a [chapter example describing GenBank](http://www.ncbi.nlm.nih.gov/books/NBK21105/)

Many other:

- [Glossary](http://www.ncbi.nlm.nih.gov/books/NBK21106/)
- [NCBI Educational Resources](http://www.ncbi.nlm.nih.gov/education/)


Entrez: Search and Retrieval System
================================================================================

- the indexing and retrieval system used at the NCBI
- used for all major NCBI databases:
    - PubMed
    - Nucleotide and Protein Sequences 
    - Protein Structures
    - Complete Genomes,
    - Taxonomy
    - OMIM
	- ...
- __text-based__ searches over several record fields
- In practical terms, the [web interface](http://www.ncbi.nlm.nih.gov/)


NCBI Databases
================================================================================

Main
----

- [GenBank](http://www.ncbi.nlm.nih.gov/genbank): collection of __all__ publicly available DNA sequences
- [RefSeq](http://www.ncbi.nlm.nih.gov/refseq): __non-redundant__ set of reference standards

Other
-----

- Sequence: Gene, Genomes, Protein
- Variation: dbSNP, dbVar
- Experimental Data: GEO, SRA, BioProject, BioSample
- Health: OMIM, ClinVar,dbGaP, 
- Literature: PubMed, PubMed Central, Bookshelf, MeSH, 
- Species: Taxonomy, HomoloGene

See [Entrez Databases at EntrezHelp](http://www.ncbi.nlm.nih.gov/books/NBK3837/#EntrezHelp.The_Entrez_Databases)

<!--
Classification when doing a general search: <http://www.ncbi.nlm.nih.gov/gquery/?term=hola>
- Literature
- Health
- Genomes
- Genes
- Proteins
- Chemicals
-->


<!-- SECTION GenBank ---------------------------------------------------------->


GenBank
================================================================================

- collection of publicly available _annotated_ nucleotide sequences and their __protein__ translations
    - mRNA sequences with coding regions
    - segments of genomic DNA with single or multiple genes
    - ribosomal RNA gene clusters
	- genome shotgun reads
	- isolated genes
	- complete genomes
	- ...
- primary sequence data; __not curated__; minor checks done by the NCBI
- just authors submit and revise
- may have multiple records for same loci
- records can contradict each other
- no limit to species included


INSDC: International Nucleotide Sequence Database Collaboration
================================================================================

INSDC members:

- __GenBank__
- [ENA](http://www.ebi.ac.uk/ena/): European Nucleotide Archive
- [DDBJ](http://www.ddbj.nig.ac.jp/): DNA Data Bank of Japan

\ 

<http://www.insdc.org/>


GenBank Access
================================================================================

GenBank Home Page (not very informative)
<https://www.ncbi.nlm.nih.gov/genbank/>

\  

Primarily access via the NCBI __Nucleotide__ database 
which is divided into three divisions: 

- [CoreNucleotide](https://www.ncbi.nlm.nih.gov/nuccore/): the main collection (same as Nucleotide) 
- [EST](https://www.ncbi.nlm.nih.gov/nucest/): short single-read transcript sequences (Expressed Sequence Tags)
- [GSS](https://www.ncbi.nlm.nih.gov/nucgss/): unannotated short single-read primarily genomic sequences

But some other ways are available:

- BLAST: align against GenBank sequences
- FPT: ftp://ftp.ncbi.nlm.nih.gov/genbank/


GenBank ID System
================================================================================

Two _parallel_ id nomenclatures for DNA, RNA and protein:

GI: GenInfo Identifier
----------------------

- introduced in GenBank Release 81.0 (February, 1994)
- integer number
- new GI is assigned to every sequence version
- internal database keys

ACCESSION
---------
- Character and numbers
- Accession.Version. Eg: AB000349.2, AB000349.3
- The accession portion of these identifiers is stable and will not change
- the version portion is incremented whenever the underlying sequence changes.



GenBank Record Format
================================================================================

See an [Example of GenBank Record](http://www.ncbi.nlm.nih.gov/Sitemap/samplerecord.html)

<!-- 
<http://www.ncbi.nlm.nih.gov/genbank/htgs/divisions>
http://www.ncbi.nlm.nih.gov/nuccore/NM_002020.4?report=girevhist

FEATURES
- source: Mandatory feature 

-->


<!-- SECTION RefSeq ----------------------------------------------------------->


RefSeq: The Reference Sequence database 
================================================================================

<http://www.ncbi.nlm.nih.gov/refseq/>

- a __curated__ collection of DNA, RNA, and protein sequences
- created by the NCBI from existing data (GeneBank)
- unique example of each natural biological molecule (for each major organisms)
- not all organisms available
- for each model organism, RefSeq aims to provide separate and linked records for:
    - the genomic DNA
    - the gene transcripts
    - and the proteins arising from those transcripts


RefSeq
================================================================================

- non-redundant set of reference standards (__NR__)
- includes:
    - chromosomes
	- complete genomic molecules (organelle genomes, viruses, plasmids)
	- intermediate assembled genomic contigs
	- curated genomic regions, mRNAs, RNAs
	- proteins
	- alternatively spliced transcripts

- generated to provide reference standards for multiple purposes

- facilitates database inquiries based on:
    - genomic location
    - sequence
    - text annotation




RefSeq Access
================================================================================

- [Entrez](http://www.ncbi.nlm.nih.gov/): <http://www.ncbi.nlm.nih.gov/refseq/>
- [NCBI Gene](http://www.ncbi.nlm.nih.gov/gene): include nomenclature, maps, pathways ...
- [NCBI Genome](http://www.ncbi.nlm.nih.gov/genome/): information on genomes including sequences, maps, chromosomes, assemblies, and annotations
- [NCBI Assembly](http://www.ncbi.nlm.nih.gov/assembly/): Genome assembly
- [NCBI UniGene](http://www.ncbi.nlm.nih.gov/unigene): A Unified View of the Transcriptome

\ 

Example [Homo sapiens (human)](http://www.ncbi.nlm.nih.gov/genome/51) genome.


<!--
RefSeq Record
================================================================================

Each RefSeq record represents a synthesis, of the primary information that was generated and submitted by many researchers.

\ 

Consistent framework between:

- sequence
- genetic
- expression
- functional information
- ...

\ 

RefSeq records are similar in format to GenBank 
but RefSeq may include a unique accession prefix followed by
-->

RefSeq Accession Format
================================================================================

Accession format: accession number that begins with two characters followed by an underscore. 

There are several [RefSeq accession prefixes](http://www.ncbi.nlm.nih.gov/books/NBK21091/table/ch18.T.refseq_accession_numbers_and_mole/?report=objectonly)

- NM_:  mRNA	
- NR_:  RNA (non coding)
- NC_:  Complete genomic molecule, usually a reference assembly.


Curation __VERSION__ is indicated after a dot: 

- NM_000014.4
- NM_000014.5


Usual fasta id for a sequence:

    >gi|262118207|ref|NM_000202.5| Homo sapiens iduronate ...


RefSeq Curation Levels
================================================================================

- There are several RefSeq curation levels. 

- See [status codes here](http://www.ncbi.nlm.nih.gov/books/NBK21091/table/ch18.T.refseq_status_codes/?report=objectonly)

- RefSeq records with a status of __VALIDATED__ or __REVIEWED__ are intended to represent the current state of genomic knowledge.


FTP Downloads
================================================================================

See: <ftp://ftp.ncbi.nlm.nih.gov/refseq/>

\ 

Use shell commands `wget` or `curl`




<!-- SECTION EXERCISES -------------------------------------------------------->

EXERCISE: Search in "All" databases
================================================================================

Go to the NCBI web and search for gene __SMN1__ in _All_ databases

- What is in the output you get?
- How are organized the different queried databases?
- Why is there no link to the _RefSeq_ or _GenBank_ databases?
- How many _genomes_ are associated to this gene ID?
- How many homologous genes are registered at the NCBI?
- Why are there two links to Human genes at the _HomoloGene_?
- If _D.rerio_ has an homologous for gene SMN1 ... 
  Why is there no link to the _D.rerio_ genome in the _Genome_ results?

Links:  
<http://www.ncbi.nlm.nih.gov/gquery/?term=SMN1>  
<http://www.ncbi.nlm.nih.gov/genome/?term=SMN1>  
<http://www.ncbi.nlm.nih.gov/homologene/?term=SMN1>  


EXERCISE: Assembly vs. Genomes
================================================================================

- How are NCBI _Assembly_ and _Genome_ databases different?
  Hint: Search for "Homo Sapiens" in both databases.

- Can you find the reference genome through the _Genome_ output page?
- In which format is it available?
- Where is the file stored?
- Use `wget` to download its corresponding GFF file and `gunzip` to uncompress it. Explore the file.  Read [here][gff] about GFF formats. 

[GFF]:http://www.ensembl.org/info/website/upload/gff.html "GFF format at Ensembl"


Links:  
[www.ncbi.nlm.nih.gov/assembly/?term=Homo+sapiens](http://www.ncbi.nlm.nih.gov/assembly/?term=Homo+sapiens)
[www.ncbi.nlm.nih.gov/genome/?term=Homo+sapien](http://www.ncbi.nlm.nih.gov/genome/?term=Homo+sapiens)
[www.ncbi.nlm.nih.gov/genome/?term=zebra+fish](http://www.ncbi.nlm.nih.gov/genome/?term=zebra+fish)



EXERCISE: Gene version
================================================================================

- How many _versions_ of the __NM_002020__ gene have been submitted to the NCBI?
  Hint: find the _Nucleotid_ information about the gene.




<!-- 

See an [Example of GenBank Record](http://www.ncbi.nlm.nih.gov/Sitemap/samplerecord.html)

NM_002020.3Read about [GIs](http://www.ncbi.nlm.nih.gov/nuccore/NM_002020.4?report=girevhist)

search for the same gene in different databases


1. Explore the 

See an [Example of GenBank Record](http://www.ncbi.nlm.nih.gov/Sitemap/samplerecord.html)


1. How are NCBI Assembly and Genomes different?  
  Hint: Search for "Homo Sapiens" in both databases.

tp://www.ncbi.nlm.nih.gov/assembly/?term=Homo+sapiens

1. Search in "All" databases

Classification when doing a general search: <http://www.ncbi.nlm.nih.gov/gquery/?term=hola>


1. Find the FTP site at the NCBI
Explore the FPT 


1 find the version of
NM_002020

What happens if you find an older version
NM_002020.3
NM_002020.3

NM_002020.3Read about [GIs](http://www.ncbi.nlm.nih.gov/nuccore/NM_002020.4?report=girevhist)

search for the same gene in different databases


Buscar los campos de algo....

descargar ftp DE taxonomia....
-->
