{
  description = "NixOS configuration with Niri and Noctalia";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-nix = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      niri-nix,
      noctalia,
    }:
    {
      nixosConfigurations.asphodel = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/asphodel/configuration.nix
          home-manager.nixosModules.home-manager
          {
	    home-manager.backupFileExtension = "bak";
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.loon = import ./users/loon/home.nix;
            home-manager.sharedModules = [
              niri-nix.homeModules.default
              noctalia.homeModules.default
            ];
          }
        ];
      };
    };
}
