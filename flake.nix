{
  description = "NixOS configuration with Niri and Noctalia";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Pinned to xwayland-satellite 0.8.1,
    # to work around https://github.com/ValveSoftware/steam-for-linux/issues/13566
    # (Steam dropdown/friends-list menus dismissing instantly)
    nixpkgs-xwsat-pin.url = "github:nixos/nixpkgs/567a49d1913ce81ac6e9582e3553dd90a955875f";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-nix = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{ self
    , nixpkgs
    , nixpkgs-xwsat-pin #pin
    , home-manager
    , niri-nix
    , noctalia
    , millennium
    , zen-browser
    , spicetify-nix
    }:
    {
      nixosConfigurations.styx = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          #pin
          {
            nixpkgs.overlays = [
              (final: prev: {
                xwayland-satellite =
                  (import nixpkgs-xwsat-pin { inherit (prev) system; }).xwayland-satellite;
              })
            ];
          }
          #end-pin
          ./hosts/styx/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "hm-bak";
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.loon = import ./users/loon/home.nix;
            home-manager.sharedModules = [
              niri-nix.homeModules.default
              noctalia.homeModules.default
              spicetify-nix.homeManagerModules.default
            ];
          }
        ];
      };
    };
}
