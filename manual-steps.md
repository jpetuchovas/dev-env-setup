# Manual Steps

A couple of manual steps to perform on a new computer.

## SSH Keys

Copy `id_rsa.pub` and `id_rsa` to `~/.ssh`. Then make sure the permissions are correct:

```bash
sudo chmod 600 ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
```

## GPG Keys

The quickest way is to just copy over the entire `~/.gnupg` directory.

## Dotfiles

Clone the dotfiles repository and run the installation script.

## Sound Effects

Turn off sound effects.
