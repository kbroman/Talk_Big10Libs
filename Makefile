STEM = oa2023

all: $(STEM).pdf notes web
notes: $(STEM)_notes.pdf

$(STEM).pdf: $(STEM).tex header.tex
	xelatex $<

$(STEM)_notes.pdf: $(STEM)_notes.tex header.tex
	xelatex $(STEM)_notes
	pdfnup $(STEM)_notes.pdf --no-landscape --nup 1x2 --paper letter --frame true --scale 0.9
	mv $(STEM)_notes-nup.pdf $(STEM)_notes.pdf

$(STEM)_notes.tex: $(STEM).tex Ruby/createVersionWithNotes.rb
	Ruby/createVersionWithNotes.rb $(STEM).tex $(STEM)_notes.tex

web: docs/$(STEM).pdf docs/$(STEM)_notes.pdf

docs/%.pdf: %.pdf
	cp $< $@

clean:
	rm *.aux *.log *.nav *.out *.pdf *.snm *.toc
	rm *_notes.*
