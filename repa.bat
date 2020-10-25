@echo off
echo.
echo.
echo                 Zugangsdaten
echo      ---------------------------------
echo              IP= %IP%
echo              Benutzername= %BEN%
echo              Passwort= %PSW% 
echo      =================================
echo.
echo.
echo       Reparatur/Upgrade ioBroker/Node
echo             =============
echo.	
echo   [1] ioBroker reparieren/NPM/Node/JS-Controller/Adapter Upgraden
echo   [2] Allgemeines Fix Script (sollte reichen)
echo   [3] NPM Adapter rebuild. Nach NPM Upgrade (1) ausfuehren
echo   [4] reinstall.sh script ausfuehren
echo   [5] Adapter komplett neu installieren. Dauert sehr lange. Im Log gucken
echo   [6] Putty starten
echo   [7] Beenden
echo.
set asw=0
set /p asw="Bitte Auswahl eingeben: "
if %asw%==1 goto NODE
if %asw%==2 goto AFIX
if %asw%==3 goto NPM
if %asw%==4 goto REINSTALL
if %asw%==5 goto ADAPTER
if %asw%==6 goto PUTTY
if %asw%==7 goto STOP
start repa.bat
exit
:NODE
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m node.txt
cd ..
goto END
:AFIX
cd Programm
START cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m afix.txt
cd ..
goto END
:NPM
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m npm.txt
cd ..
goto END
:REINSTALL
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m reinstall.txt
cd ..
goto END
:ADAPTER
cd Programm
start cmd /k plink.exe %BEN%@%IP% -pw %PSW% -m adapter.txt
cd ..
goto END
:PUTTY
start putty.bat
goto END
:END
start repa.bat
exit
:STOP
start restart.bat
exit