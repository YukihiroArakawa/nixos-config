{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    lazygit
    lefthook
    nerd-fonts.jetbrains-mono
    nixfmt
    ripgrep
    tree
    ulauncher
    vial
  ];
}
