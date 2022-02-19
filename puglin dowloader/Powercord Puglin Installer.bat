@echo off
TITLE Powercord Puglin Installer
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

echo Hello user this is Powercord easy puglin installer click enter to continue!
pause>nul

cls

set/p folder= Powercord puglin folder: & 

cls

set/p link= Github Link: &

cls

cd %folder%

git clone %link%

cls

echo Your puglin had installed Perfect! Now if you want I can restart your powercord only click enter!

pause>nul

TASKKILL /IM DiscordCanary.exe /F

cls

timeout /t 2

cls

start C:\Users\%USERNAME%\AppData\Local\DiscordCanary\app-1.0.45\DiscordCanary.exe
