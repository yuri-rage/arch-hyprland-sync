# Arch Hyprland Sync

Linux config file sync via bash and Gnu stow.

Based heavily on ThePrimagen's work [here](https://github.com/ThePrimeagen/dev).

Unlicensed, as the original author did not license this but created video content showcasing its use as a tutorial.

### Install

> **Prerequisites:**
> * Bootable Arch Linux installation
> * User with sudo privileges

Issue the following in a bash shell:
```bash
cd ~
git clone https://www.github.com/yuri-rage/arch-hyprland-sync
cd arch-hyprland-sync
YURI_ENV="$PWD" ./run yay-install
YURI_ENV="$PWD" ./run stowall
```
> The `stowall` script may result in a few errors regarding existing files. Move the offending files to a backup directory and re-run it.

### Usage

The `scripts` directory contains install scripts for a fairly complete hyprland environment. You can use the the `--dry` flag to preview a script before running it like so:
```bash
YURI_ENV="$PWD" ./run hyprland-install --dry

```

Additional configuration files can be added in the `config` folder following the format of the existing ones. Any file added to an existing config or to a new config will by sync'd upon re-running the `stowall` script.

### Notes

If using the systemd `mount-smb` service to mount an smb share upon login, it expects a 3 line file called `~/.local/share/smb/smbcredentials` with the format:
```
username
WORKGROUP
password
```
Yes, the password is stored in the clear, so do not connect to a share whose security is critical. There's probably a much better way to do this. I don't know it.

