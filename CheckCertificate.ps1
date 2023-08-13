$Server =(Get-WmiObject win32_computersystem).DNSHostName+"."+(Get-WmiObject win32_computersystem).Domain
## Run the test for each server and save to a variable (This uses PowerShell v4 or above code)
Invoke-DbaQuery -SqlInstance $Server -Database DBA_Support -Query "TRUNCATE TABLE Maintenance.NetworkCertificateCheck"
$Results = Get-DbaNetworkCertificate
## Convert to a daatatable
$DataTable = ConvertTo-DbaDataTable -InputObject $Results
Write-Output $DataTable
## Write to the database
Write-DbaDbTableData -SqlInstance $Server -Database DBA_Support -Schema Maintenance -Table NetworkCertificateCheck -KeepNulls -InputObject $DataTable
$Results2 = Invoke-DbaQuery -SqlInstance $Server -Database DBA_Support -Query "SELECT COUNT(*) as ValidCertCount FROM [DBA_Support].[Maintenance].[NetworkCertificateCheck] WHERE expires > DATEADD(MONTH, 2, GETDATE())"
$DataTable2 = ConvertTo-DbaDataTable -InputObject $Results2

Write-Host $Results2
Write-Host $DataTable2.ValidCertCount

if ($Results2.ValidCertCount) {
    Write-Host "Certificate Check passed"
}else {
    Write-Host "Certificate check failed, requesting new certificate"
    ##request and install new certificate
    if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent } 
    Invoke-Expression $PSScriptRoot\EnableSQLSSL.ps1
}
exit
