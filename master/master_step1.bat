echo off

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