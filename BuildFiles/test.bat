@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
title VIO-BECTI-CW Mission gets created

set gitpath="F:\GitReps\Arma3_CTI_ColdWar"
set buildpath="D:\Tausch\Programmierung\VIO-BECTI\VIO-BECTI-CW"
set missionfolder="VIO-BECTI-CW"

::echo Datum wird erstellt
::set YYYY=%date:~-4%
::set MM=%date:~-7,2%
::set DD=%date:~-10,2%
::set hr=%time:~0,2%
::if "%hr:~0,1%" == " " SET hr=0%hr:~1,1%
::set min=%time:~3,2%
::set sek=%time:~6,2%

::set datestr=%YYYY%%MM%%DD%_%hr%%min%

set mapname=""
set "mapnames="Altis""
set "mapnames=%mapnames%;"Chernarus""
::set "mapnames=%mapnames%;"Chernarus_summer""
::set "mapnames=%mapnames%;"Chernarus_Winter""
::set "mapnames=%mapnames%;"gm_weferlingen_summer""
::set "mapnames=%mapnames%;"gm_weferlingen_winter""
::set "mapnames=%mapnames%;"Malden""
::set "mapnames=%mapnames%;"Mske""
::set "mapnames=%mapnames%;"Stratis""
::set "mapnames=%mapnames%;"Tanoa""
::set "mapnames=%mapnames%;"WL_Rosche""

for /f "tokens=1* delims=:" %%a in ('^(for %%a in ^(%mapnames%^) do @echo %%a^) ^| findstr /n "^"') do (
    echo %%b

    echo "%buildpath%\%missionfolder%.%%b\tmp"
)

timeout 30
echo pause