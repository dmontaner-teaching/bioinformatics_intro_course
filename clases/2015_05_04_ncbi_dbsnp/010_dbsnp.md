---
title: NCBI - dbSNP
subtitle: 'Nociones Básicas de Bioinformática y Genómica  \newline _(Máster en Bioinformática, Universidad de Valencia)_'
author: '[David Montaner](http://www.dmontaner.com)'
date: 2015-05-04
footer-left: 'Nociones Básicas de Bioinformática y Genómica'
footer-right: NCBI - dbSNP
...


dbSNP
================================================================================


- single nucleotide polymorphisms (SNPs)  
  -> single nucleotide variants (SNV)
- small-scale variations
- insertions / deletions 
- microsatellites
- ...

\ 

Classic site: 

<http://www.ncbi.nlm.nih.gov/SNP/>

\ 

New Entrez:

<http://www.ncbi.nlm.nih.gov/snp/>



SNP Attributes 
================================================================================

- chromosomal location
- strand (orientation): not to relevant but very confusing
- Allele Origin:
    - germline: population
	- somatic: individual mutation
	- unknown 
- Clinical significance: [OMIM](http://www.ncbi.nlm.nih.gov/omim)
- Global minor allele frequency (__MAF__): estimated in the [1000 Genomes population](http://www.1000genomes.org/) (estimated over chromosomes, not individuals)



SNP Attributes 
================================================================================


See details on attributes:

<http://www.ncbi.nlm.nih.gov/projects/SNP/docs/rs_attributes.html>

\ 

See types of variants:

<http://www.ncbi.nlm.nih.gov/projects/SNP/snp_legend.cgi?legend=snpClass>



Nomenclature
================================================================================

ss#
----

- Submitted SNP (ss)
- user submitted variants
- generally the _Flanking Sequence_ is submitted
- may be reported in any strand


rs#
---
- RefSNP: reference SNPs
- curated by alignment to the genome, consensus ss#
- clustered form several ss#
- representative sequence: that of the longest ss#
- strand: that of the longest ss#


Nomenclature
================================================================================

IDs are stable but representatives may change or be "merged"

\ 

Example

<http://www.ncbi.nlm.nih.gov/snp/?term=rs12345>

\ 

See SNP Validation

<http://www.ncbi.nlm.nih.gov/projects/SNP/snp_legend.cgi?legend=validation>

\ 


SNP Viewer
----------

Forward strand (5' to 3'): the one on the top




Examples
================================================================================

- [Cancer related SNP](http://www.ncbi.nlm.nih.gov/projects/SNP/snp_ref.cgi?rs=6983267)
- [Non disease related snp](http://www.ncbi.nlm.nih.gov/snp/?term=rs12345)



Nucleic acid notation and _ambiguity_ codes
================================================================================

__A C G T__ are generally used to represent nucleic acids ...

\  

but further "ambiguity" codes are used to represent _uncertain_ DNA bases.

\  

See IUPAC notation for nucleic acids at:

<http://droog.gs.washington.edu/parc/images/iupac.html>

<http://www.bioinformatics.org/sms/iupac.html>

<http://en.wikipedia.org/wiki/Nucleic_acid_notation>

\  

__Notice__ that there is some differences in how to interpret "-" or "." symbols.

In dbSNP "-" represents a _gap_ ...
[see dbSNP](http://www.ncbi.nlm.nih.gov/projects/SNP/snp_ref.cgi?rs=9)
[see Ensembl](http://www.ensembl.org/Homo_sapiens/Variation/Explore?r=7:92743640-92744640;v=rs9;vdb=variation;vf=7)




FTP Downloads
================================================================================

General:  
<ftp://ftp.ncbi.nih.gov/snp>

\ 

Useful:  
<ftp://ftp.ncbi.nih.gov/snp/organisms>

\ 

Example: Drosophila Melanogaster  
<ftp://ftp.ncbi.nih.gov/snp/organisms/fruitfly_7227/>


\scriptsize  

    wget ftp://ftp.ncbi.nih.gov/snp/organisms/fruitfly_7227/ASN1_flat/ds_flat_ch2R.flat.gz
    wget ftp://ftp.ncbi.nih.gov/snp/organisms/fruitfly_7227/chr_rpts/chr_2R.txt.gz


FTP Files
================================================================================

- rs_fasta: reference SNP (rs) sequence data. Usually for BLASTing
- ss_fasta: all available submitted SNP (ss) sequences
- ASN1_flat: human readable text file. Not good for parsing
- __chr_rpts__: tabular file with most relevant information.
- database: SQL dump
- BED files


Explore Files
================================================================================


Explore the tabular files:

    wc -l chr_2R.txt
	
    head -n 1000 chr_2R.txt > mytabhead


\ 

Explore the text files:


    head ds_flat_ch2R.flat 
	
	head ds_flat_ch2R.flat > myflathead
