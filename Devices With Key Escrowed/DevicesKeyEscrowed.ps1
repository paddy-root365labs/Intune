Connect-MgGraph -Scopes "Device.Read.All", "Directory.ReadWrite.All", "BitlockerKey.ReadBasic.All", "BitlockerKey.Read.All"
Get-MgDevice | Where-Object {$_.OperatingSystem -like "Windows*"} | export-CSV c:\temp\IntuneDevices.csv -Force
Get-MgInformationProtectionBitlockerRecoveryKey | Where-Object {$_.volumetype -eq "1"} | Sort-Object -Property deviceid -unique | export-csv c:\temp\AadBackedUpDevices.csv -Force
