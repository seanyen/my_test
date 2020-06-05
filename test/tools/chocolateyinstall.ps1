$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$PathLen = $Env:PATH.length
if ($PathLen -gt 4096) {
    Write-Warning "The environment variable of %PATH% is over 4096."
    Write-Warning "This could potentially break the installation."
    Write-Warning "Please reduce the length and retry again."
    throw "%PATH% is too long."
}

Write-Warning "size is $PathLen"

$vcpkgInstall = Join-Path $toolsDir 'vcpkgInstall.ps1'
Invoke-Expression "$vcpkgInstall"
