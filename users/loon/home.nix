{ inputs, pkgs, lib, ... }:

{
  imports = [
    ../../features/niri.nix
    ../../features/noctalia.nix
    ../../features/thunar.nix
    ../../programs/kitty.nix
    ../../programs/bash.nix
    ../../programs/fish
    ../../programs/helix
    ../../programs/zellij
  ];

  home.username = "loon";
  home.homeDirectory = "/home/loon";

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    size = 22;
    package = pkgs.bibata-cursors;
    x11.enable = true;
    gtk.enable = true;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  wayland.windowManager.niri.enable = true;
  wayland.windowManager.niri.package = pkgs.niri;

  home.packages = with pkgs; [
    alacritty
    bash
    bat
    btop
    eza
    fd
    fish
    fuzzel
    fzf
    gh
    git
    jq
    kdePackages.kate
    kitty
    krita
    lazygit
    librewolf
    mako
    nautilus
    pkgs.atuin
    pkgs.direnv
    pkgs.qbittorrent
    pkgs.vlc
    prismlauncher
    ripgrep
    starship
    yazi
    zoxide
  ];

  programs.bat.enable = true;
  programs.eza.enable = true;
  programs.fd.enable = true;
  programs.fzf.enable = true;
  programs.gh.enable = true;
  programs.jq.enable = true;
  programs.lazygit.enable = true;
  programs.ripgrep.enable = true;
  programs.starship.enable = true;
  programs.yazi.enable = true;
  programs.yazi.shellWrapperName = "yy";
  programs.zoxide.enable = true;

  home.activation.flatpakSetup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.flatpak}/bin/flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub com.spotify.Client || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub fr.handbrake.ghb || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub org.vinegarhq.Sober || true
  '';

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      niri = {
        default = [ "gnome" "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
      common.default = [ "gtk" ];
    };
  };

  home.sessionVariables = {
    CLUTTER_BACKEND = "wayland";
    # GDK_BACKEND = "wayland,x11";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
    DISPLAY = ":0";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";

}
