$secpass = ConvertTo-SecureString $env:DOMAIN_ADMIN_PASSWORD -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("LAB\Administrator", $secpass)

Add-Computer -DomainName "lab.local" -Credential $cred -Force -Restart