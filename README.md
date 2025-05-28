# Arch Hyprland Sync

Linux config file sync via bash and [Gnu stow](https://www.gnu.org/software/stow/).

Based heavily on ThePrimagen's work [here](https://github.com/ThePrimeagen/dev).

Unlicensed, as the original author did not license this but created video content showcasing its use as a tutorial.

## Install

> **Prerequisites:**
> * Bootable Arch Linux installation
> * User with sudo privileges
> * git (installed with `sudo pacman -S git`)

Issue the following in a bash shell:
```bash
cd ~
git clone https://www.github.com/yuri-rage/arch-hyprland-sync
cd arch-hyprland-sync
YURI_ENV="$PWD" ./run reflector-update-mirrorlist
YURI_ENV="$PWD" ./run yay-install
YURI_ENV="$PWD" ./run stow-all
```
> The `stow-all` script may result in a few errors regarding existing files. Move the offending files to a backup directory and re-run it. The sooner you execute the stow-all command on a newly configured system, the better, since most dotfiles won't yet exist, and you won't have to go to the trouble of moving them in bulk to a backup directory.

## Usage

The `scripts` directory contains install scripts for a fairly complete hyprland environment. To run a script, set the `YURI_ENV` environment variable to the cloned directory and use the `run` wrapper script. For example:

```bash
cd ~/arch-hyprland-sync
YURI_ENV="$PWD" ./run hyprland-install

```

You can use the the `--dry` flag to preview a script before running it like so:
```bash
cd ~/arch-hyprland-sync
YURI_ENV="$PWD" ./run hyprland-install --dry

```

Additional configuration files can be added in the `config` folder following the format of the existing ones. Any file added to an existing config or to a new config will by sync'd upon re-running the `stow-all` script.

To version control your own dotfiles, fork this repository and then push changes to dotfiles as desired. If `stow` is used properly, all edits will remain within the cloned directory, so pushing upstream should be as simple as editing, committing, and pushing to origin.

## NeoVim

After completing installation/configuration, use `:Mason` from within NeoVim to install the language servers, linters, and formatters required by `lsp-config.lua` and `none-ls.lua`.

## Notes

If using the systemd `mount-smb` service to mount an smb share upon login, it expects a 3 line file called `~/.local/share/smb/smbcredentials` with the format:
```
username
WORKGROUP
password
```
Yes, the password is stored in the clear, so do not connect to a share whose security is critical. There's probably a much better way to do this. I don't know it.

