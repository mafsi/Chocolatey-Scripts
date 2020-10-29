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

ECHO "---------------------------------------------------"
ECHO "Am elevat PowerShell la privilegii de Administrator" 
ECHO "---------------------------------------------------"`n

Start-Sleep -Seconds 1

ECHO "---------------------------"
ECHO "Se instaleaza Chocolatey..."
ECHO "---------------------------"`n

Start-Sleep -Seconds 1

# ::::: Instalam Chocolatey

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Start-Sleep -Seconds 1

# ::::: Set Global Confirmation to automate process of installing programs
choco feature enable -n=allowGlobalConfirmation

Start-Sleep -Seconds 1

ECHO "`n--------------------------------------------------------------------------"
ECHO "Instalam extensiile de baza in caz ca unele programe cer module aditionale" 
ECHO "--------------------------------------------------------------------------"`n

choco install chocolatey-core.extension -y

Start-Sleep -Seconds 1.5

ECHO "`n--------------------------------------"
ECHO "Acum instalam interfata Chocolatey GUI" 
ECHO "--------------------------------------"`n

choco install chocolateygui -y

Start-Sleep -Seconds 1.5

ECHO "`n-----------------------------------------"
ECHO "Acum instalam toate aplicatiile din lista" 
ECHO "-----------------------------------------"`n

Start-Sleep -Seconds 1.5

# :::::::::::::::::::::::::::::::::::::#
# ::::::::: LISTA DE APLICAȚII ::::::: #
# :::::::::::::::::::::::::::::::::::::#


# ::::: Browsers

choco install firefox -y
choco install chromium -y
choco install ungoogled-chromium -y            #Pachet pentru Chromium care reduce datele trimise spre Google; Trebuie instalat si pachetul de mai sus Chromium


# ::::: Text editors & Readers / IDEs

#choco install notepadplusplus.install -y
#choco install visualstudiocode -y
choco install vscodium.install -y
#choco install adobereader -y # Adobe Reader DC

# ::::: Dev tools

#choco install git -y
#choco install nodejs.install -y
choco install github-desktop -y
choco install javaruntime -y

# ::::: Media players & codecs

choco install vlc -y
choco install k-litecodecpack-standard -y
#choco install dopamine -y
#choco install itunes -y

# ::::: Utilities

#choco install 7zip.install -y
choco install gmailnotifier -y
choco install google-backup-and-sync -y
choco install teamviewer -y
choco install etcher -y           #(Aplicație pentru flash .ISO similar cu Rufus)

# ::::: Academic Tools

choco install webex-meetings -y
choco install zoom -y
choco install zotero -y

# ::::: Group Communication & Chat

choco install discord.install -y

Start-Sleep -Seconds 0.5
ECHO "`n--------------------------------------"
ECHO "Am terminat! PowerShell se va închide!"
ECHO "--------------------------------------"

Start-Sleep -Seconds 3