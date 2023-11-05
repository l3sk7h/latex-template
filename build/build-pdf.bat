@ECHO OFF
SET title=Arbeit
SET file="%~dp0..\output\thesis.pdf"


ECHO Remove %file%
DEL %file% > NUL

:waitloop
IF NOT EXIST %file% GOTO waitloopend
powershell -nop -c "& {sleep 3}"
DEL %file% > NUL
goto waitloop
:waitloopend

ECHO 0/4
CALL lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=output thesis.tex > NUL
ECHO 1/4
CD output
CALL biber --input-directory=.. thesis > NUL
ECHO 2/4
CD ..
CALL lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=output thesis.tex > NUL
ECHO 3/4
CALL lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=output thesis.tex > NUL
ECHO 4/4
ECHO Exit Code is %errorlevel%

IF %errorlevel% == 1 (
    ECHO Run again with output
    CALL lualatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=output thesis.tex
) ELSE (
    CALL xcopy /y %file% "./%title%.pdf*" > NUL
    START "" "./%title%.pdf"
)