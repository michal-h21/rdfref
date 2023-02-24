packages = $(wildcard *.sty)
package_name = rdfref
build_dir = build
dist_dir = $(build_dir)/$(package_name)
doc_name = $(package_name)-doc
doc_pdf = $(doc_name).pdf
doc_src = $(doc_name).tex
example_name = theorems-sample
example_src = $(example_name).tex
example_pdf = $(example_name).pdf
example_dot = $(example_name).dot
example_graph = $(example_name)-graph.tex
TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/rdfref

VERSION:= $(shell git --no-pager describe --abbrev=0 --tags --always )
DATE := $(firstword $(shell git --no-pager show --date=short --format="%ad" --name-only))

.PHONY : all
all: $(doc_pdf) $(example_pdf)

$(doc_pdf): $(doc_src)
	latexmk -pdf -pdflatex='lualatex "\def\version{${VERSION}}\def\gitdate{${DATE}}\input{%S}"' $<

$(example_pdf): $(example_src)
	pdflatex $<
	pdflatex $<
	dot -Txdot $(example_dot) | dot2tex --figonly > $(example_graph)
	pdflatex $<


build: $(doc_pdf)
	@rm -rf $(build_dir)
	@mkdir -p $(dist_dir)
	@cp $(packages) $(doc_pdf) $(doc_src) $(dist_dir)

install: $(doc_pdf)
	mkdir -p $(INSTALL_DIR)
	cp $(packages) $(doc_pdf) $(INSTALL_DIR)
