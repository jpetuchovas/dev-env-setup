# Development Environment Setup

## macOS

Install Determinate Nix using [nix-installer](https://github.com/DeterminateSystems/nix-installer):

```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate --diagnostic-endpoint=""
```

Install [Homebrew](https://github.com/Homebrew/brew):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Bootstrap [nix-darwin](https://github.com/LnL7/nix-darwin):

```bash
nix build .#darwinConfigurations.$(hostname).system

# Create a symlink from /run to /private/var/run required by nix-darwin. This step is needed since macOS does not allow any software to write to the root directory.
printf 'run\tprivate/var/run\n' | sudo tee -a /etc/synthetic.conf
# If the following command fails, restart the OS to achieve the same thing.
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t

sudo ./result/sw/bin/darwin-rebuild switch --flake .
```

If the macOS user was not created by nix-darwin and [Can't set user shell without giving nix-darwin complete control over my user](https://github.com/LnL7/nix-darwin/issues/328) issue is still not solved, run:

```bash
chsh -s /run/current-system/sw/bin/zsh
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
