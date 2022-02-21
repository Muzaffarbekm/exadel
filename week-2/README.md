[My Website](http://20.203.172.180/)

### Connection to AZURE STORAGE

#### LINUX

```
sudo mkdir /mnt/devops
if [ ! -d "/etc/smbcredentials" ]; then
sudo mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/exadeldevops.cred" ]; then
    sudo bash -c 'echo "username=exadeldevops" >> /etc/smbcredentials/exadeldevops.cred'
    sudo bash -c 'echo "password=gLy0cBgz6Rd8p0OJMk/gN3OD3Ni+I0/mqg5ZcnAmUfVrIcy5lJNsDr1Srz006U3XucZ1Ikp2MLFo+AStnXIFxA==" >> /etc/smbcredentials/exadeldevops.cred'
fi
sudo chmod 600 /etc/smbcredentials/exadeldevops.cred

sudo bash -c 'echo "//exadeldevops.file.core.windows.net/devops /mnt/devops cifs nofail,vers=3.0,credentials=/etc/smbcredentials/exadeldevops.cred,dir_mode=0777,file_mode=0777,serverino" >> /etc/fstab'
sudo mount -t cifs //exadeldevops.file.core.windows.net/devops /mnt/devops -o vers=3.0,credentials=/etc/smbcredentials/exadeldevops.cred,dir_mode=0777,file_mode=0777,serverino

```

#### Windows
```
$connectTestResult = Test-NetConnection -ComputerName exadeldevops.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"exadeldevops.file.core.windows.net`" /user:`"localhost\exadeldevops`" /pass:`"gLy0cBgz6Rd8p0OJMk/gN3OD3Ni+I0/mqg5ZcnAmUfVrIcy5lJNsDr1Srz006U3XucZ1Ikp2MLFo+AStnXIFxA==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\exadeldevops.file.core.windows.net\devops" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}

```

#### MacOS

```
open smb://exadeldevops:gLy0cBgz6Rd8p0OJMk%2FgN3OD3Ni%2BI0%2Fmqg5ZcnAmUfVrIcy5lJNsDr1Srz006U3XucZ1Ikp2MLFo%2BAStnXIFxA%3D%3D@exadeldevops.file.core.windows.net/devops

```



