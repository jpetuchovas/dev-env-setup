# Based on Mitchell Hashimoto's nixos-config Makefile:
# https://github.com/mitchellh/nixos-config/blob/main/Makefile
HOSTNAME := $(shell hostname -s)

switch:
	nix build .#darwinConfigurations.$(HOSTNAME).system
	sudo ./result/sw/bin/darwin-rebuild switch --flake .

format:
	nix fmt .

update:
	nix flake update

gc:
	nix profile wipe-history
	# Both calls with and without sudo are required to delete old home-manager
	# and system-wide profile generations.
	nix-collect-garbage -d
	sudo nix-collect-garbage -d
	brew cleanup --prune=all
