{ config, pkgs, inputs, ... }:

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

  home.sessionVariables = {
    BROWSER = "librewolf";
    FILEMANAGER = "thunar";
    TERMINAL = "kitty";
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = "librewolf.desktop";
    "text/xml" = "librewolf.desktop";
    "application/xhtml+xml" = "librewolf.desktop";
    "application/vnd.mozilla.xul+xml" = "librewolf.desktop";
    "x-scheme-handler/http" = "librewolf.desktop";
    "x-scheme-handler/https" = "librewolf.desktop";
    "inode/directory" = "thunar.desktop";
    "text/plain" = "org.kde.kate.desktop";
    "text/x-c" = "org.kde.kate.desktop";
    "text/x-c++" = "org.kde.kate.desktop";
    "text/x-shellscript" = "org.kde.kate.desktop";
    "application/x-python" = "org.kde.kate.desktop";
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

  home.activation.flatpakSetup = ''
    ${pkgs.flatpak}/bin/flatpak install -y flathub com.spotify.Client
    ${pkgs.flatpak}/bin/flatpak install -y flathub fr.handbrake.ghb
    ${pkgs.flatpak}/bin/flatpak install -y flathub org.vinegarhq.Sober
  '';


  home.sessionVariables = {
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
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
