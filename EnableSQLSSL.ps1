$myFQDN=(Get-WmiObject win32_computersystem).DNSHostName+"."+(Get-WmiObject win32_computersystem).Domain
Write-Host $myFQDN

Enable-DbaForceNetworkEncryption -SqlInstance $myFQDN
New-DbaComputerCertificate | Set-DbaNetworkCertificate -SqlInstance $myFQDN

Restart-DbaService -ComputerName $myFQDN -InstanceName MSSQLSERVER