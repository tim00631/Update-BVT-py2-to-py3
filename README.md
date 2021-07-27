# Update-BVT-py2-to-py3

## FOR MASTER
### Step 1
Download this repository
Unzip Update-BVT-py2-to-py3 to C:\Administrator\Downloads\Update-BVT-py2-to-py3

### Step 2
Right click `run_install.bat` and click **Run as Administrator**.
you can input `python` in the command prompt to check the version whether is 3.8.10 or not.

### Step 3

After installation python3, right click `pip_install.bat` and click **Run as an Administrator**, it will install the dependency package of BVT.

## FOR SLAVE
Step1 and Step2 is the same with MASTER.

### Step 3
(Replace the `DefaultPassword` in autologon.reg with your SLAVE's password)
After installing python3, right click `slave.bat` and click **Run as an Administrator**.

### Step 4
Restart SLAVE to check if rpycautorun.reg can work.
Remember to **shutdown** and take a snapshot named **RpyC**