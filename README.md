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

### 2. Apply the NixOS configuration.

```terminal
$ sudo nixos-rebuild switch --flake .#nixos
```

### 3. Initialize Home Manager.

Run this once as `yukihiro` to apply the user configuration and install the
`home-manager` command.

```terminal
$ nix build .#homeConfigurations.yukihiro.activationPackage --out-link /tmp/home-manager-yukihiro
$ /tmp/home-manager-yukihiro/activate
```

## Updating configuration

- After changing files under `home/user/`, run `hms` (`home-manager switch --flake .#yukihiro`).
- After changing system-level NixOS configuration, run `nrs` (`sudo nixos-rebuild switch --flake .#nixos`).

## todo

- nix os
    - separation of nixos configuration and dotfiles.
    - for using mac os and nix os.
- agents
    - deny rules
- fingerprint login
- nvim
    - diagnostics list
    - git signs
    - comments
    - autopairs
- ulauncher
    - app focus if the app is opended
