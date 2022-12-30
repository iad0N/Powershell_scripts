Clear-Host


$target = Get-ChildItem -Path ".\Clients" -Name -Directory | Out-GridView -Title "Who is this for?" -PassThru

Clear-Host

$SEL = get-content ".\Clients\$target\$target.txt"
if( $SEL -imatch "ForticlientVPN" )
{
      Copy-Item ".\Programs\FortiClientVPN.exe" -Destination "~\Desktop\FortiClientVPNOnlineInstaller_7.0.1.0083.exe"
      Write-Host "Copying Forticlient VPN Installer to Desktop"
}
else
{
   Write-Host 'Does not need Forticlient VPN'
}

if( $SEL -imatch "FortiClientEMS" )
{
      Copy-Item ".\Programs\FortiClientEMS.msi" -Destination "~\Desktop"
      Write-Host "Copying FortiClient EMS Installer to Desktop"
}
else
{
   Write-Host 'Does not need Forticlient EMS'
}

if( $SEL -imatch "anyconnect" )
{
      Copy-Item ".\Programs\anyconnect.msi" -Destination "~\Desktop"
      Write-Host "Copying Anyconnect VPN Installer to Desktop"
}
else
{
   Write-Host 'Does not need Anyconnect VPN'
}

if( $SEL -imatch "other" )
{
      Copy-Item ".\Clients\$target\Other\*" -Destination "~\Desktop"
      Write-Host "Copying All Other Necessary Files for Client to Desktop"
}
else
{
   Write-Host 'Does not need Anyconnect VPN'
}

Clear-Host
