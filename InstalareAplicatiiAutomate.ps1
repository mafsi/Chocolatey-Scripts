#--------------------------------INSTRUCȚIUNI DE FOLOSIRE--------------------------------------#
#Acest script instalează automat aplicațiile din LISTA DE APLICAȚII de mai jos
# care nu au un "#" în fața cuvîntului ”choco”;
# 
# Pentru a instala și alte programe în afara celor listate
# vizitează linkul https://chocolatey.org/packages ;
#
# ::::::::::::::::::::::::::::::::::::::TUTORIAL:::::::::::::::::::::::::::::::::::::::::::::::#
#
# Pe siteul https://chocolatey.org/packages fiecare aplicație care este afișată
# are comanda de instalare "choco install NUME APLICAȚIE"
# copiezi acea comandă și o adaugi în acest script la ce secțiune vrei DOAR ÎN LISTA DE APLICAȚII.
# Adaugă în coada comenzii pe care ai copiat-o "-y" fără ghilimele și cu un spațiu inaintea lui
# așa cum se vede și în LISTA DE APLICAȚII
#
# Salvezi fișierul și îl rulezi la orice instalare de Windows nou!
#
# Dacă mai tîrziu (la o nouă reinstalare a Windows) te razgîndești și nu mai vrei 
# să instalezi un anumit program din listă fie ștergi comanda "choco install NUME APLICAȚIE -y"
# fie îi adaugi un "#" în fața comenzii așa cum se vede în LISTA DE APLICAȚII
#
# Pentru a actualiza programele instalate prin Chocolatey
# deschide Chocolatey GUI din Meniul START din Windows după instalarea acestui script
#-----------------------------------------------------------------------------------------------#

#-----------------------------------------------------------------------------------------------#
#-----------------------------AICI ÎNCEPE SCRIPTUL! NU MODIFICA NIMIC!--------------------------#
#------------------------Adaugă comanda de instalare a unei aplicații noi-----------------------#
#--------------------DOAR la secțiunea LISTA DE APLICAȚII așa cum am arătat mai sus!------------#
#-----------------------------------------------------------------------------------------------#

# ::::Elevăm PowerShell la privilegii de Administrator

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  # Relaunch as an elevated process:
  Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs
  exit
}

Start-Sleep -Seconds 1

Write-Output "---------------------------------------------------"
Write-Output "Am elevat PowerShell la privilegii de Administrator" 
Write-Output "---------------------------------------------------"`n

Start-Sleep -Seconds 1

Write-Output "---------------------------"
Write-Output "Se instaleaza Chocolatey..."
Write-Output "---------------------------"`n

Start-Sleep -Seconds 1

# ::::: Instalam Chocolatey

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Start-Sleep -Seconds 1

# ::::: Set Global Confirmation to automate process of installing programs
choco feature enable -n=allowGlobalConfirmation

Start-Sleep -Seconds 1

Write-Output "`n--------------------------------------------------------------------------"
Write-Output "Instalam extensiile de baza in caz ca unele programe cer module aditionale" 
Write-Output "--------------------------------------------------------------------------"`n

choco install chocolatey-core.extension -y
choco install chocolatey-dotnetfx.extension -y
choco install chocolatey-font-helpers.extension -y
choco install chocolatey-misc-helpers.extension -y
choco install chocolatey-vscode.extension -y


Start-Sleep -Seconds 1.5

Write-Output "`n--------------------------------------"
Write-Output "Acum instalam interfata Chocolatey GUI" 
Write-Output "--------------------------------------"`n

choco install chocolateygui -y

Start-Sleep -Seconds 1.5

Write-Output "`n-----------------------------------------"
Write-Output "Auto-update Chocolatey" 
Write-Output "-----------------------------------------"`n

choco install -y choco-upgrade-all-at --params "'/WEEKLY:yes /DAY:MON /TIME:08:00'"
choco install -y choco-cleaner --params "'/WEEKLY:yes /DAY:MON /TIME:11:00'"

Start-Sleep -Seconds 1.5

Write-Output "`n-----------------------------------------"
Write-Output "Acum instalam toate aplicatiile din lista" 
Write-Output "-----------------------------------------"`n

Start-Sleep -Seconds 1.5

# :::::::::::::::::::::::::::::::::::::#
# ::::::::: LISTA DE APLICAȚII ::::::: #
# :::::::::::::::::::::::::::::::::::::#

# ::::: Browsers

choco install firefox -y
choco install chromium -y
choco install ungoogled-chromium -y     #Pachet pentru Chromium care reduce datele trimise spre Google; Trebuie instalat si pachetul de mai sus Chromium


# ::::: Text editors & Readers / IDEs

#choco install notepadplusplus.install -y
choco install vscode.install -y
choco install onedarkpro-vscode -y
choco install vscode-prettier -y
choco install winmerge -y
#choco install vscodium.install -y
#choco install adobereader -y # Adobe Reader DC

# ::::: Dev tools

choco install git -y
choco install nodejs.install -y
choco install github-desktop -y
choco install javaruntime -y
choco install strawberryperl -y
choco install vcredist-all -y
choco install python -y

# ::::: Media players & codecs

#choco install vlc -y
choco install k-litecodecpack-standard -y
choco install audacity -y
choco install audacity-lame -y
choco install audacity-ffmpeg -y
choco install ffmpeg -y
# choco install dopamine -y
choco install youtube-dl-gui.install -y
choco install youtube-dl -y
#choco install itunes -y

# ::::: Fonts
choco install FiraCode -y
choco install jetbrainsmono -y
choco install cascadiacode -y

# ::::: Utilities

choco install 7zip.install -y
#choco install gmailnotifier -y
#choco install google-backup-and-sync -y
choco install teamviewer -y
choco install etcher -y    #(Aplicație pentru flash .ISO similar cu Rufus)
#choco install -y rufus
choco install autohotkey -y
choco install autohotkey-compiler -y
choco install lockhunter -y
choco install poppler -y
choco install keepass.install -y
choco install syncthing -y
choco install syncthing-gtk -y
choco install winmerge -y
choco install megasync -y
choco install internet-download-manager -y

# ::::: Academic Tools

choco install zotero -y
choco install pandoc -y
choco install miktex -y

# ::::: Group Communication & Chat

choco install discord.install -y
choco install skype -y
choco install WhatsApp -y
choco install webex-meetings -y
choco install zoom -y

Start-Sleep -Seconds 0.5
Write-Output "`n--------------------------------------"
Write-Output "Am terminat! PowerShell se va închide!"
Write-Output "--------------------------------------"

Start-Sleep -Seconds 3