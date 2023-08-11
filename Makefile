# Based on Mitchell Hashimoto's nixos-config Makefile:
# https://github.com/mitchellh/nixos-config/blob/main/Makefile
UNAME := $(shell uname)
HOSTNAME := $(shell hostname -s)
VM_ADDRESS ?= unset
ROOT_USER = root
FLAKE_PATH = /dev-env-setup
SSH_OPTIONS = -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no

switch:
ifeq ($(UNAME), Darwin)
	nix build .#darwinConfigurations.$(HOSTNAME).system
	./result/sw/bin/darwin-rebuild switch --flake .
else
	nixos-rebuild switch --flake .
endif

vm-install:
	ssh $(SSH_OPTIONS) $(ROOT_USER)@$(VM_ADDRESS) " \
		parted /dev/vda -- mklabel gpt; \
		parted /dev/vda -- mkpart primary 512MB -8GB; \
		parted /dev/vda -- mkpart primary linux-swap -8GB 100%; \
		parted /dev/vda -- mkpart ESP fat32 1MB 512MB; \
		parted /dev/vda -- set 3 esp on; \
		mkfs.ext4 -L nixos /dev/vda1; \
		mkswap -L swap /dev/vda2; \
		mkfs.fat -F 32 -n boot /dev/vda3; \
		mount /dev/disk/by-label/nixos /mnt; \
		mkdir -p /mnt/boot; \
		mount /dev/disk/by-label/boot /mnt/boot; \
		nixos-generate-config --root /mnt; \
		sed --in-place '/system\.stateVersion = .*/a \
			services.openssh.enable = true;\n \
			services.openssh.settings.PermitRootLogin = \"yes\";\n \
			users.users.root.initialPassword = \"root\";\n \
			networking.hostName = \"nixos-vm-aarch64\";\n \
		' /mnt/etc/nixos/configuration.nix; \
		nixos-install --no-root-passwd; \
		shutdown -h now; \
	"

vm-bootstrap:
	$(MAKE) vm-copy
	$(MAKE) vm-switch

vm-copy:
	rsync -av --delete -e 'ssh $(SSH_OPTIONS)' --exclude=.git ./ $(ROOT_USER)@$(VM_ADDRESS):$(FLAKE_PATH)

vm-switch:
	ssh $(SSH_OPTIONS) $(ROOT_USER)@$(VM_ADDRESS) "nixos-rebuild switch --flake $(FLAKE_PATH)"
