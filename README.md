# epub3-boilerplate – e-book template

[EPUB version 3.2](https://www.w3.org/publishing/epub32/epub-spec.html) template, including simplistic, yet universal `css` stylesheet.

## Building EPUB file

I made a [PowerShell](https://github.com/PowerShell/PowerShell) script [build-epub.ps1](https://gist.github.com/spajak/a6699005d9648696fbdda1d545153a38) to build an epub package file from a given source directory. In order to do so, place the script in PATH and execute this command from a PowerShell to build "template.epub" from the template:

```
$ build-epub.ps1 ".\template"
```

It can also be done using [7za](https://www.7-zip.org/download.html) command line tool. In PowerShell, execute [build.ps1](https://github.com/spajak/epub3-boilerplate/blob/master/build.ps1) script from within this repo:

```
$ .\build.ps1
```

#### Kindle

Kindle does not support EPUB e-books yet. Using [kindlegen](https://www.amazon.com/kindleformat/kindlegen)*, here is the command to build .mobi file from .epub:

```
& kindlegen -dont_append_source "template.epub"
```

\* kindlegen has been discontinued, but Windows binary is provided in the releases of this repo.

### Validation

Always validate resulting EPUB (.epub) file with [epubcheck](https://github.com/w3c/epubcheck):

```
$ java -jar "/path/to/epubcheck.jar" "template.epub"
```

## Words per page & word count metadata

I use schema.org [numberOfPages](https://schema.org/numberOfPages) and [wordCount](https://schema.org/wordCount) fields in package metadata:

```html
<meta property="schema:numberOfPages">{{number_of_pages}}</meta>
<meta property="schema:wordCount">{{word_count}}</meta>
```

To get the number of words from html source use the provided PHP script:

```
$ php ./count-words.php "./template/Content/ch*.xhtml"
```

#### Did you know?

* An average reading speed is 250 **words per minute** for an adult.
* In a novel there are around 250-350 **words per page**.

## Common sections (epub:type) quick reference

| frontmatter     | bodymatter   | backmatter   | notes       |
| --------------- | ------------ | ------------ | ----------- |
| titlepage       | foreword     | appendix     | footnote(s) |
| halftitlepage   | abstract     | endnote(s)   | noteref     |
| acknowledgments | preface      | glossary     | backlink    |
| contributors    | preamble     | bibliography |             |
| toc             | introduction | seriespage   |             |
| dedication      | epigraph     |              |             |
|                 | prologue     |              |             |
|                 | part         |              |             |
|                 | chapter      |              |             |
|                 | epilogue     |              |             |
|                 | conclusion   |              |             |
|                 | afterword    |              |             |

Full rerefence: [EPUB Structural Semantics Vocabulary](http://www.idpf.org/epub/vocab/structure/).

## Fonts

My favourite serif fonts for long reading:

- Bookerly – Default Kindle font;
- [Literata](https://github.com/googlefonts/literata) – Google font (free);
- [Crimson Pro](https://fontsarena.com/crimson-pro-by-sebastian-kosch-jacques-le-bailly/) – Sebastian Kosch & Jacques Le Bailly (free);
- [Newsreader](https://github.com/productiontype/Newsreader) – an original typeface designed by Production Type (free);
- [Cochineal](https://ctan.org/pkg/cochineal) – a fork from the Crimson fonts (free);
- [Source Serif](https://github.com/adobe-fonts/source-serif) – a free font from Adobe;
- [Libertinus](https://github.com/alerque/libertinus) – a fork of Linux Libertine (free);
- [Georgia](https://docs.microsoft.com/typography/font-list/georgia) – classic font from Microsoft;

#### The difference between foreword, preface and introduction

- A foreword is written by someone other than the author and tells the readers why they should read the book.
- A preface is written by the author and tells readers how and why the book came into being.
- An introduction introduces readers to the main topics of the manuscript and prepares readers for what they can expect.

## Useful links

- [EPUB Packages 3.2](https://www.w3.org/publishing/epub32/epub-packages.html)
- [EPUB Content Documents 3.2](https://www.w3.org/publishing/epub32/epub-contentdocs.html)
- [EPUB Structural Semantics Vocabulary](http://www.idpf.org/epub/vocab/structure/)
- [DCMI Metadata Terms](http://www.dublincore.org/specifications/dublin-core/dcmi-terms/)
- [MARC Code List for Relators](https://www.loc.gov/marc/relators/relaterm.html)
- [BISAC Subject Headings](https://bisg.org/page/bisacedition)
