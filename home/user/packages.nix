{
  config,
  pkgs,
  herdr-nix,
  ...
}:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    herdr-nix.packages.${stdenv.hostPlatform.system}.default
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
