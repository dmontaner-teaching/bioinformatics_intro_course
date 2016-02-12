% NOCIONES BÁSICAS DE BIOINFORMÁTICO Y GENÓMICA
% Examen convocatoria 1
% 15-06-2015

--------------------------------------------------------------------------------

Nombre:

DNI:

--------------------------------------------------------------------------------

Tiempo para realizar el examen 60 minutos.

Cada pregunta respondida de forma correcta suma 0.5 en un total de 10 puntos.

Indicar el nombre en todas las hojas.

--------------------------------------------------------------------------------


1. Si queremos obtener una colección completa de todos los transcritos que se han estudiado hasta el momento
por parte de la comunidad científica tendremos que: 
    - Recopilar toda la información de GenBank, del European Nucleotide Archive (ENA) y del DNA Data Bank of Japan (DDBJ)
    porque son bases de datos independientes que mantienen la información.
    + Basta con tomar los datos de una de las bases de datos GenBank, ENA o DDBJ ya que entre ellas comparten la información
    y generan un repositorio conjunto, el International Nucleotide Sequence Database Collaboration.
    - Habrá que buscar en miles de paginas que contienen este tipo de secuencias.
    - Buscaremos en GEO que es donde realmente están los datos experimentales de secuencias.

1. ¿Cuál es la diferencia entre GenBank y refSeq?
    - GeneBank es una base de datos de genes y refSeq contiene las proteínas que generan estos transcritos.
    - GeneBank es una base de datos de proteínas y refSeq contiene los transcritos hipotéticos que generan estas proteínas.
    + GeneBank contiene información que puede estar repetida y refSeq cura esta información para que las secuencias que contiene sean únicas.
    - No hay ninguna diferencia, son dos formas de llamar a la misma base de datos.

1. El formato de ficheros GFF
    - No existe como tal en genómica.
    + Se utiliza para anotar cualquier tipo de región de otro fichero complementario que contiene información de una secuencia genómica, por ejemplo un fichero fasta.
    - Es una forma alternativa de guardar la información de las secuencias que normalmente se genera como fichero fasta.
    - Es como un fichero fasta pero comprimido para que ocupe menos memoria.

1. Un SNP ¿Puede estar repetido en varias posiciones del genoma?
    - Si aunque no es muy común pero pasa igual que en algunos genes que están duplicados. 
    + No, por definición.
    - Si de hecho va siempre duplicado porque hay una pareja de cromosomas de cada tipo.
    - Depende de la especie a la que nos refiramos.

1. ¿Que es BioMart?
    - El portal de entrada a Ensembl para hacer búsquedas masivas de datos.
    - Un algoritmo de alineamiento múltiple.
    - Un lenguaje de programación orientado a objetos biológicos.
    + Un formato estandarizado de almacenar y servir datos genómicos.

1. El Gene Ontology ...
    - no está definido para plantas.
    - es una base de datos de microarrays.
    + es un consorcio que pretende organizar toda la información conocida sobre los procesos biológicos existentes en cualquiera de las especies.
    - es un consocio que intenta estructurar la información de los diversos procesos metabólicos de forma que se puedan utilizar los modelos de biología de sistemas.

1. Blast es un algoritmo de alineamiento: 
    + local
    - global
    - que puede hacerse de forma local o global según ajustemos los parámetros del método
    - que cada vez se utiliza menos porque hay mapeadores mas rápidos.

1. Para realizar un Blast necesitamos, aparte de las secuencias que queremos estudiar:
    - un fichero fasta que debe de estar comprimido.
    - mucha memoria ram en la maquina en la que vayamos a ejecutarlo.
    + un fichero fasta previamente indexado.
    - un fichero HTML que tenga un formulario para introducir nuestros datos.

1. Cuando utilizamos información del Gene Ontology hay que propagarla correctamente para todos los genes...
    + sobre todo para realizar análisis estadísticos porque la información anotada directamente no cubre todos los nodos del DAG sino el mas específico.
    - porque así todo el mundo se entera mejor.
    - porque así podemos tener la información mas completa no sólo de los "procesos biológicos" sino también de la "componente celular" y de la "función molecular"
    - para poder reconstruir la estructura de DAG (gráfico acíclico dirigido) para la especie en la que estamos interesados.

1. Ensembl ...
    - es una de las bases de datos en las que los investigadores pueden subir sus nuevas secuencias y publicarlas.
    - sólo contiene información curada manualmente.
    - sólo contiene información generada mediante algoritmos de predicción.
    + es un repositorio general de datos para genomas ya anotados.

