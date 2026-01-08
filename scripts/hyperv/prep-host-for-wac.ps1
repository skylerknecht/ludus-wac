# Make sure WAC can manage this host
Enable-PSRemoting -Force
Enable-NetFirewallRule -DisplayGroup "Windows Remote Management" -ErrorAction SilentlyContinue | Out-Null

# Kerberos auth for domain scenarios
Set-Item WSMan:\localhost\Service\Auth\Kerberos $true

# Print FQDN so you paste into WAC/vMode
$dn = (Get-CimInstance Win32_ComputerSystem).Domain
"$env:COMPUTERNAME.$dn"