# The book

This folder holds the Quarto book for *Crimes Against Causality*. **Almost
nothing in here is edited by hand** — the chapters are generated from the
Markdown in [`../case-studies/`](../case-studies) by
[`../scripts/build-book.R`](../scripts/build-book.R).

## What authors edit

| You want to…                     | Edit…                                                        |
|----------------------------------|-------------------------------------------------------------|
| Change a case (text, exhibits, questions, answers, sources) | `case-studies/NN-slug/case-file*.md` |
| Add a new case                   | a new `case-studies/NN-slug/` folder (see below)            |
| Change the detectives / world    | `case-studies/detectives.md`, `case-studies/lore.md`        |
| Change the preface / how-to-read | `book/index.qmd`, `book/intro/how-to-read.qmd`              |
| Change colours / styling         | `book/theme.scss`                                           |
| Change the book title / authors  | the `BOOK` list at the top of `scripts/build-book.R`        |

Everything else under `book/` (`cases/`, `solutions/`, `overview.qmd`,
`references.qmd`, `appendix-index.qmd`, `intro/detectives.qmd`,
`intro/world.qmd`, `_quarto.yml`) is **generated** and carries a
`DO NOT EDIT` banner. Re-running the build overwrites it.

## Anatomy of a case file

Each `case-file*.md` starts with YAML front matter, then the usual sections.
The build script splits the file at the **Answers** heading: everything above
becomes a chapter in *The Cases*; everything from *Answers* down becomes the
matching chapter in *The Solutions*.

```markdown
---
number: 7                       # case number (controls order & numbering)
slug: my-new-case               # url-friendly id
title: "My New Case"            # display title
detective: "Nora Nightingale"   # Wilbert Wright | Nora Nightingale
difficulty: 2                   # 1 = Easy, 2 = Medium, 3 = Hard
topics: [Machine learning, Public health]   # free-form tags
fallacies: [Base rate neglect]              # free-form tags
summary: "One-line hook shown in the overview table."
---

# My New Case

## The crime scene
...narrative...

## Exhibit 1: ...
![caption](some-chart.png)      # local images are copied into the book

## The interrogation
1. ...
2. ...

## Answers                      # <- everything from here is the SOLUTION
1. ...

## What went wrong
...

## Background
...

## Sources
- Author, A. (2024). Title. *Journal*.
```

Notes:

- The split looks for a heading whose text starts with **"Answer"** (any heading
  level, inline HTML like `<span>`/`<br>` is tolerated and cleaned up).
- Local image paths are resolved relative to the case folder, copied into the
  book, and de-duplicated by prefixing the case number. Remote (`http`) images
  are left untouched. Auxiliary files (`.R`, `.csv`, data) are ignored.
- Lines in each case's **Sources** section are collected into the combined
  bibliography at the back of the book.
- Tags feed the overview table and the back-of-book **Index**.

## Building & previewing

You need [Quarto](https://quarto.org/docs/get-started/) installed.

```bash
make build      # regenerate book/ from case-studies/
make preview    # build, then open a live preview
make render     # build, then render the static site to book/_book
make clean      # remove generated chapters and rendered output
```

(Or run the steps directly: `Rscript scripts/build-book.R` then
`quarto preview book` / `quarto render book`.)

The rendered website lands in `book/_book/` (git-ignored). To publish on GitHub
Pages, either push `book/_book` to a `gh-pages` branch
(`quarto publish gh-pages book`) or change `output-dir` in the `_quarto.yml`
template inside `scripts/build-book.R` to `../docs` and serve `/docs` from
`main`.
