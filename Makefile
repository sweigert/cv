LANGS := de en
PDFS := $(addprefix cv.,$(addsuffix .pdf,$(LANGS)))

# macOS ships Helvetica Neue; CI (Linux) has no access to it, so override
# with e.g. `make MAINFONT="Liberation Sans"` there.
MAINFONT ?= Helvetica Neue

PANDOC_FLAGS := \
	--pdf-engine=xelatex \
	-V geometry:margin=2.2cm \
	-V mainfont="$(MAINFONT)" \
	-V fontsize=11pt \
	-V colorlinks=true \
	-V linkcolor=blue \
	-V urlcolor=blue \
	-V linestretch=1.15

.PHONY: all pdf clean de en

all: pdf

pdf: $(PDFS)

de: cv.de.pdf
en: cv.en.pdf

cv.%.pdf: cv.%.md
	pandoc $< -o $@ $(PANDOC_FLAGS)

clean:
	rm -f $(PDFS)
