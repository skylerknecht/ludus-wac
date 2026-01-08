New-VMSwitch -Name "vSwitch" -NetAdapterName (Get-NetAdapter | Where-Object Status -eq Up | Select-Object -First 1).Name -AllowManagementOS $true
