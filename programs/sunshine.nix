# nixos
{ pkgs, ... }:

{
  services.sunshine = {
    enable = true;
    autoStart = false; # Will need to start with `sunshine`
    capSysAdmin = true; # Needed on Wayland
    openFirewall = true;
    package = pkgs.sunshine.override {
      cudaSupport = true;
      cudaPackages = pkgs.cudaPackages;
    };
  };
}
