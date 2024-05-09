### Install new DC 
# Define the parameters
$databasePath = "F:\NTDS" # Specify the path to the database
$domainName = "asmopsaz.com" # Specify the FQDN of the domain
$logPath = "F:\NTDS\Logs" # Specify the path to the log files
$siteName = "Default-First-Site-Name" # Specify the name of an existing site
$sysvolPath = "F:\SYSVOL" # Specify the path to the sysvol folder


# Install the AD DS role (Uncomment the next line if the role is not installed)
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

# Import the ADDSDeployment module
Import-Module ADDSDeployment

# Note: This script prompts for credentials of a user who has rights to add a domain controller.
# Install the domain controller into an existing domain
Install-ADDSDomainController `
	-NoGlobalCatalog:$false `
	-CreateDnsDelegation:$false `
	-Credential (Get-Credential) `
	-CriticalReplicationOnly:$false `
	-DatabasePath $databasePath `
	-DomainName $domainName `
	-InstallDns:$true `
	-LogPath $logPath `
	-NoRebootOnCompletion:$false `
	-SiteName $siteName `
	-SysvolPath $sysvolPath `
	-Force:$true


