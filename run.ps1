# Ensure the script runs with administrator privileges
If (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires administrator privileges. Please run as Administrator."
    Start-Sleep -Seconds 3
    Exit
}

# Retrieve laptop information
$laptopModel = (Get-WmiObject Win32_ComputerSystem).Model
$serialNumber = (Get-WmiObject Win32_BIOS).SerialNumber

# Combine information into a single message
$message = "Laptop Model: $laptopModel`nSerial Number: $serialNumber"

# Display information in a pop-up box
Add-Type -AssemblyName Microsoft.VisualBasic
[Microsoft.VisualBasic.Interaction]::MsgBox($message, 'Information', 'Laptop Details')
