@echo off
title EDIT
color 17
set "count=0"
set "OVRWRT=0"

setlocal enabledelayedexpansion




:main
cls
echo Welcome to the %OS2% Text Editor!
echo.
echo README:
echo   Type your text and it will be saved to the specified file.
echo   Type in file name with extension.
echo   Type $VIEW to see what the document would look like.
echo   Type $EXIT to save and exit.
echo.
set /p "filename=Enter file name to save as: "
echo.

if exist %filename% echo THIS FILE ALREADY EXISTS AND WILL BE OVERWRITTEN.
if exist %filename% pause
if exist %filename% echo.
if exist %filename% set "OVRWRT=1"
if exist %filename% goto edit
echo. > %filename%
:edit
set "TEXT="
set /a "count+=1"
set /p "TEXT=%count% > "

if "%TEXT%" == "$VIEW" (
    goto view
)


if "%TEXT%" == "$EXIT" (
    goto save
)
if %OVRWRT%==1 goto resettst

echo. %TEXT% >> "%filename%"
goto edit

:save
echo.
echo File saved as %filename%
pause
cls
exit /b

:resettst
echo %TEXT% > "%filename%"
set "OVRWRT=0"
goto edit

:view
set /a "count-=1"
echo.
type %filename%
echo.
goto edit

