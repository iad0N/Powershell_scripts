# Reader Source URL
$url = "https://admdownload.adobe.com/bin/live/readerdc64_en_xa_crd_install.exe"
# Reader Destation file
$userpath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)
$dest = "$userpath\Downloads\reader.exe"
# Download the Reader file
Invoke-WebRequest -Uri $url -OutFile $dest

# Ninite 7zip and Chrome Source URL
$url = "https://ninite.com/7zip-chrome/ninite.exe"
# Ninite Destation file
$userpath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)
$dest = "$userpath\Downloads\ninite.exe"
# Download the Ninite file
Invoke-WebRequest -Uri $url -OutFile $dest

# Start the Installation of Adobe Reader and Google Chrome and 7zip through Ninite
start-process "$userpath\Downloads\Reader.exe"
start-process "$userpath\Downloads\ninite.exe"


# Get Client Name
Get-ChildItem -Path .\ -Name -Directory
$client = Read-Host -Prompt 'Based on the list above, name the client your setting up this computer for'

# Copy client folder contents straight onto the desktop
Copy-Item ".\$client\*" -Destination "$userpath\Desktop"

