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
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    WLR_RENDER_DRM_DEVICE = "/dev/dri/by-path/pci-0000:01:00.0-render"; # Umbriel Issue
  };
}
