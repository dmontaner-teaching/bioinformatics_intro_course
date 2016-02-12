% Practical session with BLAST: species
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


Preliminaries
================================================================================

The file `example.fa` in the `data` folder contains reads form the transcriptome of several different species.
In this practical we will use BLAST to find out which species where present in our sample 
and to estimate the percentage of reads that belong to each of them.

First we will carry out a BLAST analysis using the [NCBI web application][blast-web]. 
Then we will use the local application `blast_formatter` to download the data from the web 
and to shape them in the most appropriated format.
Finally we will use R to estimate the percentages of each species.


Software used in this practical
--------------------------------------------------------------------------------

blast_formatter





Exercise
================================================================================


Explore your data
--------------------------------------------------------------------------------

Go to the data directory and have a look of the first lines of the file

    cd data
	head example.fa 
	

It is a standard fasta file. You can find out the number of reads or sequences in the file using the option `-c` in the grep command

    grep -c "^>" example.fa 

or using the `wc` command after the `grep` 

    grep "^>" example.fa | wc -l 


You could dump all the sequence identifier of the fasta file in a separated file doing

    grep "^>" example.fa > myids.txt
    sed -i 's/>//' myids.txt


- What does it mean the `^` symbol in the grep expression?
- Is it necessary?
- What does the command `seed` do?




BLAST
--------------------------------------------------------------------------------

Go to the [NCBI web application][blast-web] and upload the `example.fa` to run a __blastn (nucleotide blast)__

- Why are we running _blastn_ and not _blastp_ or _blastx_?
- Which is the data base we are blasting against?

Running the blast with his amount of data usually takes few minute.

Explore the HTML results when the blast is finished.

- How good do they seem the alignments?
- What does it mean the __RID__ code?  <!-- BLAST search Request ID-->
- How long are your results going to be kept in at the NCBI web site?

Keep thee __RID__ for later.

Download the results in the different formats you can and explore them. 

- In which of the formats do we have information about the species to which our reads belong to?
- Compare among them the sizes of the files you have downloaded.


Download and Format
--------------------------------------------------------------------------------

From the web page you can save just a few of the output formats available in BLAST.
The command line function `blast_formatter` let us download many other, and even customize some of them.

If you see the help of the command

	blast_formatter -help 


You will find
   
    -outfmt <String>
      alignment view options:
        0 = pairwise,
        1 = query-anchored showing identities,
        2 = query-anchored no identities,
        3 = flat query-anchored, show identities,
        4 = flat query-anchored, no identities,
        5 = XML Blast output,
        6 = tabular, 
        7 = tabular with comment lines,
        8 = Text ASN.1,
        9 = Binary ASN.1,
       10 = Comma-separated values,
       11 = BLAST archive format (ASN.1) 


We can use `blast_formatter` tool to download a __tab__ separated file with the BLAST results doing

    blast_formatter -rid K9ZSZ2M4016 -outfmt 6 -out my_tab_blast.txt

This tabular format is easy to handle and takes small amount of memory compared with some of the other files, 
but the __species__ of the nucleotide sequences in the data base are not there. 

To get this extra information we can customize the format of the `blast_formatter` output. 
See the help of the command.

    blast_formatter -rid K9ZSZ2M4016 -outfmt "6 qseqid sgi sacc saccver staxids" -out my_tab_blast_and_species.txt
	
	
<!-- 
Estos campos (del final) devuelven NAs ???

    blast_formatter -rid M4DNEDCY01R -outfmt "6 qseqid sgi sacc saccver score staxids" -out my_tab_blast_and_species.txt

	blast_formatter -rid M4DNEDCY01R -outfmt "6 qseqid sgi staxids sscinames scomnames sblastnames sskingdoms" -out my_tab_blast_and_species.txt

-->	




Explore the tabular results using R
--------------------------------------------------------------------------------

Use R to read the files `my_tab_blast.txt` and `my_tab_blast_and_species.txt`.

Merge them and find the __best hit__ (the one that maximizes the _bit score_, provided that the _e-value_ surpasses certain quality threshold) for each read.

See the file `explore_blast_tables.r` for details. The output of the script is 
[here](explore_blast_tables.html).


Homework
================================================================================

Find your dataset in the folder [datos](datos) and find which are the __tree__ species more abundant in it.

Which are the concentrations of each of them in percentage?
