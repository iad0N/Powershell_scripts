# Reader Source URL
$url = "https://admdownload.adobe.com/bin/live/readerdc64_en_xa_crd_install.exe"
# Reader Destation file
$dest = "~\Downloads\readerdc64_en_xa_crd_install.exe"
# Download the Reader file
Invoke-WebRequest -Uri $url -OutFile $dest

# Ninite 7zip and Chrome Source URL
$url = "https://ninite.com/7zip-chrome/ninite.exe"
# Ninite Destation file
$dest = "~\Downloads\ninite.exe"
# Download the Ninite file
Invoke-WebRequest -Uri $url -OutFile $dest

# Start the Installation of Adobe Reader and Google Chrome and 7zip through Ninite
start-process "~\Downloads\readerdc64_en_xa_crd_install.exe" -NoNewWindow
start-process "~\Downloads\ninite.exe" -NoNewWindow


# Create a numbered list of directories where the script is located
Get-ChildItem -Path .\ -Name -Directory | ForEach-Object -Begin {$i=0} -Process {$i++

    "{0} {1}" -f $i,$_} -outvariable list
    
    $client = Read-Host 'Which client number?'
    
    $target = $list[$client-1].Split()[1]
    
    $target
    
# Copy client folder contents straight onto the desktop
Copy-Item ".\$target\*" -Destination "~\Desktop"
