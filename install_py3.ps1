if ([Environment]::Is64BitProcess) {
    [String]$archBit = "-amd64"
    Write-Output "Architecture: 64"
}
else {
    [String]$archBit = ""
    Write-Output "Architecture: 32"
}

$pythonVersion = "3.8.10"
$pythonUrl = "https://www.python.org/ftp/python/$pythonVersion/python-$pythonVersion$archBit.exe"
$pythonDownloadPath = "C:\Users\Administrator\Downloads\python-$pythonVersion$archBit.exe"
$pythonInstallDir = "C:\Program Files\Python38"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Ssl3
[Net.ServicePointManager]::SecurityProtocol = "Tls, Tls11, Tls12, Ssl3"
try{
    (New-Object Net.WebClient).DownloadFile($pythonUrl, $pythonDownloadPath)
    $pythonDownloadPath /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 TargetDir=$pythonInstallDir
    Write-Output "Successfully installed!"
}
catch {
    Write-Output $_.Exception.Message
}



