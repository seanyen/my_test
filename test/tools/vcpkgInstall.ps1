$ErrorActionPreference = 'Stop';

$Uri = 'https://github.com/Microsoft/vcpkg.git'
$RootDir = 'C:\opt'
$InstallDir = "$RootDir\vcpkg"
$VcpkgVersion = "2020.04"

try {
  New-Item -ItemType Directory -Path $RootDir -Force | Out-Null

  Write-Host 'Deploying vcpkg...'
  if (-Not (Test-Path -Path "$InstallDir\vcpkg.exe" -PathType Leaf)) {
    if (-Not (Test-Path -Path $InstallDir -PathType Container)) {
      $Env:GIT_REDIRECT_STDERR="2>&1"
      git clone --depth=1 $Uri $InstallDir -q -b $VcpkgVersion | Out-null
      Invoke-Expression "$InstallDir\scripts\bootstrap.ps1"
    } else {
      throw "remove $InstallDir and reinstall again."
    }
  } else {
    Write-Host 'Vcpkg.exe is found. Skip deploying vcpkg...'
  }

  Write-Host 'Validating vcpkg...'
  Invoke-Expression "$InstallDir\vcpkg.exe version"

  Write-Host 'Deploying vcpkg... done.'
}
catch {
  Write-Warning "Vcpkg is not installed properly."
  Write-Warning "Visit https://github.com/microsoft/vcpkg for more help."
  throw
}
