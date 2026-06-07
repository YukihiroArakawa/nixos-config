{ config, pkgs, ... }:

{
  home.username = "yukihiro";
  home.homeDirectory = "/home/yukihiro";

  home.stateVersion = "26.05";

  programs.fish = {
    enable = true;
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake .#nixos";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  programs.vim = {
    enable = true;
    extraConfig = ''
      inoremap jj <Esc>
    '';
  };

  programs.git.enable = true;
}
