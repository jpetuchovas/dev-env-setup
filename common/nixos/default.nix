{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  fonts = {
    fontDir.enable = true;
    packages = import ../font-packages.nix { inherit pkgs; };
  };

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes auto-allocate-uids
    '';
    package = pkgs.nixFlakes;
    settings.auto-optimise-store = true;
  };

  programs.zsh.enable = true;

  system.stateVersion = "23.11";
}
