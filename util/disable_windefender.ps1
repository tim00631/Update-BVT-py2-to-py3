# Need to turn off Temper Protection in Windows
try {
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1 -Force
    Set-MpPreference -DisableRealtimeMonitoring $true
}
catch {
    Write-Output "ERROR:    $_.Exception.Message"
    exit 1
}