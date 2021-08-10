@echo off

:: turn off windows defender
@echo Disable Windows Defender
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
if %errorlevel%==0 goto successfully_turn_off_windows_defender
echo ERROR    [X] Failed to turn off windows defender 
:successfully_turn_off_windows_defender
echo INFO    [V] Successfully turned off windows defender

:: Uninstall DSA
wmic.exe product where name="Trend Micro Deep Security Agent" call uninstall
sc query ds_agent
if %errorlevel%==1060 goto successfully_uninstalled_dsa
echo ERROR    [X] Failed to uninstall Deep Security Agent.  
:successfully_uninstalled_dsa
echo INFO    [V] Successfully uninstalled Deep Security Agent.

:: Uninstall AMSP
sc query amsp
if %errorlevel%==1060 goto successfully_uninstalled_amsp
echo ERROR    [X] Failed to uninstall AMSP.
:successfully_uninstalled_amsp
echo INFO    [V]  Successfully uninstalled AMSP.

:: Turn off firewall
NetSh Advfirewall set allprofiles state off
if %errorlevel%==0 goto successfully_turn_off_firewall
echo ERROR    [X] Failed to turn off firewall.
:successfully_turn_off_firewall
echo INFO    [V] Succssfully turned off firewall.


:: Upgrade Python
cd C:\Users\Administrator\Downloads\Update-BVT-py2-to-py3\util\
powershell -executionpolicy bypass -file uninstall_py2.ps1
if %errorlevel%==0 goto successfully_uninstall_py2
echo ERROR    [X] Failed to uninstall python2.
:successfully_uninstall_py2
echo INFO    [V] Succssfully uninstalled python2.

powershell -executionpolicy bypass -file install_py3.ps1
if %errorlevel%==0 goto successfully_install_py3
echo ERROR    [X] Failed to install python3.
:successfully_install_py3
echo INFO    [V] Succssfully installed python3.

pause