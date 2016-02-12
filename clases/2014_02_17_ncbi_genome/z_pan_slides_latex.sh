# pan_slides_latex.sh
# 2013-11-19 dmontaner@cipf.es
# Run Pandoc for slides

## Pandoc templates are located here:
## /home/dmontaner/.cabal/share/pandoc-1.12.2.1/data/templates/
## emacs /home/dmontaner/.cabal/share/pandoc-1.12.2.1/data/templates/default.beamer

################################################################################

# pandoc -h
# pandoc [OPTIONS] [FILES]

# Input formats:  docbook, haddock, html, json, latex, markdown, markdown_github,
#                 markdown_mmd, markdown_phpextra, markdown_strict, mediawiki,
#                 native, opml, rst, textile
# Output formats: asciidoc, beamer, context, docbook, docx, dzslides, epub, epub3,
#                 fb2, html, html5, json, latex, man, markdown, markdown_github,
#                 markdown_mmd, markdown_phpextra, markdown_strict, mediawiki,
#                 native, odt, opendocument, opml, org, pdf*, plain, revealjs,
#                 rst, rtf, s5, slideous, slidy, texinfo, textile
#                 [*for pdf output, use latex or beamer and -o FILENAME.pdf]

# Options:
#   -f FORMAT, -r FORMAT  --from=FORMAT, --read=FORMAT                    
#   -t FORMAT, -w FORMAT  --to=FORMAT, --write=FORMAT                     
#   -o FILENAME           --output=FILENAME                               
#                         --data-dir=DIRECTORY                            
#                         --strict                                        
#   -R                    --parse-raw                                     
#   -S                    --smart                                         
#                         --old-dashes                                    
#                         --base-header-level=NUMBER                      
#                         --indented-code-classes=STRING                  
#   -F PROGRAM            --filter=PROGRAM                                
#                         --normalize                                     
#   -p                    --preserve-tabs                                 
#                         --tab-stop=NUMBER                               
#   -s                    --standalone                                    
#                         --template=FILENAME                             
#   -M KEY[:VALUE]        --metadata=KEY[:VALUE]                          
#   -V KEY[:VALUE]        --variable=KEY[:VALUE]                          
#   -D FORMAT             --print-default-template=FORMAT                 
#                         --print-default-data-file=FILE                  
#                         --no-wrap                                       
#                         --columns=NUMBER                                
#                         --toc, --table-of-contents                      
#                         --toc-depth=NUMBER                              
#                         --no-highlight                                  
#                         --highlight-style=STYLE                         
#   -H FILENAME           --include-in-header=FILENAME                    
#   -B FILENAME           --include-before-body=FILENAME                  
#   -A FILENAME           --include-after-body=FILENAME                   
#                         --self-contained                                
#                         --offline                                       
#   -5                    --html5                                         
#                         --html-q-tags                                   
#                         --ascii                                         
#                         --reference-links                               
#                         --atx-headers                                   
#                         --chapters                                      
#   -N                    --number-sections                               
#                         --number-offset=NUMBERS                         
#                         --no-tex-ligatures                              
#                         --listings                                      
#   -i                    --incremental                                   
#                         --slide-level=NUMBER                            
#                         --section-divs                                  
#                         --default-image-extension=extension             
#                         --email-obfuscation=none|javascript|references  
#                         --id-prefix=STRING                              
#   -T STRING             --title-prefix=STRING                           
#   -c URL                --css=URL                                       
#                         --reference-odt=FILENAME                        
#                         --reference-docx=FILENAME                       
#                         --epub-stylesheet=FILENAME                      
#                         --epub-cover-image=FILENAME                     
#                         --epub-metadata=FILENAME                        
#                         --epub-embed-font=FILE                          
#                         --epub-chapter-level=NUMBER                     
#                         --latex-engine=PROGRAM                          
#                         --bibliography=FILE                             
#                         --csl=FILE                                      
#                         --citation-abbreviations=FILE                   
#                         --natbib                                        
#                         --biblatex                                      
#   -m[URL]               --latexmathml[=URL], --asciimathml[=URL]        
#                         --mathml[=URL]                                  
#                         --mimetex[=URL]                                 
#                         --webtex[=URL]                                  
#                         --jsmath[=URL]                                  
#                         --mathjax[=URL]                                 
#                         --gladtex                                       
#                         --dump-args                                     
#                         --ignore-args                                   
#   -v                    --version                                       
#   -h                    --help                                          

################################################################################

## Templates
## -s, --standalone
## Produce output with an appropriate header and footer

################################################################################

## PARAMETERS

myfile="2014_02_17_ncbi_genomes"


## COMPILAMOS
refs="../000_commons/refs.md"
my_beamer_template="../000_commons/latex_beamer_template_nociones_basicas"

mkdir aux

pandoc -f markdown -t beamer -o aux/slides_pandoc_basico.pdf slides.md $refs 
pandoc -f markdown -t beamer -o aux/slides.tex               slides.md $refs

pdflatex -output-directory=aux $my_beamer_template.tex

mv aux/`basename $my_beamer_template`.pdf $myfile.pdf

################################################################################

#-R  ??

#--standalone       --slide-level=2                      -V revealjs-url:reveal.js-2.6.1 -V theme:beige -V transition:cube  

## --template Implies --standalone.
## -s, --standalone
## Produce output with an appropriate header and footer 
# By default, the slide level is the highest header level in the hierarchy that is followed immediately by content

## Note: in reveal.js slide shows, if slide level is 2, a two-dimensional layout will be produced,

### HTML #######################################################################

## usar el --standalone si al final no uso ningun template mio
## CIDADO CON EL ORDEN DE ALGUNOS PARAMETROS QUE SI QUE IMPORTA

# pandoc --standalone       --slide-level=2                      -V revealjs-url:reveal.js-2.6.1 -V theme:beige -V transition:cube  -f markdown -t revealjs -o diapos00.html  slides.md
# pandoc --standalone                                            -V revealjs-url:reveal.js-2.6.1 -V theme:beige -V transition:cube  -f markdown -t revealjs -o diapos0.html   slides.md
# pandoc --standalone                             --section-divs -V revealjs-url:reveal.js-2.6.1 -V theme:beige -V transition:cube  -f markdown -t revealjs -o diapos1.html   slides.md 
# pandoc --standalone --template=default.revealjs --section-divs -V revealjs-url:reveal.js-2.6.1 -V theme:beige -V transition:cube  -f markdown -t revealjs -o diapos1b.html   slides.md   ##PARECE EL MEJOR  
# pandoc --standalone                             --section-divs -V revealjs-url:reveal.js-2.6.1 -V theme:beige -V transition:cube  -f markdown -t revealjs -o diapos1c.html   slides.md   ##PARECE EL MEJOR  
# pandoc --standalone --template=default.revealjs --section-divs -V revealjs-url:reveal.js-2.6.1 -V theme:beige -V transition:cube  -f markdown -t html5    -o diapos2.html   slides.md
# pandoc              --template=default.revealjs --section-divs -V revealjs-url:reveal.js-2.6.1 -V theme:beige -V transition:cube  -f markdown -t html5    -o diapos3.html   slides.md

# #pandoc --standalone --template=default.revealjs --section-divs -V revealjs-url:reveal.js-2.6.1 -V theme:defalut -V transition:cube  -f markdown -t revealjs -o diapos1b.html   slides.md 
