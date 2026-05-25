{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../features/niri.nix
    ../../features/noctalia.nix
    ../../features/thunar.nix
#    ../../programs/bash.nix
#    ../../programs/fish
#    ../../programs/helix
#    ../../programs/wezterm
#    ../../programs/zellij
  ];

  home.username = "loon";
  home.homeDirectory = "/home/loon";
  home.stateVersion = "25.11";

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    size = 22;
    package = pkgs.bibata-cursors;
    x11.enable = true;
    gtk.enable = true;
  };
  
  home.sessionVariables = {
    BROWSER = "librewolf";
    TERMINAL = "kitty";
  };

  home.packages = with pkgs; [
    alacritty
    bash
    bat
    btop
    firefox
    fish
    foot
    fuzzel
    #handbrake # Use flatpak due to nvenc not working on nixpkgs.
    git
    mako
    pkgs.atuin
    pkgs.qbittorrent
    pkgs.vlc
    prismlauncher
    ripgrep
    starship
    yazi
  ];

  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.starship.enable = true;
  programs.yazi.enable = true;
  programs.yazi.shellWrapperName = "yy";

  home.activation.flatpakSetup = ''
  ${pkgs.flatpak}/bin/flatpak install -y flathub com.spotify.Client
  ${pkgs.flatpak}/bin/flatpak install -y flathub fr.handbrake.ghb
  ${pkgs.flatpak}/bin/flatpak install -y flathub org.vinegarhq.Sober
'';

  programs.home-manager.enable = true;
}
