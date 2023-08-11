{ pkgs, hostName, ... }:

let
  user = "justinasp";
in {
  imports = [
    ../../common/nixos
    ./hardware-configuration.nix
  ];

  networking.hostName = hostName;

  programs.zsh.enable = true;

  services.openssh.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  home-manager.users.${user} = { pkgs, ... }:
  let
    common-packages = import ../../common/packages.nix { inherit pkgs; };
  in {
    imports = [
      ../../common/home-manager-users.nix
    ];

    home.packages = common-packages;
  };
}
