
cd C:\Users\Administrator\Downloads\Update-BVT-py2-to-py3\rpyc_slave\
powershell -executionpolicy bypass -file slave_package.ps1
copy /Y rpyc_server.bat C:\Observer
copy /Y rpyc_server2.bat C:\Observer
regedit.exe /s rpycautorun.reg
regedit.exe /s autowinlogon.reg
%windir%\System32\cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
pause