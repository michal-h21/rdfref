# The `rdfref` package

This package is inspired by
[RDF](https://en.wikipedia.org/wiki/Resource_Description_Framework). You can
declare custom commands that save various metadata for objects. These metadata
can be then looked up using simple query language.

It doesn't have any documentation yet, but you can see the samples of usage in answers on TeX.sx:

- [Compiling a separate list of "Open Questions" found in the main text in order of appearance](https://tex.stackexchange.com/a/435455/2891)
- [Analysis of cross-reference/link network within a single document](https://tex.stackexchange.com/a/288647/2891)
- [Is there a software in Ubuntu that can analyse the cross references (theorems, lemmas, equations, etc.) in a tex project?](https://tex.stackexchange.com/a/56394/2891))
- [Show graph of references inside a document](https://tex.stackexchange.com/a/171854/2891)
- [Define a command (like table of contents) but for attendees](https://tex.stackexchange.com/a/473193/2891)
- [Output depending on crossreferences](https://tex.stackexchange.com/a/342805/2891)
- [Implementing a very basic index from scratch](https://tex.stackexchange.com/a/653603/2891)


# Installation

You can either clone this repository to your local TEXMF tree (typically `~/texmf/tex/latex` on UNIX like systems), or clone it to any local directory and run the `make install` command.

# Documentation

You can run `make` to create a documentation and example document. You will need [dot2tex](https://github.com/xyz2tex/dot2tex) to make a dependency graph of theorems.
