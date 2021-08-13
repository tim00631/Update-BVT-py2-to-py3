@echo off
systeminfo | find "Windows Server 2016"
if %errorlevel% NEQ 0 goto check_windows7
:: uninstall windows defender (Windows Server 2016)
cd C:\Users\Administrator\Downloads\Update-BVT-py2-to-py3\util\
powershell -executionpolicy bypass -file uninstall_server_windows_defender.ps1
if %errorlevel%==0 goto successfully_uninstall_defender
echo ERROR    [X] Failed to uninstall windows defender
pause
EXIT 1
:successfully_uninstall_defender
echo INFO    [V] Succssfully uninstalled windows defender
goto uninstall_dsa

:check_windows7
systeminfo | find "Windows 7"
if %errorlevel% NEQ 0 goto disable_windows_defender
:: stop windows defender (Windows 7)
sc stop windefend
sc query windefend | find "STOPPED"
if %errorlevel%==0 goto success_stop_defender
echo ERROR    [X] Failed to stop windows defender
pause
EXIT 1
:success_stop_defender
echo INFO    [V] Successfully stop windows defender for Windows 7
goto uninstall_dsa

:: turn off windows defender (W10)
:disable_windows_defender
@REM @echo Disable Windows Defender
@REM reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
@REM reg query "HKLM\Software\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware
@REM if %errorlevel%==0 goto successfully_disable_anti_spyware
@REM echo ERROR    [X] Failed to disable AntiSpyware
@REM pause
@REM EXIT 1
@REM :successfully_disable_anti_spyware
@REM echo INFO    [V] Successfully disable AntiSpyware

@REM reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
@REM reg query "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring
@REM if %errorlevel%==0 goto successfully_disable_realtime_monitering
@REM echo ERROR    [X] Failed to disable Real-Time Monitering
@REM pause
@REM EXIT 1
@REM :successfully_disable_realtime_monitering
@REM echo INFO    [V] Successfully disable Real-Time Monitering
@REM echo INFO    [V] Successfully turned off windows defender!

:: Uninstall DSA
:uninstall_dsa
wmic.exe product where name="Trend Micro Deep Security Agent" call uninstall
sc query ds_agent
if %errorlevel%==1060 goto successfully_uninstalled_dsa
echo ERROR    [X] Failed to uninstall Deep Security Agent.
pause
EXIT 1 
:successfully_uninstalled_dsa
echo INFO    [V] Successfully uninstalled Deep Security Agent.

:: Uninstall AMSP
sc query amsp
if %errorlevel%==1060 goto successfully_uninstalled_amsp
echo ERROR    [X] Failed to uninstall AMSP.
pause
EXIT 1
:successfully_uninstalled_amsp
echo INFO    [V]  Successfully uninstalled AMSP.

:: Turn off firewall
NetSh Advfirewall set allprofiles state off
if %errorlevel%==0 goto successfully_turn_off_firewall
echo ERROR    [X] Failed to turn off firewall.
pause
EXIT 1
:successfully_turn_off_firewall
echo INFO    [V] Succssfully turned off firewall.


:: Upgrade Python 
cd C:\Users\%username%\Downloads\Update-BVT-py2-to-py3\util\
powershell -executionpolicy bypass -file uninstall_py2.ps1
if %errorlevel%==0 goto successfully_uninstall_python2
echo ERROR    [X] Failed to uninstall python2.
pause
EXIT 1
:successfully_uninstall_python2
echo INFO    [V] Succssfully uninstalled python2.

powershell -executionpolicy bypass -file install_py3.ps1
if %errorlevel%==0 goto successfully_install_py3
echo ERROR    [X] Failed to install python3.
pause
EXIT 1
:successfully_install_py3
echo INFO    [V] Succssfully installed python3.

pause