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
    WLR_RENDER_DRM_DEVICE = "/dev/dri/by-path/pci-0000:01:00.0-render"; # Umbriel Issueo

    # proton config
    PROTON_USE_WAYLAND = 1;
    PROTON_USE_WOW64 = 1;
    WINEPIPEWIRE_RT = 1;

    #dxvk config
    # DXVK_FRAME_PACE = "low-latency-vrr-165";
    # PROTON_DXVK_LOWLATENCY = 1;

    # hdr
    DXVK_HDR = 1;
    PROTON_ENABLE_HDR = 1;
    ENABLE_HDR_WSI = 1;

    #vkd3d config
    # PROTON_VKD3D_LOWLATENCY = 1;
    # VKD3D_CONFIG = "descriptor_heap";

    # mesa config
    # MESA_SHADER_CACHE_MAX_SIZE = "12G";
    # RADV_EXPERIMENTAL = "heap";

    #logs 
    # PROTON_LOG=""+waylanddrv";
    # WAYLAND_DEBUG=1;
  };
}
