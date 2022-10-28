STEM = oa2022

$(STEM).pdf: $(STEM).tex header.tex
	xelatex $<

web: $(STEM).pdf
	scp $(STEM).pdf adhara.biostat.wisc.edu:Website/presentations/$(STEM)2019.pdf
