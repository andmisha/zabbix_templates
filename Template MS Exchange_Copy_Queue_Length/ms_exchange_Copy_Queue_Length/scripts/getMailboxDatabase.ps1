#
# Exchange (CopyQueueLenght) Template - version 1.1
# for Zabbix 6.x.x
#

# Add MS Exchange 2016-2019 PowerShell module
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
# Get all Mailbox database list
# For filter please add | where -Property Status -in "Mounted" after select construction
$getMailboxDatabaseList= Get-MailboxDatabase | Get-MailboxDatabaseCopyStatus | select Name, Status | ConvertTo-Json
# Write getMailboxDatabaseList on screen
$getMailboxDatabaseList