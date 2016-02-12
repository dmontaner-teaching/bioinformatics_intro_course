% Practical: Ensembl
% Nociones Básicas de Bioinformática y Genómica <br> _[Máster en Bioinformática, Universidad de Valencia](http://www.uv.es/bioinfor/)_
% [David Montaner](http://www.dmontaner.com) <br> _2015-03-30_


Exercise 1
================================================================================

1. Find all _short variants_ of the human gene __BRCA2__ in BioMart.
   Hint: find out the Ensembl ID for the gene and set a filter when searching in BioMart.
    - How many are they?
    - Are they all SNPs?
2. Download the _somatic short variants_ associated to gene __BRCA2__
   and find out if any ID is shared with the _short variation_ database.
   (Some example R code is provided for this task).
3. Download the sequence of the human gene __BRCA2__.
   (Go to Attributes > Sequences)
4. Download the genomic position (chromosome, start and end) of all exons of the gene. 
   (Go to Attributes > Structures)


<!-- 
BRCA2 = ENSG000001396185820 short in BRCA2
1035 somatic in BRCA2
0 structural in BRCA2

5024 structural in human

-->


Exercise 2
================================================================================

1. How many _structural variants_ are there registered Ensembl for in humans?
2. How many _somatic structural variants_ are there registered Ensembl for in humans?
   Download them from BioMart file and find out all possible _types_. 
   Use Linux shell commands: `cut`, `sort` and `uniq`:
   ```
   cut -f 6  mart_export_somatic_structural.txt | sort | uniq
   ```

<!--
cut -f 6 mart_export_structural.txt | sort | uniq

complex_structural_alteration
copy_number_variation
insertion
interchromosomal_breakpoint
intrachromosomal_breakpoint
inversion
mobile_element_insertion
SV Variant Type
tandem_duplication
-->






Exercise 3
================================================================================

Find out the Ensembl FTP site form which you can download the __C. elegans__ reference genome.

- How many chromosomes does the worm have?
- Why are there three _mitochondrial_ files in the FTP site? Indeed all chromosomes have triplicated files.
  Find out their differences in the README file.
- Download all three _mitochondrial_ files and explore their differences. Use `wget` and `colordiff`.
- What is it in the _CHECKSUMS_ file?
- Download the _toplevel_ file and make sure that all chromosomes are represented within it.
  Use `grep` to extract sequence names from the file.
  ```
  grep ">" Caenorhabditis_elegans.WBcel235.dna.chromosome.I.fa
  ```
- Find out in the Ensembl FTP site the [GTF](http://www.ensembl.org/info/website/upload/gff.html) file annotationg this genome.



<!-- 
http://www.ensembl.org/Caenorhabditis_elegans/Info/Index
Download DNA sequence (FASTA)

wget ftp://ftp.ensembl.org/pub/release-79/fasta/caenorhabditis_elegans/dna/Caenorhabditis_elegans.WBcel235.dna.chromosome.MtDNA.fa.gz
wget ftp://ftp.ensembl.org/pub/release-79/fasta/caenorhabditis_elegans/dna/Caenorhabditis_elegans.WBcel235.dna_rm.chromosome.MtDNA.fa.gz
wget ftp://ftp.ensembl.org/pub/release-79/fasta/caenorhabditis_elegans/dna/Caenorhabditis_elegans.WBcel235.dna_sm.chromosome.MtDNA.fa.gz

wget ftp://ftp.ensembl.org/pub/release-79/fasta/caenorhabditis_elegans/dna/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa.gz


>I dna:chromosome chromosome:WBcel235:I:1:15072434:1 REF
>II dna:chromosome chromosome:WBcel235:II:1:15279421:1 REF
>III dna:chromosome chromosome:WBcel235:III:1:13783801:1 REF
>IV dna:chromosome chromosome:WBcel235:IV:1:17493829:1 REF
>MtDNA dna:chromosome chromosome:WBcel235:MtDNA:1:13794:1 REF
>V dna:chromosome chromosome:WBcel235:V:1:20924180:1 REF
>X dna:chromosome chromosome:WBcel235:X:1:17718942:1 REF

ftp://ftp.ensembl.org/pub/release-79/gtf/caenorhabditis_elegans/

-->


Exercise 4
================================================================================

Download the expression matrix for the [GSE35972](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE35972)
dataset of the [Gene Expression Omnibus](http://www.ncbi.nlm.nih.gov/geo/) at the NCBI.

Hint: download the __Series Matrix File(s)__ form the [FTP site](ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE35nnn/GSE35972/matrix/)

As you can see in the associated _platform_ [GPL570](www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GPL570), 
the _GSE35972_ experiment used an __Affymetrix Human Genome U133 Plus 2.0 Array__ to measure gene expression.

Explore the file and find out the _probe_ identifiers.

Find out in BioMart the ID conversion between the Affymetrix _probe_ IDs and the [Gene Names](http://www.genenames.org/).
Create a matrix file with the ID conversion. (Some example R code is provided for this task).

Find out the [Gene Ontology Annotation](http://geneontology.org) for this data set __using BioMart__.

