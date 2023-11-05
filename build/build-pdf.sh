#!/bin/sh

title="Arbeit"
baseDir=$(realpath "$(dirname $0)")
outputDir="$baseDir/../output"
texFile=$(realpath "$baseDir/../thesis.tex")

mkdir "$outputDir" > /dev/null
echo "0 %"

cd "$baseDir/.."
lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory="$outputDir" "$texFile" > /dev/null
echo "25 %"

cd "$outputDir"
biber --input-directory=.. thesis > /dev/null
echo "50 %"

cd "$baseDir/.."
lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory="$outputDir" "$texFile" > /dev/null
echo "75 %"

lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory="$outputDir" "$texFile" > /dev/null
exitCode=$?
echo "100% - exit code $exitCode"

if [ $exitCode -eq 0 ]
then
  echo "Success!"
  cp "$baseDir/../output/thesis.pdf" "$baseDir/../$title.pdf"
else
  echo "Error! Run again with output"
  lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory="$outputDir" "$texFile"
fi


