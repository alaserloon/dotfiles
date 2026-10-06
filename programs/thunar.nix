# nixos
{ pkgs, ... }:

{
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin # Archive support (zip, tar, etc)
      thunar-media-tags-plugin
      thunar-volman
    ];
  };

  # GUI archive manager that the archive plugin shells out to
  environment.systemPackages = [ pkgs.xarchiver ];
}
