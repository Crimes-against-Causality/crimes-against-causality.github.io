# Crimes Against Causality — book build
#
#   make build     regenerate book/ from the case-studies/ Markdown
#   make preview   build, then open a live-reloading preview
#   make render    build, then render the static site into book/_book
#   make clean      remove generated chapters and rendered output

.PHONY: build preview render clean

build:
	Rscript scripts/build-book.R

preview: build
	quarto preview book

render: build
	quarto render book

clean:
	rm -rf book/_book
	rm -rf book/cases book/solutions
	rm -f book/references.qmd book/appendix-index.qmd book/_quarto.yml
	rm -f book/intro/detectives.qmd book/intro/world.qmd
