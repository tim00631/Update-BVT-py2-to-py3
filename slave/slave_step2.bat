@echo off
set slave_folder=C:\Users\%username%\Downloads\Update-BVT-py2-to-py3\slave\
set observer_folder=C:\Observer

cd %slave_folder%
:: Install pip-pkg
powershell -executionpolicy bypass -file slave_pip_package.ps1
if %errorlevel%==0 goto successfully_install_pip_pkg
echo ERROR    [X] Failed to install pip-pkg.
pause
EXIT 1
:successfully_install_pip_pkg
echo INFO    [V] Succssfully installed pip-pkg.

:: registry value
copy /Y rpyc_server.bat %observer_folder%
copy /Y rpyc_server2.bat %observer_folder%

regedit.exe /s rpycautorun.reg
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v Observer
if %errorlevel%==0 goto success_rpycautorun
echo ERROR    [X] Failed to add registry value 'rpycautorun.reg'
pause
EXIT 1
:success_rpycautorun
echo INFO    [V] Succssfully added registry value 'rpycautorun.reg'

regedit.exe /s autowinlogon.reg
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName
if %errorlevel% NEQ 0 goto fail_autowinlogon
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword
if %errorlevel% NEQ 0 goto fail_autowinlogon
echo INFO    [V] Succssfully added registry value 'autowinlogon.reg'
goto :UAC
:fail_autowinlogon
echo ERROR    [X] Failed to add registry value 'autowinlogon.reg'
pause
EXIT 1
:: UAC to lowest
:UAC
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA
if %errorlevel%==0 goto success_uac_lowest
echo ERROR    [X] Failed to modify UAC to lowest
pause
EXIT 1
:success_uac_lowest
echo INFO    [V] Succssfully modified UAC to lowest
pause