# AGENTS.md

## Repository

This repository contains a NixOS flake configuration.

- `flake.nix`: flake inputs and NixOS/Home Manager wiring
- `hosts/nixos/configuration.nix`: system-level NixOS configuration
- `home/user/default.nix`: user-level Home Manager entrypoint for `yukihiro`
- `home/user/*.nix`: user-level Home Manager modules grouped by tool
- `hosts/nixos/hardware-configuration.nix`: generated hardware configuration

## Working Rules

- Keep system-wide settings in `hosts/nixos/configuration.nix`.
- Keep user preferences, shell setup, editor keymaps, and dotfile-like settings in `home/user/`.
- Do not edit `hosts/nixos/hardware-configuration.nix` unless the request is explicitly hardware-related.
- Keep changes small and focused.
- Do not run `nixos-rebuild switch` unless the user explicitly asks for applying the configuration.
- Do not commit changes unless the user explicitly asks for a commit.

## Validation

Use this from the repository root after changing Nix files:

```bash
nix flake check
```

To apply the configuration manually:

```bash
sudo nixos-rebuild switch --flake .#nixos
```

## Style

- Prefer existing NixOS and Home Manager module options over ad hoc file generation.
- Use Home Manager for per-user configuration.
- Use NixOS modules for OS services, users, packages, boot, networking, and login shells.
- Keep comments sparse and only add them when they clarify a non-obvious choice.
