$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$PathLen = $Env:PATH.length
Write-Warning "size is $PathLen"

$vcpkgInstall = Join-Path $toolsDir 'vcpkgInstall.ps1'
Invoke-Expression "$vcpkgInstall"
