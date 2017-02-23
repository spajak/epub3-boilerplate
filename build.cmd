@echo off

cd template
rem epub
7z a -tzip ..\template.epub *
cd ..
rem mobi
kindlegen template.epub -o template.mobi
