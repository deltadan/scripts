### Install New Domain Controller Script ###

# Import the necessary PowerShell module
Import-Module ADDSDeployment

# Define DCPROMO parameters
$installationParams = @{
	DatabasePath            = "?F:\NTDS"         # Path to the database
	DomainName              = "???.com"          # Fully Qualified Domain Name (FQDN) of the domain
	LogPath                 = "?F:\NTDS\Logs"    # Path to the log files
	SiteName                = "???"              # Name of the existing site
	SysvolPath              = "?F:\SYSVOL"       # Path to the SYSVOL folder
	NoGlobalCatalog         = $false
	CreateDnsDelegation     = $false
	Credential              = Get-Credential     # Prompts for user credentials with rights to add a domain controller
	CriticalReplicationOnly = $false
	InstallDns              = $true
	NoRebootOnCompletion    = $false
	Force                   = $true
}

# Check and install the ADDS role if it is not already installed
if (-not (Get-WindowsFeature AD-Domain-Services).Installed) {
	Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
}

# Install the domain controller into an existing domain
Install-ADDSDomainController @installationParams



