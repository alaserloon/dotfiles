{ pkgs, ... }:

{
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

  home.sessionVariables = {
    CLUTTER_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    SDL_VIDEODRIVER = "wayland";
    XDG_CURRENT_DESKTOP = "Umbriel";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Umbriel";
  };

  qt.platformTheme.name = "gtk3";
}
