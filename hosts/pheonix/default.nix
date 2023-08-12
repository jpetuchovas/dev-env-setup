{ pkgs, hostName, ... }:

let
  user = "justinasp";
in {
  imports = [
    ../../common/nixos
    ./hardware-configuration.nix
  ];

  networking.hostName = hostName;

  services.openssh.enable = true;
  services.spice-vdagentd.enable = true;

  users.users.${user} = {
    extraGroups = [
      "wheel"
    ];
    hashedPassword = "$6$qy/S2xI7c.A7wRDi$qjvyPPvDUE1sleg8pOkj.tpaCrq51Qu/oKgjTfA4L7tL4T7rtlZRoy68yiKN1dcgafuUxkXsSfRY5AKQYTB8o0";
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
