# Crimes Against Causality — website backbone
#
#   make cases     clone/update the case content (crimes-against-causality/cases)
#   make build     regenerate book/ from cases/
#   make preview   build, then open a live-reloading preview
#   make render    build, then render the static site into book/_book
#   make clean      remove generated chapters and rendered output

CASES_REPO ?= https://github.com/crimes-against-causality/cases.git

.PHONY: cases build preview render clean

cases:
	@if [ -d cases/.git ]; then \
		echo "Updating cases/ ..."; git -C cases pull --ff-only; \
	else \
		echo "Cloning case content ..."; git clone $(CASES_REPO) cases; \
	fi

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
