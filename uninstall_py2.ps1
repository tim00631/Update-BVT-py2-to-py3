### Uninstall Python
try {
    Get-Package "*python*" | Uninstall-Package
    Write-Output "Successfully uninstall python."
}
catch {
    Write-Output $_.Exception.Message
}

### Remove Python 2.7 path in PATH environment variable
try {
    # Step 1. Get PATH
    $path = [System.Environment]::GetEnvironmentVariable('PATH', 'Machine')
    # Step 2. Remove unwanted elements
    $py2 = "C:\Python27\"
    $py2_script = "C:\Python27\Scripts\"
    $path = ($path.Split(';') | Where-Object { $_ -ne $py2 -and $_ -ne $py2_script}) -join ';'
    # Step 3. Set 
    [System.Environment]::SetEnvironmentVariable('PATH', $path, 'Machine') 
}
catch {
    Write-Output $_.Exception.Message
}
try {
    ### Remove Python2.7 Directory
    $remove_path = "C:\Python27"
    Remove-Item -LiteralPath $remove_path -Force -Recurse
    Write-Output "Successfully remove python dir."
}
catch {
    Write-Output $_.Exception.Message
    return
}