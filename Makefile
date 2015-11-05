
%.dvi: %.tex
	tex $<

%.ps: %dvi
	dvips $<

%.pdf: %.ps
	ps2pdf $<

all: directory.pdf directory_for_printer.pdf

directory.ps: directory-no-blanks.dvi
	dvips -o $@ $<

directory-no-blanks.dvi: directory.dvi
	dvidvi -i 1..15 -i 18..32 $< $@

directory_for_printer.pdf: directory_for_printer.ps
	ps2pdf $< directory_for_printer_content.pdf
	pdf270 map.pdf
	pdfunite directory_for_printer_content.pdf map-rotated270.pdf $@
	rm directory_for_printer_content.pdf map-rotated270.pdf

directory_for_printer.ps: directory_for_printer.dvi
	dvips -T11in,8.5in $<

directory_for_printer.dvi: directory.dvi
	dvidvi -m '32:31(0.000,0),0(5.500,0)' $< .directory_for_printer-a.dvi
	dvidvi -m '32:1(0.000,0),30(5.500,0)' $< .directory_for_printer-b.dvi
	dvidvi -m '32:29(0.015,0),2(5.485,0)' $< .directory_for_printer-c.dvi
	dvidvi -m '32:3(0.015,0),28(5.485,0)' $< .directory_for_printer-d.dvi
	dvidvi -m '32:27(0.030,0),4(5.470,0)' $< .directory_for_printer-e.dvi
	dvidvi -m '32:5(0.030,0),26(5.470,0)' $< .directory_for_printer-f.dvi
	dvidvi -m '32:25(0.045,0),6(5.455,0)' $< .directory_for_printer-g.dvi
	dvidvi -m '32:7(0.045,0),24(5.455,0)' $< .directory_for_printer-h.dvi
	dvidvi -m '32:23(0.060,0),8(5.440,0)' $< .directory_for_printer-i.dvi
	dvidvi -m '32:9(0.060,0),22(5.440,0)' $< .directory_for_printer-j.dvi
	dvidvi -m '32:21(0.075,0),10(5.425,0)' $< .directory_for_printer-k.dvi
	dvidvi -m '32:11(0.075,0),20(5.425,0)' $< .directory_for_printer-l.dvi
	dvidvi -m '32:19(0.090,0),12(5.410,0)' $< .directory_for_printer-m.dvi
	dvidvi -m '32:13(0.090,0),18(5.410,0)' $< .directory_for_printer-n.dvi
	dvidvi -m '32:17(0.105,0),14(5.395,0)' $< .directory_for_printer-o.dvi
	dviconcat -o $@ .directory_for_printer-?.dvi
	rm .directory_for_printer-?.dvi

directory.tex: directory.csv csv2tex
	./csv2tex <$< >$@
	if [ -f $*.patch ]; then \
		cp -p $@ $*-orig.tex; \
		patch $@ $*.patch; \
	fi

clean:
	rm -f *.tex *.dvi *.log *.ps directory*.pdf
