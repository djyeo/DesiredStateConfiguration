﻿[DSCLocalConfigurationManager()]
Configuration LCMPUSH 
{	
	Node $computername
	{
		Settings
		{
			AllowModuleOverwrite = $True
            ConfigurationMode = 'ApplyAndMonitor'
			RefreshMode = 'Push'
            RebootNodeIfNeeded = $True
            ActionAfterReboot = 'ContinueConfiguration'
		}
	}
}

$Computername = $null
$Computername = 'DSCLabDC01','DSCLabDC02','DSCLabS01','DSCLabS02','DSCLabS03','DSCLabS04'

# Create the Computer.Meta.Mof in folder
LCMPush -OutputPath C:\GIT\DesiredStateConfiguration\DSCResource\lab\LCM

$creds = get-credential
#Set-DscLocalConfigurationManager -ComputerName $computername -Path C:\GIT\DesiredStateConfiguration\DSCResource\lab\LCM\ -Verbose -Credential $creds