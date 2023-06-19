# Install required module if not already installed
# Install-Module -Name PowerShellGraph -Force

# Import the required module
Import-Module -Name PowerShellGraph

# Define your Azure AD app credentials
$clientId = "YourClientId"
$clientSecret = "YourClientSecret"
$tenantId = "YourTenantId"

# Authenticate and retrieve an access token
$accessToken = Get-PowerGraphAccessToken -ClientId $clientId -ClientSecret $clientSecret -TenantId $tenantId

# Construct the API request URL
$uri = "https://graph.microsoft.com/v1.0/devices?$filter=bitlockerRecoveryKey%20ne%20null"

# Send the API request and retrieve the devices
$devices = Invoke-PowerGraphRequest -Uri $uri -AccessToken $accessToken

# Iterate through the devices and display their IDs
foreach ($device in $devices.value) {
    $deviceId = $device.id
    $deviceName = $device.displayName
    Write-Host "Device ID: $deviceId, Device Name: $deviceName"
}