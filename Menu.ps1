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

Write-Host "Installing Adobe Reader and Ninite with Chrome and 7-zip"

     start-process ".\Programs\ninite.exe" -NoNewWindow

# Download the installer

$source = "http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320053/AcroRdrDC1502320053_en_US.exe"
$destination = "~\Downloads\adobeDC.exe"

Invoke-WebRequest $source -OutFile $destination

# Start the installation

Start-Process -FilePath "~\Downloads\adobeDC.exe" -ArgumentList "/sPB /rs"


