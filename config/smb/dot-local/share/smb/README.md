To use the user level `mount-smb.service` included in the `arch-hyprland-sync` repository, create a file in this directory called `smbcredentials`.

That file should contain three lines with the following format:
```
username
WORKGROUP
password
```
Once the `smbcredentials` file is created, starting (or enabling) the `mount-smb.service` will connect to the file share at the address specified in the service file using those credentials.
