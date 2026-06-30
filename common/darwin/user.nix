{ pkgs, user, ... }:

{
  system.primaryUser = user;

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  home-manager.users.${user} =
    { pkgs, ... }:
    {
      imports = [
        ../home-manager-users.nix
      ];

      home.packages = import ../packages.nix { inherit pkgs; };
    };
}
