@echo off

rem epub
cd template
zip -r -0 -X ../template.epub mimetype
zip -r -5 -X ../template.epub . -x mimetype
cd ..

rem mobi
kindlegen template.epub -o template.mobi
