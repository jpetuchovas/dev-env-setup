# Development Environment Setup

## macOS

Install Nix using [nix-installer](https://github.com/DeterminateSystems/nix-installer):

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install macos --diagnostic-endpoint=""
```

Install [Homebrew](https://github.com/Homebrew/brew):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Bootstrap [nix-darwin](https://github.com/LnL7/nix-darwin):

```bash
nix build .#darwinConfigurations.${hostname}.system

# Create a symlink from /run to /private/var/run required by nix-darwin. This step is needed since macOS does not allow any software to write to the root directory.
printf 'run\tprivate/var/run\n' | sudo tee -a /etc/synthetic.conf
# If the following command fails, restart the OS to achieve the same thing.
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t

./result/sw/bin/darwin-rebuild switch --flake .
```

If the macOS user was not created by nix-darwin and [Can't set user shell without giving nix-darwin complete control over my user](https://github.com/LnL7/nix-darwin/issues/328) issue is still not solved, run:

```bash
chsh -s /run/current-system/sw/bin/zsh
```

If `infocmp alacritty` produces an error, run:

```bash
ln -s ~/.nix-profile/share/terminfo/61/alacritty ~/.terminfo/61/alacritty
ln -s ~/.nix-profile/share/terminfo/61/alacritty-direct ~/.terminfo/61/alacritty-direct
```

If `infocmp tmux-256color` produces an error, run:

```bash
ln -s ~/.nix-profile/share/terminfo/74/tmux-256color ~/.terminfo/74/tmux-256color
```

From now on, changes to the configuration can be applied by running:

```bash
make switch
```

To activate configuration changes such as autohiding the dock, log out and log in again.

## NixOS VM

Download the [minimal NixOS ISO image](https://nixos.org/download.html#nixos-iso).

Create a VMware Fusion VM with the following settings:

* Display: 3D graphics acceleration, maximum shared graphics memory, and full resolution for Retina display.
* Hard Disk: SATA 192 GB.

Once the VM is booted, change the root password to "root":

```bash
sudo su
passwd
```

Run `ifconfig` in the VM to figure out its IP address and export an environment variable with the VM's IP address:

```bash
export VM_ADDRESS=<VM's IP address>
```

Perform NixOS installation:

```bash
make vm-install
```

Then run:

```bash
make vm-bootstrap
```

Finally, reboot the VM by using the `reboot` command. After that, clone this repository inside the VM and use `make switch` from now on.

## Rollback

List home-manager profile versions:

```bash
nix profile history
```

Switch to the previous home-manager profile version:

```bash
nix profile rollback
```

Switch to version 39 of the home-manager profile:

```bash
nix profile rollback --to 39
```

List nix-darwin profile versions:

```bash
darwin-rebuild --list-generations
# OR
nix profile history --profile /nix/var/nix/profiles/system
```

Switch to the previous nix-darwin profile version:

```bash
darwin-rebuild switch --rollback
```

Switch to version 30 of the nix-darwin profile:

```bash
darwin-rebuild -G 30
```
