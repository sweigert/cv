# CV

Source for my CV, in German and English.

- [`cv.de.md`](cv.de.md) — German
- [`cv.en.md`](cv.en.md) — English

PDFs are built on every push and published on the [Releases page](../../releases/tag/latest) — grab `cv.de.pdf` / `cv.en.pdf` from there rather than generating your own, unless you're editing the source.

## Building locally

Requires [pandoc](https://pandoc.org/) and a LaTeX distribution with `xelatex` (e.g. [MacTeX](https://www.tug.org/mactex/) on macOS).

```
make        # builds cv.de.pdf and cv.en.pdf
make de     # just the German version
make en     # just the English version
make clean  # remove generated PDFs
```
