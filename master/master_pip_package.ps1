# Turn off proxy so that pip can install dependency package
try {
    Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\' -Name 'ProxyEnable' -Value 0
    pip install -r requirement.txt
    Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\' -Name 'ProxyEnable' -Value 1
}
catch {
    Write-Output "ERROR:    $_.Exception.Message"
    exit 1
}