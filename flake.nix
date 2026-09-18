{
  description = "Yukihiro NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    herdr-nix.url = "github:herdrdev/herdr-nix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      herdr-nix,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      formatter.${system} =
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        pkgs.writeShellApplication {
          name = "nixfmt-repository";
          runtimeInputs = [
            pkgs.git
            pkgs.nixfmt
          ];
          text = ''
            git ls-files -z -- '*.nix' ':!hosts/nixos/hardware-configuration.nix' \
              | xargs -0 --no-run-if-empty nixfmt
          '';
        };

      homeConfigurations.yukihiro = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit herdr-nix; };
        modules = [ ./home/user ];
      };

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./hosts/nixos/configuration.nix
        ];
      };
    };
}
