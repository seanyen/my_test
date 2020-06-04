$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Write-Warning "size is $Env:PATH.length"

$vcpkgInstall = Join-Path $toolsDir 'vcpkgInstall.ps1'
Invoke-Expression "$vcpkgInstall"
