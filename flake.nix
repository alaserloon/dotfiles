{
  description = "NixOS configuration with Niri and Noctalia";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = 
    inputs@{
      self,
      nixpkgs,
      home-manager,
      niri,
      noctalia,
      nixcord,
    }:
    {
      nixosConfigurations.asphodel = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/asphodel/configuration.nix
          home-manager.nixosModules.home-manager
          niri.nixosModules.niri
          
          {
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.loon = import ./users/loon/home.nix;
          }
        ];
      };
    };
}
