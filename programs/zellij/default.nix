{ config, lib, pkgs, ... }: {
  programs.zellij = {
    enable = true;

  };
  xdg.configFile."zellij/config.kdl".source = pkgs.replaceVars ./config/config.kdl {
    notesPath = "/syncthing/notes";
  };
}
