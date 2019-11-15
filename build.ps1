# Generate epub
$epubFile = "template.epub"
Write-Host "Building EPUB ($epubFile).."
Remove-Item "$epubFile" -ErrorAction Ignore
Copy-Item ".\template\mimetype" "000.000"
& 7za a -mx0 "$epubFile" ".\000.000"
& 7za u -mx5 "$epubFile" ".\template\META-INF" ".\template\Content"
& 7za rn "$epubFile" "000.000" "mimetype"
Remove-Item "000.000"

# Generate mobi
$mobiFile = "template.mobi"
Write-Host "Building MOBI ($mobiFile).."
& kindlegen -dont_append_source "$epubFile" -o "$mobiFile"
