# ﻿##############################################################
# #  Run the Virtual Desktop Optimization Tool (VDOT)
# ##############################################################
# # https://github.com/The-Virtual-Desktop-Team/Virtual-Desktop-Optimization-Tool

# # Download VDOT
# $URL = 'https://github.com/The-Virtual-Desktop-Team/Virtual-Desktop-Optimization-Tool/archive/refs/heads/main.zip'
# $ZIP = 'VDOT.zip'
# Invoke-WebRequest -Uri $URL -OutFile $ZIP -ErrorAction 'Stop'

# # Extract VDOT from ZIP archive
# Expand-Archive -LiteralPath $ZIP -Force -ErrorAction 'Stop'
    
# # Run VDOT
# & .\VDOT\Virtual-Desktop-Optimization-Tool-main\Windows_VDOT.ps1 -AcceptEULA -Restart

# Start-Process -FilePath "C:\newscaler\Executefileshare.bat"

#Set-Location -Path c:\newscaler

#.\Executefileshare.bat
#Start-Sleep -Seconds 45
#.\Executefileshare.bat
$connectTestResult = Test-NetConnection -ComputerName navdstorages.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"navdstorages.file.core.windows.net`" /user:`"localhost\navdstorages`" /pass:`"Dh0x7z/WihDwn0Cb1trJirFZEA/Dgj1uZ8cO84ScDb8lEdzPpC7Dd07+TAfjjZ0bP9IdWYVy6gGq+AStwibecw==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\navdstorages.file.core.windows.net\fileshare" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}
