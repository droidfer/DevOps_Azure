echo OFF

NET SESSION >nul 2>&1

IF %ERRORLEVEL% EQU 0 (
   echo.

) ELSE (
   echo.-------------------------------------------------------------
   echo ERROR: YOU ARE NOT RUNNING THIS WITH ADMINISTRATOR PRIVILEGES.
   echo. -------------------------------------------------------------
   echo. If you're seeing this, it means you don't have admin privileges!
   echo. You will need to restart this program with Administrator privileges by right-clicking and select "Run As Administrator"

   EXIT /B 1
)

echo.-------------------------------------------------------------
echo Chocolatey Install
echo. -------------------------------------------------------------
powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco feature enable -n=allowGlobalConfirmation

:: Azure Extension for VS Code
echo.-------------------------------------------------------------
echo VSCode Extensions Install
echo. -------------------------------------------------------------
powershell code --install-extension ms-vscode.powershell
powershell code --install-extension ms-azure-devops.azure-pipelines
powershell code --install-extension redhat.vscode-yaml
powershell code --install-extension msazurermtools.azurerm-vscode-tools
powershell code --install-extension ms-vscode.azure-account
powershell code --install-extension ms-azuretools.vscode-bicep



:: Azure CLI
echo.-------------------------------------------------------------
echo Azure CLI Install
echo. -------------------------------------------------------------
powershell Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force


:: Bicep 
echo.-------------------------------------------------------------
echo Bicep Install
echo. -------------------------------------------------------------
choco install bicep

echo.-------------------------------------------------------------
echo Install Complete
echo. -------------------------------------------------------------
