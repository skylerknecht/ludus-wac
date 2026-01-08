Enable-PSRemoting -Force
Enable-NetFirewallRule -DisplayGroup "Windows Remote Management"
Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

Set-Item WSMan:\localhost\Service\Auth\Kerberos $true

$dn = (Get-CimInstance Win32_ComputerSystem).Domain
"$env:COMPUTERNAME.$dn"
