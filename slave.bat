
cd C:\Users\Administrator\Desktop\Update-BVT-py2-to-py3
powershell -executionpolicy bypass -file slave_package.ps1
move C:\Administrator\Desktop\Update-BVT-py2-to-py3\rpyc_slave\rpyc_server1.bat C:\Administrator\Desktop\Update-BVT-py2-to-py3\rpyc_slave\rpyc_server2.bat C:\Observer
regedit.exe /s rpycautorun.reg
regedit.exe /s autowinlogon.reg
pause