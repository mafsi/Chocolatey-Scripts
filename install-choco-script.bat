:: Install choco .exe and add choco to PATH
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install dependencies -y

:: Install all the packages
:::: Browsers
choco install firefox -fy
choco install chromium -fy
choco install ungoogled-chromium -fy


:::: Text editors / IDEs
#choco install atom -fy
#choco install sublimetext3 -fy
#choco install visualstudiocode -fy
#choco install visualstudio2015community -fy
choco install vscodium.install -fy

:::: Dev tools
#choco install git -fy
#choco install nodejs.install -fy
choco install github-desktop -fy
choco install javaruntime -fy

:::: Media
choco install vlc -fy
choco install k-litecodecpack-standard -fy
choco install dopamine -y

:::: Utilities + other
choco install 7zip.install -fy
choco install gmailnotifier -fy
choco install google-backup-and-sync -fy

:::: Academic Tools
choco install webex-meetings -fy
choco install zoom -fy
choco install zotero -fy

:::: Communication
choco install discord.install -fy

::::: Sync & Backup
choco install google-backup-and-sync -fy
choco install teamviewer -fy