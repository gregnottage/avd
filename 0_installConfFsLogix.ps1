write-host 'AIB Customization: Downloading FsLogix'
New-Item -Path C:\\ -Name fslogix -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = 'C:\\fslogix'
$WVDflogixURL = 'https://raw.githubusercontent.com/DeanCefola/Azure-WVD/master/PowerShell/FSLogixSetup.ps1'
$WVDFslogixInstaller = 'FSLogixSetup.ps1'
$outputPath = $LocalPath + '\' + $WVDFslogixInstaller
Invoke-WebRequest -Uri $WVDflogixURL -OutFile $outputPath
set-Location $LocalPath

write-host 'AIB Customization: Start Fslogix installer'
Set-ExecutionPolicy -ExecutionPolicy Bypass -Force -Verbose
.\\FSLogixSetup.ps1 -ProfilePath \\wvdSMB\wvd -Verbose
write-host 'AIB Customization: Finished Fslogix installer'