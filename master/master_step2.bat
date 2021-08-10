cd C:\Users\Administrator\Downloads\Update-BVT-py2-to-py3\master\
powershell -executionpolicy bypass -file master_pip_package.ps1
if %errorlevel%==0 goto successfully_install_pip_pkg
echo ERROR    [X] Failed to install pip-pkg.
:successfully_install_pip_pkg
echo INFO    [V] Succssfully installed pip-pkg.
pause