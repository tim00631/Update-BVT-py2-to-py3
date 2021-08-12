try {
    Uninstall-WindowsFeature -Name Windows-Defender
}
catch {
    Write-Output "ERROR:    $_.Exception.Message"
    exit 1
}