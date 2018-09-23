Write-Progress -Activity "Uninstalling MinGW Compiler" -Status "Removing MinGW Compiler" -PercentComplete -1
Add-Type -AssemblyName System.IO.Compression.FileSystem

$targetDir = "$env:APPDATA\MinGW\";

if( -Not (Test-Path -Path $targetDir ) )
{
    Write-Error "Folder does not exist."
    Write-Progress -Activity "MinGW Uninstallation" -Completed
    Write-Host "Uninstallation failed."
    exit
}
Remove-Item -Recurse -Force $targetDir

Write-Progress -Activity "Uninstalling MinGW Compiler" -Status "Removing MinGW in path" -PercentComplete -1

$mingwBin = $targetDir+"bin"

$path = [System.Environment]::GetEnvironmentVariable(
    'PATH',
    'User'
)
# Remove unwanted elements
$path = ($path.Split(';') | Where-Object { $_ -ne $mingwBin }) -join ';'
# Set it
[System.Environment]::SetEnvironmentVariable(
    'PATH',
    $path,
    'User'
)

Write-Progress -Activity "MinGW Uninstallation" -Completed
Write-Host "Uninstallation completed!"