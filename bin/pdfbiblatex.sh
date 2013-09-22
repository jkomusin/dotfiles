#!/bin/sh

# Note: Filename input as argument should be filename of .tex file without extension (for use with bibtex)
FILENAME=$1

pdflatex $FILENAME -halt-on-error
bibtex $FILENAME
pdflatex $FILENAME
pdflatex $FILENAME
open $FILENAME.pdf
