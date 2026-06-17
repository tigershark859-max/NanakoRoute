# Set Working Directory
Split-Path $MyInvocation.MyCommand.Path | Push-Location
[Environment]::CurrentDirectory = $PWD

Remove-Item "$env:RELOADEDIIMODS/NanakoRoute/*" -Force -Recurse
dotnet publish "./NanakoRoute.csproj" -c Release -o "$env:RELOADEDIIMODS/NanakoRoute" /p:OutputPath="./bin/Release" /p:ReloadedILLink="true"

# Restore Working Directory
Pop-Location