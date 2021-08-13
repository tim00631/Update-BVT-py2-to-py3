try {
    Uninstall-WindowsFeature -Name Windows-Defender
}
catch {
    Write-Output "ERROR:    $_"
    exit 1
}