##genera_datasets_alumnos.r
##2014-03-30 dmontaner@cipf.es
##2015-04-20 dmontaner@cipf.es
##generamos los datasets para los alumnos

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.0.2 (2013-09-25)"
library (ShortRead); packageDescription ("ShortRead", fields = "Version") #"1.20.0"

set.seed (20140331)
N <- 30


##NOMBRES ALUMNOS
load ("/home/dmontaner/Documents/UV_master/mis_cursos/NOCIONES_BASICAS_2014_2015/logistica/lista_estudiantes.RData")
ls ()

alumnos <- c (estudiantes$ids, rep ("na", times = N - length (estudiantes$ids)))
alumnos <- paste (1:30, alumnos, sep = "_")
alumnos


###DATOS
setwd ("/home/dmontaner/Documents/UV_master/mis_cursos/NOCIONES_BASICAS_2014_2015/clases_preparacion/2015_04_20_blast_remote_practical/datos_simulacion/lecturas_simuladas")
dir ()

dan <- readFasta ("Danio.fa")
hsa <- readFasta ("Homo.fa")
mus <- readFasta ("Mus.fa")

dan <- sread (dan)
hsa <- sread (hsa)
mus <- sread (mus)

nombres <- sample (1:30000, size = 30000)

names (dan) <- nombres[    1:10000]
names (hsa) <- nombres[10001:20000]
names (mus) <- nombres[20001:30000]

intersect (names (dan), names (hsa))
intersect (names (dan), names (mus))

dan
hsa
mus

################################################################################

###PROPORCIONES
proporciones <- matrix (NA, nrow = N, ncol = 3)
colnames (proporciones) <- c("dan", "hsa", "mus")
##
for (i in 1:N) {
    sm <- sort (sample (1:100, size = 2))
    proporciones[i,] <- c (sm[1], sm[2] - sm[1], 100 - sm[2])
}

conteos <- 3 * proporciones
rownames (conteos) <- alumnos
rownames (proporciones) <- alumnos
conteos
proporciones

###SALVAMOS
save (list = "conteos", file = "/home/dmontaner/Documents/UV_master/mis_cursos/NOCIONES_BASICAS_2014_2015/clases_preparacion/2015_04_20_blast_remote_practical/datos_simulacion/conteos_simulados.RData")


################################################################################

###DATOS PRACTICA
setwd ("/home/dmontaner/Documents/UV_master/mis_cursos/NOCIONES_BASICAS_2014_2015/clases_preparacion/2015_04_20_blast_remote_practical/datos")
dir ()

for (i in 1:N) {
    dan0 <- dan[sample (1:10000, size = conteos[i, "dan"])]
    hsa0 <- hsa[sample (1:10000, size = conteos[i, "hsa"])]
    mus0 <- mus[sample (1:10000, size = conteos[i, "mus"])]

    seqs <- c (dan0, hsa0, mus0)
    
    ## seqs0 <- dan0
    ## seqs0 <- append (seqs0, hsa0)
    ## seqs0 <- append (seqs0, mus0)
    ## identical (seqs, seqs0)  ## OK son iguales

    if (length (seqs) != 300) stop ("numeros")

    writeFasta (seqs, file = paste0 (alumnos[i], ".fa"))
}


###EXIT
warnings ()
sessionInfo ()
q ("no")
