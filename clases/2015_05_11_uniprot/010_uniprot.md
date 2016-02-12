---
title: UniProt
subtitle: 'Nociones Básicas de Bioinformática y Genómica  \newline _(Máster en Bioinformática, Universidad de Valencia)_'
author: '[David Montaner](http://www.dmontaner.com)'
date: 2015-05-04
footer-left: 'Nociones Básicas de Bioinformática y Genómica'
footer-right: UniProt
...


UniProt
================================================================================

<http://www.uniprot.org/>

\ 

Protein __sequence__ and __functional information__.

\ 

- Curated protein sequences
- Consistent/standard nomenclature (including synonyms)
- Cross-referencing (80 < external databases)
- Identification of splice variants
- Identification of variants at amino acid level
- Annotation of proteins and their sequences
- Usage of controlled vocabularies
- Allows for data submission, updates, corrections ...


UniProt Consortium
================================================================================

- European Bioinformatics Institute:  [EBI](http://en.wikipedia.org/wiki/European_Bioinformatics_Institute)
- Swiss Institute of Bioinformatics: [SIB](http://en.wikipedia.org/wiki/Swiss_Institute_of_Bioinformatics)
- Protein Information Resource at Georgetown University: [PIR](http://en.wikipedia.org/wiki/Protein_Information_Resource) 



<!-- ORGANIZATION ------------------------------------------------------------->



Internal Organization
================================================================================

- UniParc _(UniProt Archive)_: protein sequences from the main, publicly available protein sequence databases.
- UniRef _(UniProt Reference Clusters)_: homology-reduced database; similar sequences merged into clusters.
- UniProtKB _(UniProt Knowledge Base)_: protein sequences with annotation and references.



UniParc
================================================================================

Protein sequence archive

- Stores protein __sequences__ from publicly available databases.
- Non-redundant: identical sequences are merged.
- Each sequence is given a stable and unique identifier (UPI)

Just protein sequences. No annotation.


UniRef
================================================================================

UniProt reference clusters.

\ 

Three databases:

- UniRef100: clusters of 100% sequence identity proteins. 
Identical sequences or sequence fragments (form any organism) are combined into a single entry. 
- UniRef90: clusters of 90% sequence identity proteins
- UniRef50: clusters of 50% sequence identity proteins

Just protein sequences. No annotation.



UniProtKB
================================================================================

Protein Knowledge Base

UniProtKB/Swiss-Prot
----------------------------------------

Manually annotated and reviewed entries:

- information extracted from scientific literature 
- and curated repositories


UniProtKB/TrEMBL
----------------------------------------

Automatically annotated entries:

- translations of annotated coding sequences (GenBank, EMBL-Bank, DDBJ, ...)
- sequences from PDB
- translations of predicted genes (Ensembl, RefSeq ...)



UniMES
================================================================================

- Specific repository for __metagenomic__ and __environmental__ data.

- Now deprecated in favor of the [EBI Metagenomics portal](https://www.ebi.ac.uk/metagenomics/)  
  See <http://www.uniprot.org/help/unimes> 



Organization Schema
================================================================================

![](images/uniprot)


<!-- fin ORGANIZATION --------------------------------------------------------->


Non Redundancy
================================================================================

Non redundancy is different for the UniProt databases:

- UniProtKB/TrEMBL: one record for 100% identical full-length sequences in __one species__.
- UniProtKB/Swiss-Prot: one record __per gene__ in one species.
- UniParc: one record for 100% identical sequences over the entire length, __regardless of the species__.
- UniRef X: one record for X% identical sequences, including fragments, __regardless of the species__.

\ 

See further details [here](http://www.uniprot.org/faq/33).


<!-- UniProtKB ---------------------------------------------------------------->



UniProtKB
================================================================================

- 542,503 reviewed entries UniProtKB/Swiss-Prot) 
- 52,707,211 unreviewed entries (UniProtKB/TrEMBL) 

\ 

- amino acid sequence
- protein name, description, IDs
- taxonomic data
- functional annotation
- citation information


UniProtKB Record
================================================================================

EXAMPLE: <http://www.uniprot.org/uniprot/P01116>

\ 

Names and origin
----------------------------------------

- Protein names: Recommended / Alternative
- Gene names: includes synonyms.
- Organism: UniProt internal. May be extinct, [EXAMPLE](http://www.uniprot.org/uniprot/P0C2W2)
- Taxonomic identifier: [NCBI Taxonomy](http://www.ncbi.nlm.nih.gov/taxonomy)
- Taxonomic lineage: ... Kingdom, Phylumn, Class, ... 


UniProtKB Record
================================================================================

Protein attributes
----------------------------------------

- Sequence length: number of amino acids
- Sequence status: is the _canonical_ sequence complete?
    - Complete
    - Fragment
    - Fragment\textbf{s}
- Protein existence: see details [HERE](http://www.uniprot.org/manual/protein_existence)
    - Evidence at protein level
    - Evidence at transcript level
    - Inferred from homology
    - Predicted
    - Uncertain

<!--
- Sequence processing: is the _canonical_ sequence mature?
    - if YES the field does not appear [EXAMPLE](http://www.uniprot.org/uniprot/P04637)
    - "The displayed sequence is further processed..." [EXAMPLE](http://www.uniprot.org/uniprot/P12345)
-->



UniProtKB Record
================================================================================

General annotation
----------------------------------------

The "useful" information about the protein: 

- Function
- Structure and domains
- Associate ed metabolic _pathways_
- Polymorphism and variants

See all _subsections_ of the protein annotation [HERE](http://www.uniprot.org/manual/general_annotation)



UniProtKB Record
================================================================================

Ontologies
----------------------------------------

- Keywords:
    - controlled vocabulary (internal to UniProt)
    - developed according to the __need and content__ of UniProtKB/Swiss-Prot
    - attributed manually
    - provide a summary of the entry
    - [10 categories](http://www.uniprot.org/manual/keywords) 
    - Can be explored at: <http://www.uniprot.org/keywords/>
- Gene Ontology ([GO](http://www.geneontology.org/)):
    - controlled vocabulary (external to UniProt)
    - describe gene and gene product attributes __in any organism__
    - developed __independently of any existing__ database
    - 3 disjoint categories:  
      cellular component / molecular function / biological process



UniProtKB Record
================================================================================

Alternative products
----------------------------------------

Shows the alternative protein sequences that can be generated from the __same gene__ by

- alternative promoter usage
- alternative splicing
- alternative initiation
- ribosomal frameshifting   <!-- http://en.wikipedia.org/wiki/Ribosomal_frameshift -->

[EXAMPLE](http://www.uniprot.org/uniprot/P42284)


UniProtKB Record
================================================================================

Sequence annotation
----------------------------------------

Describes regions of interest in the protein sequence.

- Chain: amino acid sequence in the mature protein.
- Alternative sequence: isoforms.
- Modified residue: phosphorylation, methylation, acetylation, amidation ...
- Non-terminal residue: the sequence is incomplete.
- ... 

See all _subsections_ of the sequence annotation [HERE](http://www.uniprot.org/manual/sequence_annotation)

[EXAMPLE](http://www.uniprot.org/uniprot/P0C2W2)



UniProtKB Record
================================================================================

Sequences
----------------------------------------

- default: the [canonical](http://www.uniprot.org/faq/30) protein sequence.
- upon request: isoforms described in the "sequence annotation" section


References
----------------------------------------

- Citations


Miscellany
----------------------------------------

-  Binary interactions: curated protein-protein interactions form the [IntAct database](http://www.ebi.ac.uk/intact/).



<!-- fin UniProtKB ------------------------------------------------------------>



Tools
================================================================================

- Search: search in the UniProt Site. Data + documents
- Blast: your sequence against the tree databases
- Align: aligns amino acid changes in fasta format. Accepts UniProt IDs
- Retrieve: quick query to the UniProt database
    - sequence
	- IDs
	- annotation
- ID Mapping: 

Biomart
================================================================================

A [Biomart](http://www.biomart.org)
repository for UniProt is available at the 
[EBI](http://en.wikipedia.org/wiki/European_Bioinformatics_Institute)

<http://www.ebi.ac.uk/uniprot/biomart/martview/>

Datasets:
- __UNIPROT EBI__
- ENSEMBL GENE
- INTERPRO EBI


FTP
================================================================================

<http://www.uniprot.org/downloads>


References
================================================================================

- UniProt Help<http://www.uniprot.org/help/about>
- UniProt Manual <http://www.uniprot.org/manual/>
- UniProt in Wikipedia: <http://en.wikipedia.org/wiki/UniProt>

\ 

- Gene Ontology web site <http://www.geneontology.org/>
- Gene Ontology in Wikipedia <http://en.wikipedia.org/wiki/Gene_ontology>

\ 

- Exercises at Denmark University: <http://wiki.bio.dtu.dk/teaching/index.php/Exercise:_The_protein_database_UniProt>



Exercise I
================================================================================

Find out all human proteins related with gene __KRAS__

- How many entries are there in UniProt for the gene?
- Which are the differences among them?
- Do the proteins have the same length?
- Explore the different formats in which you can download from the web for this proteins. 



Exercise II
================================================================================

Read this article about [Enzyme Codes](http://en.wikipedia.org/wiki/Enzyme_Commission_number)

- Can you use Enzyme Codes ids in the UniProt web site?
- And in the Biomart UniProt Portal?




Exercise III
================================================================================

Find out to which species belongs the protein:

<!-- gallus-->

\  

\tiny

MAFTSGCNHPSFTLPWRTLLPYLVALHLLQLGSAQLTVVAPSLRVTANVGQDVVLRCHLS
PCKDARSSDIRWIQQRSSRLVHHYRNGVDLGQMEEYKGRTELLRDGLSDGNLDLRITAVT
SSDSGSYSCAVQDGDAYAEAVVNLEVSDPFSQIILYWTVALAVIITLLVGSFVVNVFLHR
KKVAQSRELKRKDAELGNCLEKAAALERKDAELAEQAALSKQRDAMLEKHVLKLEEKTDE
VENWNSVLKKDSEEMGYGFAELKKLAAELEKHSEEMGTRDLKLERLAAKLEHQTKELEKQ
HSQFQRHFQNMYLSAGKQKKMVTKLEEHCEWMVRRNVKL

Exercise IV
================================================================================

Go to the FTP site of UniPot and download the reference proteome for __Escherichia coli__

- How many proteins does it have?
