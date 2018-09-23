Write-Progress -Activity "Installing MinGW Compiler" -Status "Unzipping MinGW Compiler" -PercentComplete -1
Add-Type -AssemblyName System.IO.Compression.FileSystem

$targetDir = "$env:APPDATA\";

if( -Not (Test-Path -Path $targetDir ) )
{
    New-Item -ItemType directory -Path $targetDir
}

if (Test-Path -Path $($targetDir+"MinGW")){
    Write-Error "Folder already exists";
    Write-Progress -Activity "MinGW Installation" -Completed
    Write-Host "Installation failed"
    exit
}
[System.IO.Compression.ZipFile]::ExtractToDirectory("data\MinGW.zip", $targetDir)

Write-Progress -Activity "Installing MinGW Compiler" -Status "Installing MinGW in path" -PercentComplete -1
$path = [System.Environment]::GetEnvironmentVariable(
    'PATH',
    'User'
)

$newPath = $targetDir+"MinGW\bin";
if(-Not [string]::IsNullOrEmpty($path)){
    $newPath = $path+";"+$newPath;
}

[Environment]::SetEnvironmentVariable( "Path", $newPath, "User" );
Write-Progress -Activity "MinGW Installation" -Completed
Write-Host "Installation completed!"