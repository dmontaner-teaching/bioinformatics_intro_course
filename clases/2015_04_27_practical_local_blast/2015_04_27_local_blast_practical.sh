makeblastdb -in hsa_21.fa -dbtype nucl 
blastn -db hsa_21.fa -query mytranscripts.fa -out salida
blastn -db hsa_21.fa -query mytranscripts.fa -out salida5 -outfmt 5
blastn -db hsa_21.fa -query mytranscripts.fa -out salida6 -outfmt 6
blastn -db hsa_21.fa -query mytranscripts.fa -out salida7 -outfmt 7
blastn -db hsa_21.fa -query mytranscripts.fa -out salida11 -outfmt 11
blastn -db hsa_21.fa -query mytranscripts.fa -out salida9  -outfmt 9
blast_formatter -archive salida11 -outfmt 6 -out my_tab_blast.txt

time blastn -db hsa_21.fa -query havana_21.fa -out salida_havana -outfmt 9
time blastn -db hsa_21.fa -query havana_21.fa > salida

time blastn -db hsa_21.fa -query havana_21.fa -num_threads 4 > salida
time blastn -db hsa_21.fa -query havana_21.fa -num_threads 4 -max_target_seqs 1 > salida 
head -n 1000 havana_21.fa | grep ">"
head -n 100 havana_21.fa | grep ">"

time head -n 100  havana_21.fa | blastn -db hsa_21.fa -outfmt 6 -out salida_small
time head -n 1000 havana_21.fa | blastn -db hsa_21.fa -outfmt 6 -out salida_small
