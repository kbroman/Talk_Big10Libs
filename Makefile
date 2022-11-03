STEM = oa2022

$(STEM).pdf: $(STEM).tex header.tex
	xelatex $<

notes: $(STEM)_withnotes.pdf
all: $(STEM).pdf notes web

$(STEM)_withnotes.pdf: $(STEM)_withnotes.tex header.tex
	xelatex $(STEM)_withnotes
	pdfnup $(STEM)_withnotes.pdf --no-landscape --nup 1x2 --paper letter --frame true --scale 0.9
	mv $(STEM)_withnotes-nup.pdf $(STEM)_withnotes.pdf

$(STEM)_withnotes.tex: $(STEM).tex Ruby/createVersionWithNotes.rb
	Ruby/createVersionWithNotes.rb $(STEM).tex $(STEM)_withnotes.tex

web: $(STEM).pdf
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM).pdf
	scp $(STEM)_withnotes.pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM)_withnotes.pdf


clean:
	rm *.aux *.log *.nav *.out *.pdf *.snm *.toc
	rm *_withnotes.*
