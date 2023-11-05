# LaTeX-Template

## Einrichtung

- IntelliJ und MiKTeX installieren
- In der MiKTeX-Konsole nach Updates suchen und diese installieren
- Dateinamen in build/build-pdf.bat bzw. build/build-pdf.sh festlegen
- IntelliJ-Run-Configuration auswählen ("build-pdf") oben rechts
- TeXiFy IDEA IntelliJ-Plugin installieren

## Dateien

- thesis.tex: Ausgangsdatei. Hier werden alle Kapitel gelistet.
- citations.bib: Hier werden alle Quellen gelistet.
- config.tex: LaTeX-Konfiguration. Im Normalfall ist hier nichts anzupassen.

## Einseitiges Layout

Standardmäßig ist eine dopppelseitige Druckversion eingestellt.
In "thesis.tex" Zeile 1 kann das geändert werden, indem das "twoside" entfernt wird.
Dort können ebenfalls die automatisch generierten Seitenzahlen angepasst werden.
