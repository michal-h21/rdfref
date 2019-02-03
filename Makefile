packages = $(wildcard *.sty)
package_name = rdfref
build_dir = build
dist_dir = $(build_dir)/$(package_name)
doc_name = $(package_name)-doc
doc_pdf = $(doc_name).pdf
doc_src = $(doc_name).tex

VERSION:= $(shell git --no-pager describe --abbrev=0 --tags --always )
DATE := $(firstword $(shell git --no-pager show --date=short --format="%ad" --name-only))

.all: $(doc_pdf)

$(doc_pdf): $(doc_src)
	latexmk -pdf -pdflatex='lualatex "\def\version{${VERSION}}\def\gitdate{${DATE}}\input{%S}"' $<



build: $(doc_pdf)
	@rm -rf $(build_dir)
	@mkdir -p $(dist_dir)
	@cp $(packages) $(doc_pdf) $(doc_src) $(dist_dir)
