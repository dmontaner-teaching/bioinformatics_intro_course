% Practical session with BLAST: local blast
% Nociones Básicas de Bioinformática y Genómica <br> _[Máster en Bioinformática, Universidad de Valencia](http://www.uv.es/bioinfor/)_
% [David Montaner](http://www.dmontaner.com) <br> _2015-04-20_

<!--
Clean the starting dataset
================================================================================
#    rm -r data/*
#    cp data0/f* data/
#    cd data
-->

[blast-web]:http://blast.ncbi.nlm.nih.gov/Blast.cgi "BLAST web application at the NCBI"
[ensembl]:http://www.ensembl.org/ "Ensembl home"



Preliminaries
================================================================================

The file `mytranscripts.fa` in the `datos` folder contains the sequences from several __human__ transcripts of the same gene.
The gene is located in __chromosome 21__.

We will download the genomic sequence from the [Ensembl] home page and use it to find the location of the different transcripts using BLAST.


Software used in this practical
--------------------------------------------------------------------------------

__BLAST:__

- makeblastdb
- blastn
- blast_formatter


You can download it from the web page:  
<http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download>

Some more information on running BLAST may be found at:  
<http://www.ncbi.nlm.nih.gov/guide/howto/run-blast-local/>




Exercise 1
================================================================================

Find out the reference genome (__just chromosome 21__ for the practical) from the [Ensembl] web page.

[Here](http://www.ensembl.org/info/data/ftp/index.html)
you can find summary index for the genomic information of the most relevant species. 

Find out the human sequences of the chromosomes in the [ftpsite](http://www.ensembl.org/info/data/ftp/index.html).

- Why are there __3 files__ containing the sequence of __chromosome 21__?  
  Download them and find out the differences.  
  __Hint__ read the [README](ftp://ftp.ensembl.org/pub/release-79/fasta/homo_sapiens/dna/README) file; 
  use the Linux command `colordiff`.

- What is it in the [CHECKSUMS](ftp://ftp.ensembl.org/pub/release-79/fasta/homo_sapiens/dna/CHECKSUMS)
  file in the _ftp site_?  
  Use `md5sum` to be sure that your file is properly downloaded. 


We will use the _unmasked_ genomic sequence for the practical.

In this practical we will __rename__ the downloaded reference file as `hsa_21.fa`


Indexing
--------

First we need to index the downloaded fasta file so that BLAST can run locally:

    makeblastdb -in hsa_21.fa -dbtype nucl 

- Which files have been generated?
- What does it mean the `-dbtype` option?


Aligning
--------

Now we can run nucleotide BLAST against the created database

    blastn -db hsa_21.fa -query mytranscripts.fa -out salida

- See the generated files.
- Which is the output format of the created file?  
  Remember you can use `blastn -help` to get a detailed description of the command...
  including the many possible output formats.

Output format
-------------

You can choose a different output file format using the option `-outfmt`. 
For instance an _XML_ format:

    blastn -db hsa_21.fa -query mytranscripts.fa -out salida5 -outfmt 5

Or a _tabular_ one: 

    blastn -db hsa_21.fa -query mytranscripts.fa -out salida6 -outfmt 6
    blastn -db hsa_21.fa -query mytranscripts.fa -out salida7 -outfmt 7

- How are they different the 6 and 7 formats?
- Can you guess which are the columns in output format 6 by looking at output format 7?
- What happen if you do not set the `-out` parameter?
- Try to _pipe_ (|) the output and use the Linux command `cut` to extract just few columns of the tabular format,
  for instance the _chromosome_ and the start and end position of the alignment over the genome.
  <!-- blastn -db hsa_21.fa -query mytranscripts.fa -outfmt 6 | cut -f 2,9,10 -->


Exercise 2
================================================================================

Generate an alignment in __ASN.1__ format and use the command `blast_formatter` to convert it into _XML_ and _tabular_ formats.

- Why are there two possible options to get __ASN.1__ outputs indicated in the `blastn -help`?

Use the shell command `diff` or `colordiff` to see if the converted file is the same as the originally created in those formats.

- Do you need to use the option `-rid`? Why?

<!--
    blastn -db hsa_21.fa -query mytranscripts.fa -out salida11 -outfmt 11
    blastn -db hsa_21.fa -query mytranscripts.fa -out salida9  -outfmt 9
    blast_formatter -archive salida11 -outfmt 6 -out my_tab_blast.txt
-->

Compare the sizes of the generated files including the binary and text __ASN.1__ formats.
	
- Can you pipe the output of the `blast_formatter` command?
- Would that be useful sometime?


Exercise 3
================================================================================

Use `R` to explore how many exons are there in each analyzed transcript.

Exercise 4
================================================================================

Go to [biomart](http://www.ensembl.org/biomart/) and download
the sequences of all
21 chromosome human transcripts
form the [HAVANA](http://www.ensembl.org/Help/Faq?id=152)
dataset.  
__Hint__: use _biomart filters_ here. 

Align them using blast to the 21 chromosome sequence.

<!-- 
    time blastn -db hsa_21.fa -query havana_21.fa -out salida_havana -outfmt 9
    time blastn -db hsa_21.fa -query havana_21.fa > salida
-->

Use `time` to find out how long does it take. 

Use `htop` to find out how many processors is your machine using.

Try to increase the number of _threads_ changing the parameters of the blast command.
Does it increase performance?
	
<!--
NOT MUCH:
See:
http://seqanswers.com/forums/showthread.php?t=23166
http://voorloopnul.com/blog/how-to-correctly-speed-up-blast-using-num_threads/

    time blastn -db hsa_21.fa -query havana_21.fa -num_threads 4 > salida
    time blastn -db hsa_21.fa -query havana_21.fa -num_threads 4 -max_target_seqs 1 > salida 
-->

------

__The process may take a long time...__

Send the same data to the NCBI blast web page and see whether it is quicker.

Use `head` and _pipe_ (|) to the blast command to guess how long your local alignment is going to take in your computer...

    head -n 1000 havana_21.fa | grep ">"
    head -n 100 havana_21.fa | grep ">"
	
    time head -n 100  havana_21.fa | blastn -db hsa_21.fa -outfmt 6 -out salida_small
    time head -n 1000 havana_21.fa | blastn -db hsa_21.fa -outfmt 6 -out salida_small
