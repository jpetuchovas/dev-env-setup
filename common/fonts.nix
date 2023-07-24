{ pkgs, ... }:

{
  fontDir.enable = true;
  fonts = with pkgs; [
    jetbrains-mono
  ];
}
