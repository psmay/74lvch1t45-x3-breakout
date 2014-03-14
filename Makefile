
PROJECT=74lvch1t45-x3-breakout
SCHEMATIC_PDF=$(PROJECT)-schematic.pdf
LAYOUT_PDF=$(PROJECT)-layout.pdf

default: schematic-pdf layout-pdf

clean:
	rm -f .tmp.* *.ps *.pdf *.net *.pcb-

schematic-pdf: $(SCHEMATIC_PDF)

$(SCHEMATIC_PDF): $(PROJECT).sch
	gaf export -o $@ $^

layout-pdf: $(LAYOUT_PDF)

$(LAYOUT_PDF): $(PROJECT).pcb
	pcb -x ps --psfile $$-layout.tmp.ps $^
	ps2pdf $$-layout.tmp.ps $@
	rm -f $$-layout.tmp.ps
