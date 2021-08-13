# Update-BVT-py2-to-py3
A simple auto-upgrade tool for BVT master and slave machines

### Preliminary
* Download this repository
* Unzip Update-BVT-py2-to-py3 to C:\Administrator\Downloads\Update-BVT-py2-to-py3

## FOR MASTER
### Step 1
* Enter folder `master`
* Right-click `master_step1.bat` and click **Run as Administrator**, it will upgrade python version to 3.8.10

### Step 2
* After doing step 1, right click `master_step2.bat` and click **Run as an Administrator**, it will install the master dependency package by pip

## FOR SLAVE
### Step 1
* For those version after win10_20h1, Windows Defender will be automatically turned on. So please turn off all the button in the virus & threat protection settings.
* If the slave is win7, please to check if the powershell version is 5.1 or not. 
* Enter folder `slave`
* Right-click `slave_step1.bat` and click **Run as Administrator**, it will do 4 things:
    * Disable Windows Defender
    * Check if DSA and AMSP are uninstalled
    * Turn off firewall
    * Upgrade python version to 3.8.10

### Step 2
* (Replace the `DefaultPassword` in slave/autologon.reg with your slave machine's password)

### Step 3
* After doing step 1, right-click `slave_step2.bat` and click **Run as an Administrator**, it will do 3 things:
    * Install the slave dependency package by pip
    * Add rpycautorun.reg and autowinlogon.log to registry key
    * Modify UAC to lowest
### Step 4
* **Shutdown** and take a snapshot named **RpyC**
* Restart slave to check if rpycautorun.reg can work and Windows Defender is disabled