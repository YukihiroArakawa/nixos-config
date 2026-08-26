{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    ghq
    lazygit
    lefthook
    nerd-fonts.jetbrains-mono
    nixfmt
    ripgrep
    tree
    ulauncher
    vial
    ccusage
  ];
}
