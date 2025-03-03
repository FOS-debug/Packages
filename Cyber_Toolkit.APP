@echo off
title Cyber Security Toolkit
mode con: cols=80 lines=20

:menu
cls
echo =======================================
echo        CYBER SECURITY TOOLKIT
echo =======================================
echo.
echo IP TOOLKIT
echo.
echo 1. Get IP Address of a Website
echo 2. Get Your Public IP Address
echo 3. View Local Network Info
echo 4. Ping a Website
echo 5. Trace Route to a Website
echo 6. Port Scan a Target
echo.
echo OTHER STUFF
echo.
echo 7. Check System Info
echo 8. Scan Running Processes
echo 9. Monitor File Changes
echo 10. Detect USB Insertion
echo.
echo E. Exit
echo =======================================
set /p choice=Select an option (1-7): 

if %choice%==1 goto getip
if %choice%==2 goto publicip
if %choice%==3 goto localinfo
if %choice%==4 goto pingtest
if %choice%==5 goto traceroute
if %choice%==6 goto portscan
if %choice%==7 goto systeminfo
if %choice%==8 goto processscan
if %choice%==9 goto filemonitor
if %choice%==10 goto usbdetect
if %choice%==E exit /b
if %choice%==e exit /b
goto menu

:getip
cls
echo Enter the website (e.g., google.com):
set /p website=
nslookup %website%
pause
goto menu

:publicip
cls
echo Fetching your public IP address...
curl -s ifconfig.me
echo.
pause
goto menu

:localinfo
cls
echo === Local Network Information ===
ipconfig /all
echo.
netstat -ano
echo.
pause
goto menu

:pingtest
cls
echo Enter website to ping (e.g., google.com):
set /p target=
ping %target%
pause
goto menu

:traceroute
cls
echo Enter website to trace (e.g., google.com):
set /p trace=
tracert %trace%
pause
goto menu

:portscan
cls
echo Enter IP or website to scan:
set /p target=
echo Enter port to check (e.g., 80 for HTTP, 443 for HTTPS):
set /p port=
echo Scanning %target% on port %port%...
powershell -Command "Test-NetConnection %target% -Port %port%"
pause
goto menu

:systeminfo
cls
echo === System Information ===
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Manufacturer"
echo.
wmic useraccount get name,sid
echo.
pause
goto menu

:processscan
cls
echo === Running Processes ===
tasklist /v
echo.
pause
goto menu

:filemonitor
cls
echo Enter the full path of the file to monitor:
set /p filepath=
if exist "%filepath%" (
    echo Monitoring "%filepath%" for changes...
    attrib "%filepath%"
) else (
    echo File not found!
)
pause
goto menu

:usbdetect
cls
echo Monitoring for USB devices...
wmic logicaldisk get description,deviceid,volumename
echo If a new USB is plugged in, it will show up here.
pause
goto menu
