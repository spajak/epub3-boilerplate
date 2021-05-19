$source = (Resolve-Path "template" -ErrorAction Stop).Path
$epub = "template.epub"
$mimetype = Join-Path $source "mimetype"
Move-Item $mimetype ".mimetype" -ErrorAction Stop
Remove-Item $epub -ErrorAction Ignore
# Use -bso0 -bsp0 flags to make 7zip silent
& 7za a -mx0 "$epub" ".mimetype"
& 7za a -mx5 "$epub" "${source}\*"
& 7za rn "$epub" ".mimetype" "mimetype"
Move-Item ".mimetype" $mimetype
# Uncomment next line if Kindle support is required and kindlegen is in PATH
#& kindlegen -dont_append_source "template.epub"
