RCSFLAGS= -l
MAIN= paper
TEXPARTS= *.tex
BIBPARTS= *.bib
LPR = pspr # or change to 'qpr -q ps3'
POSTSCRIPT= dvips
FIGPARTS= FIG

$(MAIN).ps: $(MAIN).dvi
	$(POSTSCRIPT) $(MAIN).dvi > $(MAIN).ps

$(MAIN).dvi: $(MAIN).tex
	latex $(MAIN).tex
	bibtex $(MAIN)
	latex $(MAIN).tex
	latex $(MAIN).tex

print: $(MAIN).ps
	$(LPR) $(MAIN).ps


checkout:
	co $(RCSFLAGS) $(MAIN).tex $(TEXPARTS)

checkin:
	ci $(RCSFLAGS) -f $(MAIN).tex $(TEXPARTS)

unlock:
	rcs -u  $(TEXPARTS)

clean:
	\rm -f *.dvi *.bbl *.aux *.log *.blg *.toc

spotless: clean
	\rm -f $(MAIN).ps


all.tar:
	tar cvfh all.tar makefile $(MAIN).tex $(TEXPARTS) $(BIBPARTS) \
	$(FIGPARTS) README

bundle.all: $(TEXPARTS) 
	bundle  README $(TEXPARTS) $(BIBPARTS) makefile > bundle.all
