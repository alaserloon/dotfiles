{ pkgs, lib, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in

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
    enable = true;
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


  home.packages = with pkgs; [
    alacritty
    bash
    bat
    btop
    deadlock-mod-manager
    eza
    fastfetch
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
    mako
    nautilus
    pkgs.atuin
    pkgs.direnv
    pkgs.qbittorrent
    pkgs.vlc
    prismlauncher
    retroarch-full
    ripgrep
    starship
    unzip
    tigervnc
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
  programs.obs-studio = {
    enable = true;
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-gstreamer
      obs-vkcapture
      obs-websocket
    ];
  };
  programs.ripgrep.enable = true;
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
    theme = spicePkgs.themes.comfy;
    colorScheme = "catppuccin-mocha";
  };
  programs.starship.enable = true;
  # programs.vscode = {
  #   enable = true;
  #   package = pkgs.vscode.fhs;
  # };
  programs.yazi.enable = true;
  programs.yazi.shellWrapperName = "yy";
  programs.zoxide.enable = true;

  home.activation.flatpakSetup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.flatpak}/bin/flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub fr.handbrake.ghb || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub org.vinegarhq.Sober || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub net.lutris.Lutris || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub com.usebottles.bottles || true
    ${pkgs.flatpak}/bin/flatpak install --user -y https://chrisdkn.github.io/Amethyst-Mod-Manager/amethyst.flatpakref || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub io.github.Faugus.faugus-launcher || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub com.streamlabs.StreamlabsDesktop || true
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

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = [ "zen-beta-desktop" ];
    };
    defaultApplications = {
      "application/pdf" = [ "zen-beta.desktop" ];
      "text/html" = [ "zen-beta.desktop" ];
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/about" = [ "zen-beta.desktop" ];
      "x-scheme-handler/unknown" = [ "zen-beta.desktop" ];
      "image/png" = [ "imv-dir.desktop" ];
      "image/jpeg" = [ "imv-dir.desktop" ];
      "image/*" = [ "imv-dir.desktop" ];
      "video/mp4" = [ "vlc.desktop" ];
      "video/*" = [ "vlc.desktop" ];
    };
  };

  home.sessionVariables = {
    CLUTTER_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
    DISPLAY = ":0";
  };

  qt.platformTheme.name = "gtk3";

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.11";

}
