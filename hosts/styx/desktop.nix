{ pkgs, ... }:

{

  programs = {
    niri.enable = true;
    umbriel.enable = true;
    fish.enable = true;
    xfconf.enable = true;
    gpu-screen-recorder.enable = true;
    firefox = {
      enable = true;
      package = pkgs.firefox;
    };
  };

  environment.variables = {
    PROTON_ENABLE_WAYLAND = "1";
    DXVK_HDR = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    SDL_VIDEODRIVER = "wayland";
    XDG_CURRENT_DESKTOP = "Umbriel";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Umbriel";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    GTK_THEME = "Adwaita-dark";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "22";
  };

}
