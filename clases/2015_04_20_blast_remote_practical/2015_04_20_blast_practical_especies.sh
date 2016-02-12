cd data
head example.fa 

grep -c "^>" example.fa 
grep "^>" example.fa | wc -l 
grep "^>" example.fa > myids.txt
sed -i 's/>//' myids.txt
blast_formatter -help 
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
blast_formatter -rid M4DNEDCY01R -outfmt 6 -out my_tab_blast.txt
blast_formatter -rid M4DNEDCY01R -outfmt "6 qseqid sgi sacc saccver staxids" -out my_tab_blast_and_species.txt


blast_formatter -rid M4DNEDCY01R -outfmt "6 qseqid sgi sacc saccver score staxids" -out my_tab_blast_and_species.txt
blast_formatter -rid M4DNEDCY01R -outfmt "6 qseqid sgi staxids sscinames scomnames sblastnames sskingdoms" -out my_tab_blast_and_species.txt
