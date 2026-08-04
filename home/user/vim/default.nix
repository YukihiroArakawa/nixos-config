{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set expandtab shiftwidth=2 tabstop=2 softtabstop=2
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
      csharp-ls
      ripgrep
      # Keep language servers on PATH so Neovim can use them without an extra installer layer.
      svelte-language-server
      stylua
      tree-sitter
      typescript
      typescript-language-server
      unzip
      vscode-langservers-extracted
      wget
    ];
  };

  xdg.configFile."nvim".source = ./nvim;
}
