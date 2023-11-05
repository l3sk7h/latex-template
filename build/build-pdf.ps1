$title = "Arbeit"
$file = "output\thesis.pdf"

ECHO ("Remove " + $file)
Remove-Item $file  -erroraction silentlycontinue | out-null

ECHO 0/4
& lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=output thesis.tex | out-null

ECHO 1/4
CD output
& biber --input-directory = .. thesis | out-null
ECHO 2/4
CD ..
& lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=output thesis.tex | out-null
ECHO 3/4
& lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=output thesis.tex | out-null
ECHO 4/4
ECHO ("Exit Code is " + $LASTEXITCODE)

IF ($LASTEXITCODE -eq 1)
{
    ECHO "Run again with output"
    & lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=output thesis.tex
}
ELSE
{
    Copy-Item -Force $file ($title + ".pdf") | out-null
    Start-Process ("./" + $title + ".pdf")
}