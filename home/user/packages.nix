{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    lazygit
    nerd-fonts.jetbrains-mono
    ripgrep
    tree
    ulauncher
    vial
  ];
}
