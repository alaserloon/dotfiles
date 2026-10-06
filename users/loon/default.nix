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
    ../../desktop/noctalia.nix
    ../../desktop/thunar.nix
    ../../shell/kitty.nix
    ../../shell/bash.nix
    ../../shell/fish
    ../../shell/helix
    ../../shell/zellij
    ../../programs/spictify.nix
    ../../programs/obs.nix
  ];

  home.username = "loon";
  home.homeDirectory = "/home/loon";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
