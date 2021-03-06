sl C:\aws-aspnet-coreapp\src\aws-aspnet-coreapp

# Restore the nuget references
& "C:\Program Files\dotnet\dotnet.exe" restore

# Publish application with all of its dependencies and runtime for IIS to use
& "C:\Program Files\dotnet\dotnet.exe" publish --configuration release -o c:\aws-aspnet-coreapp\publish --runtime active


# Point IIS wwwroot of the published folder. CodeDeploy uses 32 bit version of PowerShell.
# To make use the IIS PowerShell CmdLets we need call the 64 bit version of PowerShell.
C:\Windows\System32\WindowsPowerShell\v1.0 -Command {Import-Module WebAdministration; Set-ItemProperty 'IIS:\sites\Default Web Site' -Name physicalPath -Value c:\aws-aspnet-coreapp\publish}
