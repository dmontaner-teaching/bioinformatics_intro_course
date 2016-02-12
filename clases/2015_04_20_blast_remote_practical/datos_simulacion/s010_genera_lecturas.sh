##s010_genera_lecturas.sh
##2014-03-30 dmontaner@cipf.es
##simulate single ends reads form transcriptomes

##simulate reads with lenght 90 so that the 100 is not confused wtith some other parameters

## Execute (to capture output):
## time ./s010_genera_lecturas.sh 2> s010_genera_lecturas.log  ##log


rm lecturas_simuladas/*

dwgsim -N 10000 -1 90 -2 0 -y 0 -r 0 -z 20140331 fastas_originales_ensembl/Danio_rerio.Zv9.75.cdna.all.fa     lecturas_simuladas/Danio
dwgsim -N 10000 -1 90 -2 0 -y 0 -r 0 -z 20140331 fastas_originales_ensembl/Homo_sapiens.GRCh37.75.cdna.all.fa lecturas_simuladas/Homo
dwgsim -N 10000 -1 90 -2 0 -y 0 -r 0 -z 20140331 fastas_originales_ensembl/Mus_musculus.GRCm38.75.cdna.all.fa lecturas_simuladas/Mus

fastq_to_fasta -r -i lecturas_simuladas/Danio.bwa.read1.fastq -o lecturas_simuladas/Danio.fa
fastq_to_fasta -r -i lecturas_simuladas/Homo.bwa.read1.fastq  -o lecturas_simuladas/Homo.fa
fastq_to_fasta -r -i lecturas_simuladas/Mus.bwa.read1.fastq   -o lecturas_simuladas/Mus.fa

grep -c ">" lecturas_simuladas/*.fa
