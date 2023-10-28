TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
BIB = bibtex
FILE = ln_diss

.SUFFIXES: .bib .pdf .tex
.PHONY: clean

all : $(FILE).pdf

$(FILE).pdf: $(FILE).tex $(FILE).bbl
	$(TEX) $(FILE).tex
	$(TEX) $(FILE).tex

$(FILE).bbl: $(FILE).aux
	$(BIB) $(FILE).aux

$(FILE).aux: $(FILE).bib
	$(TEX) $(FILE).tex
	$(TEX) $(FILE).tex

clean: 
	rm -rf *.aux *.loa *.lof *.log *.lot *.toc *.bbl *.blg
