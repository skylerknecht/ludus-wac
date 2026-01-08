# Basic firewall + remoting baseline
Set-ExecutionPolicy Bypass -Force

# WinRM (often already enabled in templates, but safe)
Enable-PSRemoting -Force
winrm quickconfig -q

# Allow ICMP for quick sanity checks
New-NetFirewallRule -DisplayName "ICMPv4-In" -Protocol ICMPv4 -IcmpType 8 -Direction Inbound -Action Allow -ErrorAction SilentlyContinue | Out-Null