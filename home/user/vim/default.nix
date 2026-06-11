{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      inoremap jj <Esc>
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      gcc
      gnumake
      lazygit
      lua-language-server
      nil
      nodejs
      ripgrep
      stylua
      tree-sitter
      unzip
      wget
    ];
  };

  xdg.configFile."nvim".source = ./nvim;
}
