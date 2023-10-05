$document = "main"
$file = "{0}.tex" -f $document
$iso_date = Get-Date -format "yyyy-MM-dd"
$pdf_source = "{0}.pdf" -f $document
$pdf_to_send = "Karakin5semCoursework-{0}.pdf" -f $iso_date

# Why it runs for 3 times:
# https://ru.wikibooks.org/wiki/LaTeX/BibLaTeX
xelatex $file
biber $document
xelatex $file
xelatex $file

Copy-Item -Path $pdf_source -Destination build/$pdf_to_send