1. Ensembl ...
    - contiene sobre todo información de plantas.
    - contiene sobre todo información de bacterias.
    + contiene sobre todo información de eucariotas.
    - contiene sobre todo información de humano, ratón y mosca.

1. Buscar la correspondencia entre los identificadores de genes de diferentes bases de datos como Ensembl o refSeq
    - es trivial porque las dos bases de datos mantienen la misma información.
    + es a veces complicado por los diferentes tipos de curación de los datos.
    - no se puede hacer porque la información está completamente separada.
    - no tiene sentido porque normalmente se utiliza una base de datos o la otra pero no las dos.

1. Blast es un algoritmo que sirve para buscar similitudes entre:
    - proteínas
    - secuencias de nucleótidos
    - proteínas, secuencias de nucleótidos
    + proteínas, secuencias de nucleótidos e incluso entre secuencias de proteínas y secuencias de nucleótidos (estos últimos traducidos en proteínas)

1. ¿Que es indexar un genoma de referencia para poder realizar un alineamiento usando Blast?
    - Comprimir la referencia para que ocupe menos.
    + Generar una serie de ficheros complementarios que luego el algoritmo de búsqueda utiliza para ser mas eficiente.
    - Indexar genomas no tiene nada que ver con Blast sino con PubMed.
    - Es el paso final de refinamiento de la búsqueda de nuestra secuencia de interés en la secuencia de referencia.

1. ¿Es preferible utilizar la aplicación web de Blast disponible en el NCBI antes que una instalación local?
    + Depende del análisis que vayamos a realizar y de los recursos computacionales de los que dispongamos localmente.
    - Sí porque así no tenemos que instalar el software.
    - Sí porque así no tenemos que descargar la base de datos e indexarla.
    - En realidad es mucho mas eficiente usar la implementación del Blast que tienen en Ensembl porque la del NCBI es bastante lenta.

1. UniProt ...
    - recopila información de la secuencia de las proteínas.
    - registra la relación entre genes y proteínas de una misma especie.
    + recopila información de la secuencia de las proteínas y también de su función biológica.
    - recopila información de la función de las proteínas y luego la comparte con el Gene Ontology.

2. UniProt ...
    - es una única base de datos de reciente creación.
    + es la evolución de un consorcio de bases de datos previas y esto se refleja en la propia organización de los datos. 
    - es una ontología biológica sobre proteínas.
    - recopila información de la función de las proteínas y luego la comparte con el Gene Ontology.

1. Bioconductor ...
    - es la versión empresarial y de pago del software de análisis estadístico de datos R.
    + es un repositorio de librerías programadas en el lenguaje R.
    - es una base de datos biológicos y experimentales.
    - es una colección de herramientas para hacer análisis de datos de microarrays.

1. ¿Que diferencia hay entre los SNPs registrados en dbSNP como ss# y rs#?
    - Por motivos históricos se mantiene la notación ss# para humano y rs# para el resto de las especies.
    - Por motivos históricos se mantiene la notación rs# para humano y ss# para el resto de las especies.
    + ss# se utiliza para cualquier SNP reportado por los investigadores mientras que rs# se mantiene para las secuencias curadas y validadas.
    - Es solo una nomenclatura arbitraria para que no se repita el identificador de los diferentes SNPs.

2. Cuando utilizamos la información de posiciones genómicas indicada en un fichero GFF...
    - podremos extraer las secuencias genómicas correspondientes a las regiones a partir de cualquier fichero fasta que sea de la misma especie.
    - podremos extraer las secuencias genómicas correspondientes a las regiones a partir de cualquier fichero fasta que sea de la misma especie y año.
    + es importante conocer la referencia exacta (fichero fasta) al que hace referencia el GFF.
    - no sera necesario volver al fichero fasta que se utilizo para generar el GFF ya que toda la información de la secuencia esta ya contenida en el propio GFF.
    







<!-- ---------------------------------------------------------------------------

1. La base de datos "taxonomy" del NCBI ...
    - es una base de datos obsoleta que ya no se usa pero se mantiene online.
    - contiene la información 
    + intenta clasificar de forma eficiente especies y su agrupación en genero, familia, filum ...
    - es un repositorio de datos experimentales.

1. ¿Para que sirve un Genome Browsers?
    - Para hacer mas atractiva una base de datos genómica.
    + Para poder tener una representación visual útil de las diferentes entidades asociadas a un genoma.
    - Para no tener que descargar los datos genómicos de los repositorios ya que no se puede trabajar con ellos de forma local por el gran tamaño de memoria requerido.
    - Para realizar análisis de datos genómicos.

-->
