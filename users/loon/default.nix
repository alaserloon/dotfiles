{ ... }:

{
  imports = [
    ./packages.nix
    ./programs.nix
    ./flatpak.nix
    ./xdg.nix
    ./session.nix
    ../../desktop/niri.nix
    ../../desktop/umbriel/umbriel.nix
    ../../shell/kitty.nix
    ../../shell/bash.nix
    ../../shell/fish
    ../../shell/helix
    ../../shell/zellij
    ../../programs/noctalia
    ../../programs/obs.nix
    ../../programs/spicetify.nix
    ../../programs/thunar.nix
  ];

  home.username = "loon";
  home.homeDirectory = "/home/loon";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
