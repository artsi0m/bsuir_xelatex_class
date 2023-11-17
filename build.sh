#!/usr/bin/env sh
# Could be executed with bash from git-bash package

document="main"
file=${document}.tex
iso_date=$(date "+%Y-%m-%d")
pdf_source=${document}.pdf
pdf_to_send="Karakin5semCoursework-"${iso_date}.pdf

rm ${document}.aux
xelatex $file

test $? == 0 && biber $document
test $? == 0 && xelatex $file
test $? == 0 && xelatex $file

cp $pdf_source build/$pdf_to_send
