#!/usr/bin/env sh
# Could be executed with bash from git-bash package

document="main"
file=${document}.tex
iso_date=$(date "+%Y-%m-%d")
pdf_source=${document}.pdf
pdf_to_send="Karakin5semCoursework-"${iso_date}.pdf

rm ${document}.aux
# rm ${document}.bbl

xelatex $file

test $? == 0 && bibtex8 -B $document
# test $? == 0 && biber $document

#test $? == 0 && python -m bibulous ${document}.aux
test $? == 0 && xelatex $file
test $? == 0 && xelatex $file

cp $pdf_source build/$pdf_to_send
