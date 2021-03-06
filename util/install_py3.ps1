if ([Environment]::Is64BitProcess) {
    [String]$archBit = "-amd64"
    Write-Output "INFO:    Architecture: 64 bits"
}
else {
    [String]$archBit = ""
    Write-Output "INFO:    Architecture: 32 bits"
}

$pythonVersion = "3.8.10"
$pythonUrl = "https://www.python.org/ftp/python/$pythonVersion/python-$pythonVersion$archBit.exe"
$pythonDownloadPath = "C:\Users\$env:USERNAME\Downloads\python-$pythonVersion$archBit.exe" # FIXME $env:username
$pythonInstallDir = "C:\Program Files\Python38"

try{
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
    (New-Object Net.WebClient).DownloadFile($pythonUrl, $pythonDownloadPath)
    & $pythonDownloadPath /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 TargetDir=$pythonInstallDir
}
catch {
    Write-Output "ERROR:    $_"
    exit 1
}



