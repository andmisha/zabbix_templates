#
# Exchange (CopyQueueLenght) Template - version 1.1
# for Zabbix 6.x.x
#

# Please enter input param mailDB name
param($1)
# Add MS Exchange 2016-2019 PowerShell module
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
# Check empty input param
if($1 -ne $null)
{
    # Replace %%-prefix to \ (Zabbix discovery prototipe item key lifehack)
    $replace = $1.replace('%%','\')
    # Get CopyQueueLength
    # For filter please add | {($_.Status -in "Mounted") -and before $_.Name condition
    $getMailboxDatabaseCopyQueueLength = Get-MailboxDatabase | Get-MailboxDatabaseCopyStatus | select Name, CopyQueueLength | where -Property Name -in "$replace" | select CopyQueueLength
    # Write CopyQueueLength on screen
    $getMailboxDatabaseCopyQueueLength.CopyQueueLength
}
else
{
    write-host "No mailDB name found, please enter mailDB name!"
}