@echo off
title .==.                Inicializa cntlm              .==.
rem Inicializa proxy cntlm

mode con:cols=80 lines=100
for /f "tokens=2 delims=:." %%x in ('chcp') do set cp=%%x
chcp 1252>nul
setlocal EnableDelayedExpansion

set mydate=%date:~6,4%%date:~3,2%%date:~0,2%
rem echo %mydate%
set mytime=%time:~0,2%%time:~3,2%
rem echo %mytime%

set ENVFILE="%~dp0cntlm.ini"
IF NOT EXIST %ENVFILE% (
    echo "Arquivo %ENVFILE% nao localizado. "
    goto:eof
)

echo.rodando_inicio_d%mydate%_h%mytime% >> log_%mydate%.txt
call %~dp0cntlm.exe -v -c cntlm.ini >> log_%mydate%.txt 2>&1

endlocal
chcp %cp%>nul
