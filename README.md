# epub3-boilerplate – e-book template

[EPUB version 3.2](https://www.w3.org/publishing/epub32/epub-spec.html) template, including simplistic, yet universal `css` stylesheet.

## Build

In order to build this e-book, [`7za`](https://www.7-zip.org/download.html) command line tool is required. To generate `mobi` file alongside, [`kindlegen`](https://www.amazon.com/kindleformat/kindlegen)* tool should also be in your PATH.

\* kindlegen has been discontinued. But Windows binary is provided in the releases of this repo.

In [PowerShell](https://github.com/PowerShell/PowerShell):

```
$ ./build.ps1
```

This outputs two files: `template.epub` and `template.mobi` for Kindle.

Validate the package file with [`epubcheck`](https://github.com/w3c/epubcheck):

```
$ java -jar "/path/to/epubcheck.jar" "./template.epub"
```

## Word count

To get the number of words from html source use the provided PHP script:

```
$ php ./count-words.php "./template/Content/text/ch*.xhtml"
```

Use the number in OPF:

```html
    <meta property="schema:wordCount">{{word_count}}</meta>
```

### Reading time hint

This can be calculated as a number of words divided by an average reading speed (250 words per minute for an adult).

### Words per page

In novels there are around 250-350 words per page.

```html
    <meta property="schema:numberOfPages">{{number_of_pages}}</meta>
```

## Asterism

Due to poor Unicode and CSS support in most e-readers, I found that the best way to have safe and nice looking asterism is to use asterisk operator (U+2217) from the Unicode Math category. Tested on Kindle and Kobo:

```html
<div class="asterism large">∗ ∗ ∗</div>
```

## Fonts

My favourite serif fonts for long reading:

- Bookerly – Default Kindle font. This is the main reason *not* to embed any serif fonts in epub package, but to leave e-reader's default.
- [Literata](https://github.com/googlefonts/literata) – Google font (free).
- [Crimson Pro](https://fontsarena.com/crimson-pro-by-sebastian-kosch-jacques-le-bailly/) – Sebastian Kosch & Jacques Le Bailly (free).
- [Georgia](https://docs.microsoft.com/typography/font-list/georgia) – Classic font from Microsoft.
- [EB Garamond](https://github.com/octaviopardo/EBGaramond12) - Old looking font (free).

## Common sections (epub:type) reference:

- frontmatter: `titlepage`, `halftitlepage`, `seriespage`, `acknowledgments`, `contributors`, `dedication`
- bodymatter: `foreword`, `abstract`, `preface`, `preamble`, `introduction`, `epigraph`, `prologue`, `part`, `chapter`, `epilogue`, `conclusion`, `afterword`
- notes: `footnote(s)`, `endnote(s)`, `noteref`, `backlink`
- backmatter: `appendix`, `bibliography`, `glossary`

### foreword, preface and introduction (epub:type)

- A foreword is written by someone other than the author and tells the readers why they should read the book.
- A preface is written by the author and tells readers how and why the book came into being.
- An introduction introduces readers to the main topics of the manuscript and prepares readers for what they can expect.

## EPUB packaging script

I have created a PowerShell script (command line) to build epub package file from a given directory. It uses [`7za`](https://www.7-zip.org/download.html) and optionally [`kindlegen`](https://www.amazon.com/kindleformat/kindlegen) to create `mobi` format as well, and it's available here: [create-epub.ps1](https://gist.github.com/spajak/a6699005d9648696fbdda1d545153a38).

## Useful links

- [EPUB Packages 3.2](https://www.w3.org/publishing/epub32/epub-packages.html)
- [EPUB Content Documents 3.2](https://www.w3.org/publishing/epub32/epub-contentdocs.html)
- [EPUB Structural Semantics Vocabulary](https://idpf.github.io/epub-vocabs/structure/)
- [DCMI Metadata Terms](http://www.dublincore.org/specifications/dublin-core/dcmi-terms/)
