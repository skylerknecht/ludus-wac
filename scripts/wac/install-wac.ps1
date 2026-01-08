param(
  [Parameter(Mandatory=$true)]
  [string]$MsiPath,
  [int]$Port = 443
)

# Example:
# .\install-wac.ps1 -MsiPath C:\Users\Administrator\Downloads\WindowsAdminCenter.msi

$log = "C:\Windows\Temp\wac-install.log"

Start-Process msiexec.exe -Wait -ArgumentList @(
  "/i", "`"$MsiPath`"",
  "/qn",
  "/L*v", $log,
  "SME_PORT=$Port"
)

Write-Host "WAC install attempted. Log: $log"