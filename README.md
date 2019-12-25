# epub3-boilerplate – e-book template

[EPUB version 3.2](https://www.w3.org/publishing/epub32/epub-spec.html) template, including simplistic, yet universal `css` stylesheet.

## Build

In order to build this e-book, [`7za`](https://www.7-zip.org/download.html) command line tool is required. To generate `mobi` file alongside, [`kindlegen`](https://www.amazon.com/kindleformat/kindlegen) tool should also be in your PATH.

In [PowerShell](https://github.com/PowerShell/PowerShell):

```
$ ./build.ps1
```

This outputs two files: `template.epub` and `template.mobi` for Kindle.

Validate the package file with [`epubcheck`](https://github.com/w3c/epubcheck):

```
$ java -jar "./epubcheck.jar" "./template.epub"
```

## Reading time

Nice feature is to have a reading time hint. This can be calculated as a number of words divided by an average reading speed (250 words per minute for an adult). To get the number of words use provided PHP script:

```
$ php ./count-words.php "./template/Content/text/ch*.xhtml"
```

Use the number in `<meta property="schema:wordCount">xxx</meta>` metadata field.

## Asterism

Due to poor Unicode and CSS support in most e-readers, I found that the best way to have safe and nice looking asterism is to use asterisk operator (U+2217) from the Unicode Math category. Tested on Kindle and Kobo:

```html
<div class="asterism large">∗ ∗ ∗</div>
```

## Fonts

Top 3 fonts ideal for long reading in my opinion:

- **Bookerly** – Default Kindle font. This is the main reason **not** to embed any serif fonts in epub package, but to leave e-reader's default.
- [Literata](https://github.com/googlefonts/literata) – Google's font. Very nice looking.
- [Georgia](https://docs.microsoft.com/typography/font-list/georgia) – Classic font from Microsoft.

## Common sections (epub:type):

- frontmatter: `titlepage`, `halftitlepage`, `seriespage`, `acknowledgments`, `contributors`, `dedication`
- bodymatter: `foreword`, `abstract`, `preface`, `preamble`, `introduction`, `epigraph`, `prologue`, `part`, `chapter`, `footnote(s)`, `epilogue`, `conclusion`, `afterword`
- backmatter: `appendix`, `bibliography`, `endnote(s)`, `glossary`

## EPUB packaging script

I have created a PowerShell script (command line) to build epub package file from a given directory. It uses [`7za`](https://www.7-zip.org/download.html) and optionally [`kindlegen`](https://www.amazon.com/kindleformat/kindlegen) to create `mobi` format as well, and it's available here: [create-epub.ps1](https://gist.github.com/spajak/a6699005d9648696fbdda1d545153a38).

## Useful links

- [EPUB Packages 3.2](https://www.w3.org/publishing/epub32/epub-packages.html)
- [EPUB Content Documents 3.2](https://www.w3.org/publishing/epub32/epub-contentdocs.html)
- [EPUB 3 Structural Semantics Vocabulary](https://idpf.github.io/epub-vocabs/structure/)
- [DCMI Metadata Terms](http://www.dublincore.org/specifications/dublin-core/dcmi-terms/)
