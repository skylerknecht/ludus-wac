$sw = $env:HYPERV_VSWITCH_NAME
if (-not $sw) { $sw = "vSwitch" }

# Create an internal vSwitch for lab traffic (simple + reliable in nested scenarios)
if (-not (Get-VMSwitch -Name $sw -ErrorAction SilentlyContinue)) {
  New-VMSwitch -Name $sw -SwitchType Internal | Out-Null
}