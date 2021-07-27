### Uninstall Python
Get-Package "*python*" | Uninstall-Package 
### Remove Python 2.7 path in PATH environment variable
# Step 1. Get PATH
$path = [System.Environment]::GetEnvironmentVariable(
    'PATH',
    'Machine'
)
# Step 2. Remove unwanted elements
$py2 = "C:\Python27\"
$py2_script = "C:\Python27\Scripts\"
$path = ($path.Split(';') | Where-Object { $_ -ne $py2 -and $_ -ne $py2_script}) -join ';'
# Step 3. Set it
[System.Environment]::SetEnvironmentVariable(
    'PATH',
    $path,
    'Machine'
) 
### Remove Python2.7 Directory
$remove_path = "C:\Python27"
Remove-Item -LiteralPath $remove_path -Force -Recurse
