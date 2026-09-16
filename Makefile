LANGS := de en
PDFS := $(addprefix cv.,$(addsuffix .pdf,$(LANGS)))

INDIVIDUAL_MD := $(wildcard individual/*.md)
INDIVIDUAL_PDFS := $(INDIVIDUAL_MD:.md=.pdf)

# macOS ships Helvetica Neue; CI (Linux) has no access to it, so override
# with e.g. `make MAINFONT="Liberation Sans"` there.
MAINFONT ?= Helvetica Neue

PANDOC_FLAGS := \
	--pdf-engine=xelatex \
	--template=cv-template.tex \
	--lua-filter=rule.lua \
	-V geometry:margin=2.2cm \
	-V mainfont="$(MAINFONT)" \
	-V fontsize=11pt \
	-V colorlinks=true \
	-V linkcolor=accent \
	-V urlcolor=accent \
	-V linestretch=1.15

.PHONY: all pdf clean de en individual

all: pdf individual

pdf: $(PDFS)

de: cv.de.pdf
en: cv.en.pdf

individual: $(INDIVIDUAL_PDFS)

cv.%.pdf: cv.%.md cv-template.tex rule.lua
	pandoc $< -o $@ $(PANDOC_FLAGS)

individual/%.pdf: individual/%.md cv-template.tex rule.lua
	pandoc $< -o $@ -f markdown+hard_line_breaks+raw_tex $(PANDOC_FLAGS) -V parskip=20pt

clean:
	rm -f $(PDFS) $(INDIVIDUAL_PDFS)
