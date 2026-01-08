param(
  [string]$Name = "vSwitch"
)

# Internal is easiest for nested/lab. External is fine too, but requires real uplink.
if (-not (Get-VMSwitch -Name $Name -ErrorAction SilentlyContinue)) {
  New-VMSwitch -Name $Name -SwitchType Internal | Out-Null
}

Get-VMSwitch -Name $Name | Format-List Name,SwitchType