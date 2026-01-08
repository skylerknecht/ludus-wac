Set-ExecutionPolicy Bypass -Force

# WinRM (WAC uses this to manage hosts)
Enable-PSRemoting -Force
winrm quickconfig -q

# Ensure WinRM firewall rules are on
Enable-NetFirewallRule -DisplayGroup "Windows Remote Management" -ErrorAction SilentlyContinue | Out-Null

# Allow ping (optional sanity)
New-NetFirewallRule -DisplayName "ICMPv4-In" -Protocol ICMPv4 -IcmpType 8 -Direction Inbound -Action Allow -ErrorAction SilentlyContinue | Out-Null