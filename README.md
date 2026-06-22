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

- git clone without typing password. 
- agents
    - deny rules
- fingerprint login
- nix
    - compaction setting
- nvim
    - lsp
    - completion
    - formatting
    - linting
    - treesitter
    - diagnostics list
    - git signs
    - comments
    - autopairs
    - bufferline/statusline
- lazygit
    - ai commit
