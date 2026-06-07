# nixos-config
## Prerequisites

- NixOS: 26.05.20260603.6b31628 (Yarara)

## installation

### 0. clone this repo.

```terminal
$ git clone https://github.com/YukihiroArakawa/nixos-config.git
$ cd nixos-config
```

### 1. activate nix flakes feature in `/etc/nixos/configuration.nix`.

```nix
nix.settings.experimental-features = [ "nix-command" "flakes"]; 
```

### 2. apply nixos configuration.

```terminal
$ sudo nixos-rebuild switch --flake .#nixos
```

## todo
- neovim
    - tab size
    - lazygit
    - remap jj to Esc
- terminal
    - alacritty
- tmux
    - copy from terminal
- browser(zen, brave, chrome)
- agents
    - deny rules
    - skills 
        - convesational commit 
- nixos
    - switch virtual desktops by `windows + 1/2/3`
