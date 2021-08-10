@echo off
set slave_folder=C:\Users\Administrator\Downloads\Update-BVT-py2-to-py3\slave\
set observer_folder=C:\Observer

cd %slave_folder%
:: Install pip-pkg
powershell -executionpolicy bypass -file slave_pip_package.ps1
if %errorlevel%==0 goto successfully_install_pip_pkg
echo ERROR    [X] Failed to install pip-pkg.
:successfully_install_pip_pkg
echo INFO    [V] Succssfully installed pip-pkg.

:: registry value
copy /Y rpyc_server.bat %observer_folder%
copy /Y rpyc_server2.bat %observer_folder%

regedit.exe /s rpycautorun.reg
if %errorlevel%==0 goto success_rpycautorun
echo ERROR    [X] Failed to add registry value 'rpycautorun.reg'
:success_rpycautorun
echo INFO    [V] Succssfully added registry value 'rpycautorun.reg'

regedit.exe /s autowinlogon.reg
if %errorlevel%==0 goto success_autowinlogon
echo ERROR    [X] Failed to add registry value 'autowinlogon.reg'
:success_autowinlogon
echo INFO    [V] Succssfully added registry value 'autowinlogon.reg'

:: UAC to lowest
%windir%\System32\cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
if %errorlevel%==0 goto success_uac_lowest
echo ERROR    [X] Failed to modify UAC to lowest
:success_uac_lowest
echo INFO    [V] Succssfully modified UAC to lowest