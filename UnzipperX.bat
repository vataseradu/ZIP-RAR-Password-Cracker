@echo off
title UnzipperX
color 4
if not exist "C:\Program Files\WinRAR" (
    if not exist "C:\Program Files\7-Zip" (
        echo Nici WinRAR, nici 7-Zip nu sunt instalate!
        pause
        exit
    )
)
echo.
set /p archive="Enter Archive: "
if not exist "%archive%" (
	echo Archive not found!
	pause
	exit
)

set /p wordlist="Enter Wordlist: "
if not exist "%wordlist%" (
	echo Wordlist not found!
	pause
	exit
)
echo Trying...
for /f %%a in (%wordlist%) do (
	set pass=%%a
	call :attempt
)
pause
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo ATTEMPT : %pass%
if /I %errorlevel% EQU 0 (
	echo Success! Password Found: %pass%
	pause
	exit
)
