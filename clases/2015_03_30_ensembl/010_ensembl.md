---
title: ENSEMBL
subtitle: 'Nociones Básicas de Bioinformática y Genómica  \newline _(Máster en Bioinformática, Universidad de Valencia)_'
author: '[David Montaner](http://www.dmontaner.com)'
date: 2015-03-30
footer-left: 'Nociones Básicas de Bioinformática y Genómica'
footer-right: ENSEMBL
...


Ensembl
================================================================================

<http://www.ensembl.org/>

\ 

Joint project:

- EMBL - EBI and the 
- Wellcome Trust Sanger Institute
- started in 1999 (Human Genome Project)

\ 

General repository for annotated genomes  
(mainly __vertebrates__ / eukaryotic)

- imports genome sequences/assemblies from diverse consortia
- __automatically__ filter and annotate genome sequences
- integrate these data with other biological information
- make the results freely available to the community


Basic genome annotations
================================================================================

- Genes
- Genomic location
- Gene model structures
- Exons
- Introns
- UTRs
- Transcript(s)
- Pseudogenes
- Non-coding RNA
- Protein(s)
- Links to other sources of information: NCBI, Gene Ontology, ...


Ensembl Own (stable) IDs
================================================================================

[www.ensembl.org/info/genome/stable_ids/index.html](http://www.ensembl.org/info/genome/stable_ids/index.html)


Human
-----

- ENSG### : Ensembl Gene ID
- ENST### : Ensembl Transcript ID
- ENSP### : Ensembl Peptide ID
- ENSE### : Ensembl Exon ID

- ENSR### : regulation

Other species
-------------

A suffix is added

- MUS (Mus musculus) : ENSMUSG###
- DAR (Danio rerio)  : ENSDARG###


Species
================================================================================

A list of the currently available species:

- <http://www.ensembl.org/info/about/species.html>

\ 

Each species has its descriptive page

- <http://www.ensembl.org/Homo_sapiens/Info/Index>
- <http://www.ensembl.org/Mus_musculus/Info/Index>
- <http://www.ensembl.org/Danio_rerio/Info/Index>

\ 

Information about the Genome build and annotation in the links: 

- [More information and statistics](http://www.ensembl.org/Homo_sapiens/Info/Annotation)



Other Species
================================================================================

Pre-Ensembl
-----------

The Ensembl pre-build site: genomes that are in the process of being annotated.

<http://pre.ensembl.org/index.html>


Ensembl Genomes
---------------

Species other than vertebrates:

- Ensembl [Bacteria](http://bacteria.ensembl.org/index.html)
- Ensembl [Fungi](http://fungi.ensembl.org/index.html)
- Ensembl [Metazoa](http://metazoa.ensembl.org/index.html)
- Ensembl [Plants](http://plants.ensembl.org/index.html)

<http://ensemblgenomes.org/>


Ensembl Databases Internal Organization
================================================================================

- Genes: main database
    - transcripts
    - exons
    - ...
- Variations:
    - [germinal](http://www.ncbi.nlm.nih.gov/books/NBK21894/): heritable ([wikipedia](http://en.wikipedia.org/wiki/Germline_mutation))
    - [somatic](http://ghr.nlm.nih.gov/glossary=somaticmutation): acquired mutation ([wikipedia](http://en.wikipedia.org/wiki/Mutation#Somatic_mutations)) 
- Regulation:
- VEGA
- PRIDE


Ensembl Databases: Ensembl Variation
================================================================================

[www.ensembl.org/info/genome/variation/index.html](http://www.ensembl.org/info/genome/variation/index.html)

All possible variations [here](http://www.ensembl.org/info/genome/variation/data_description.html#classes)

\ 

Sequence variants (short)
-------------------------

- SNP
- Insertion (short)
- Deletion (short)
- InDel (short): an insertion __and__ a deletion
- Substitution


Structural variants (long)
--------------------------

- CNV: Copy Number Variation
- Inversion
- Translocation



Ensembl Databases: Regulation
================================================================================

<http://www.ensembl.org/info/genome/funcgen/index.html>

\ 

Regulation in different cell types for: 

- human
- mouse
- drosohpila


Ensembl Databases: Vega
================================================================================

<http://vega.sanger.ac.uk>

- A repository for high-quality gene models produced by the manual annotation of vertebrate genomes.
- [Sanger](http://www.sanger.ac.uk/) dependent

Havana
------

- The Havana team is a subset of Vega
- provides the __manual__ annotation of human, mouse, zebrafish and other vertebrate genomes

see <http://www.sanger.ac.uk/research/projects/vertebrategenome/havana/>


Ensembl Databases: PRIDE
================================================================================

PRIDE: PRoteomics IDEntifications

\ 

PRIDE Archive: proteomics data repository

\ 

<http://www.ebi.ac.uk/pride/archive/>

\ 

- public data repository for proteomics data
- EBI
- protein and peptide identifications
- post-translational modifications


Ensembl Utilities
================================================================================

Form the web site menu:

\ 

- BLAST/BLAT: alignment
- __BioMart__: data-mining tool
- _Tools_ 
- __Downloads__: FTP
- Help & Documentation: nice [glossary](http://www.ensembl.org/info/website/glossary.html) _(see ambiguity code)_
- _Blog_
- _Mirrors_


Ensembl FTP
================================================================================

<http://www.ensembl.org/info/data/ftp/index.html>

\ 

Annotation File Formats
-----------------------

- [BED](http://www.ensembl.org/info/website/upload/bed.html)
- [GFF/GTF](http://www.ensembl.org/info/website/upload/gff.html) : General Feature Format / General Transfer Format

Checksum
--------

Checksum files are available in most FTP directories. See: 

- <http://en.wikipedia.org/wiki/Checksum>
- <http://en.wikipedia.org/wiki/Md5sum>




Ensembl Biomart
================================================================================

<http://www.ensembl.org/biomart/>


What is BioMart
================================================================================

<http://www.biomart.org/>

\ 

- A federated database system that provides unified access to disparate, geographically distributed data sources.
- Any existing databases can easily be incorporated into the BioMart framework.
- It is designed to be data platform independent.  
- Efficient. Ej. parallel query processing \dots
- Unified technology.
- No need of programming: graphical user interfaces. 

\ 

The BioMart project provides:
  
- software: server ... client
- __services__: already set up servers that provide access to a data


BioMart: Standardized Access to data
================================================================================
	
- Choose a Database. The repository.
- Dataset. For instance,  Species.
- Select Attributes: IDs, descriptions, sequences  
  Attributes are what we want to know about the genes.
- Set Filters: Indicate where our search should be restricted.

\ 

Examples:
---------

- [BioMart Central Portal](http://central.biomart.org/)
- [EnsMart](http://www.ensembl.org/biomart/martview/)
- [HapMap](http://hapmap.ncbi.nlm.nih.gov/biomart/martview/)
- [WormBase](http://caprica.caltech.edu:9002/biomart/martview/)
- [some Spanish](http://biomart.intogen.org/biomart/martview/)


Links
================================================================================

<http://www.ensembl.org/info/website/glossary.html>

