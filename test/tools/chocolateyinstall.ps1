$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$vcpkgInstall = Join-Path $toolsDir 'vcpkgInstall.ps1'
Invoke-Expression "$vcpkgInstall"
