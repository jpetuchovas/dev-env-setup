# Development Environment Setup

## macOS

Install Nix using [nix-installer](https://github.com/DeterminateSystems/nix-installer):

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --diagnostic-endpoint=""
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

If you plan to use nix-darwin to configure zsh, source a configuration file created by nix-darwin when `programs.zsh.enable` configuration option is set to `true` (this might need to be run again after a macOS update):

```bash
echo 'if test -e /etc/static/zshrc; then . /etc/static/zshrc; fi' | sudo tee -a /etc/zshrc
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

From now on, changes to the configuration can be applied by running:

```bash
nix build .#darwinConfigurations.${hostname}.system
./result/sw/bin/darwin-rebuild switch --flake .
```

To activate configuration changes such as autohiding the dock, log out and log in again.

## Misc

To clean up Nix store, run the following command:

```bash
nix store gc
```

Update flake lock file:

```bash
nix flake update
```
