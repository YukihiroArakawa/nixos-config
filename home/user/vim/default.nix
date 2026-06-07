{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      inoremap jj <Esc>
    '';
  };
}
