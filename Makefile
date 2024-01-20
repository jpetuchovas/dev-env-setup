# Based on Mitchell Hashimoto's nixos-config Makefile:
# https://github.com/mitchellh/nixos-config/blob/main/Makefile
UNAME := $(shell uname)
HOSTNAME := $(shell hostname -s)

VM_ADDRESS ?= FIXME
VM_HOSTNAME ?= nixos-vm-aarch64
VM_USER ?= justinasp
FLAKE_PATH = /dev-env-setup
SSH_OPTIONS = -o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no

switch:
ifeq ($(UNAME), Darwin)
	nix build .#darwinConfigurations.$(HOSTNAME).system
	./result/sw/bin/darwin-rebuild switch --flake .
else
	sudo nixos-rebuild switch --flake .
endif

test:
ifeq ($(UNAME), Darwin)
	nix build .#darwinConfigurations.$(HOSTNAME).system
	./result/sw/bin/darwin-rebuild check --flake .
else
	sudo nixos-rebuild test --flake .
endif

format:
	nix fmt .

update:
	nix flake update

gc:
ifeq ($(UNAME), Darwin)
	nix profile wipe-history
	sudo nix-collect-garbage --delete-old
	brew cleanup --prune=all
else
	nix profile wipe-history
	sudo nix-collect-garbage --delete-old
endif

vm-install:
	ssh $(SSH_OPTIONS) $(ROOT_USER)@$(VM_ADDRESS) " \
		parted /dev/sda -- mklabel gpt; \
		parted /dev/sda -- mkpart primary 512MB -8GB; \
		parted /dev/sda -- mkpart primary linux-swap -8GB 100%; \
		parted /dev/sda -- mkpart ESP fat32 1MB 512MB; \
		parted /dev/sda -- set 3 esp on; \
		mkfs.ext4 -L nixos /dev/sda1; \
		mkswap -L swap /dev/sda2; \
		mkfs.fat -F 32 -n boot /dev/sda3; \
		mount /dev/disk/by-label/nixos /mnt; \
		mkdir -p /mnt/boot; \
		mount /dev/disk/by-label/boot /mnt/boot; \
		nixos-generate-config --root /mnt; \
		sed --in-place '/system\.stateVersion = .*/a \
			services.openssh.enable = true;\n \
			services.openssh.settings.PermitRootLogin = \"yes\";\n \
			users.users.root.initialPassword = \"root\";\n \
			networking.hostName = \"$(VM_HOSTNAME)\";\n \
		' /mnt/etc/nixos/configuration.nix; \
		nixos-install --no-root-passwd && reboot; \
	"

vm-bootstrap:
	VM_USER=root $(MAKE) vm-copy-repo
	VM_USER=root $(MAKE) vm-switch
	$(MAKE) vm-copy-secrets

vm-copy-repo:
	rsync -av --delete -e 'ssh $(SSH_OPTIONS)' --exclude=.git ./ $(VM_USER)@$(VM_ADDRESS):$(FLAKE_PATH)

vm-switch:
	ssh $(SSH_OPTIONS) $(VM_USER)@$(VM_ADDRESS) "nixos-rebuild switch --flake $(FLAKE_PATH)"

vm-copy-secrets:
	rsync -av -e 'ssh $(SSH_OPTIONS)' --exclude=.DS_STORE --exclude=config $(HOME)/.ssh/ $(VM_USER)@$(VM_ADDRESS):~/.ssh
