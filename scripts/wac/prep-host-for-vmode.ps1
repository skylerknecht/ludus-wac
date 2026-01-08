# Ensure WinRM is listening and reachable
Enable-PSRemoting -Force
Set-Item WSMan:\localhost\Service\Auth\Kerberos $true
Set-Item WSMan:\localhost\Service\AllowUnencrypted $false

# Make sure firewall allows WinRM
Enable-NetFirewallRule -DisplayGroup "Windows Remote Management" | Out-Null

# Helpful: show FQDN so you paste it into vMode
$cs = Get-CimInstance Win32_ComputerSystem
$dn = (Get-CimInstance Win32_ComputerSystem).Domain
"$env:COMPUTERNAME.$dn" | Out-Host