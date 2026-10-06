# home-manager
{ pkgs, ... }:

{
  xdg.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.theme = null;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };
}
