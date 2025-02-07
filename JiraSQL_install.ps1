$addonId = Read-Host "Please enter the Chrome addon ID"

# Create the directory
New-Item -Path "C:\Users\$env:USERNAME\JiraSQL" -ItemType Directory -Force

# Change to the directory
$previousDir = Get-Location
Set-Location -Path "C:\Users\$env:USERNAME\JiraSQL"

$outputFxFile = "JiraSQL_Firefox.json"
$jsonFxContent = @"
{
    "name": "jirasql",
    "description": "Program to run SQL scripts from JIRA",
    "path": "C:\\Users\\$env:USERNAME\\JiraSQL\\JiraSQL_local.exe",
    "type": "stdio",
    "allowed_extensions": ["JiraSQL@FRWKS"]
}
"@
# Write the JSON content to the file
Set-Content -Path $outputFxFile -Value $jsonFxContent -Encoding UTF8
Write-Host "JSON file created at $outputFxFile."


# Add the registry key
$regPath = "HKCU:\Software\Mozilla\NativeMessagingHosts\JiraSQL"
$regValue = "C:\Users\$env:USERNAME\JiraSQL\$outputFxFile"
# Create the registry key and set the default value
New-Item -Path $regPath -Force | Out-Null
Set-ItemProperty -Path $regPath -Name "(Default)" -Value $regValue
Write-Host "Registry key created at $regPath with value $regValue."


# Add the registry key
$regPath = "HKLM:\Software\Mozilla\NativeMessagingHosts\JiraSQL"
$regValue = "C:\Users\$env:USERNAME\JiraSQL\$outputFxFile"
# Create the registry key and set the default value
New-Item -Path $regPath -Force | Out-Null
Set-ItemProperty -Path $regPath -Name "(Default)" -Value $regValue
Write-Host "Registry key created at $regPath with value $regValue."


if (-not [string]::IsNullOrEmpty($addonId)) {

$outputChFile = "JiraSQL_Chrome.json"
$jsonChContent = @"
{
    "name": "jirasql",
    "description": "Program to run SQL scripts from JIRA",
    "path": "C:\\Users\\$env:USERNAME\\JiraSQL\\JiraSQL_local.exe",
    "type": "stdio",
    "allowed_origins": ["chrome-extension://$addonId/"]
}
"@
# Write the JSON content to the file
Set-Content -Path $outputChFile -Value $jsonChContent -Encoding UTF8
Write-Host "JSON file created at $outputChFile."

# Add the registry key
$regPath = "HKCU:\Software\Google\Chrome\NativeMessagingHosts\JiraSQL"
$regValue = "C:\Users\$env:USERNAME\JiraSQL\$outputChFile"
# Create the registry key and set the default value
New-Item -Path $regPath -Force | Out-Null
Set-ItemProperty -Path $regPath -Name "(Default)" -Value $regValue
Write-Host "Registry key created at $regPath with value $regValue."

# Add the registry key
$regPath = "HKLM:\Software\Google\Chrome\NativeMessagingHosts\JiraSQL"
$regValue = "C:\Users\$env:USERNAME\JiraSQL\$outputChFile"
# Create the registry key and set the default value
New-Item -Path $regPath -Force | Out-Null
Set-ItemProperty -Path $regPath -Name "(Default)" -Value $regValue
Write-Host "Registry key created at $regPath with value $regValue."

}

# Return to the previous directory
Set-Location $previousDir

Copy-Item -Path "JiraSQL_local.exe" -Destination "C:\Users\$env:USERNAME\JiraSQL\JiraSQL_local.exe" -Force
Write-Host "JiraSQL_local.exe copied."
