{ pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./desktop.nix
    ./filesystems.nix
    ./packages.nix
    ./services.nix
    ./settings.nix
    ../../programs/steam.nix
    ../../programs/sunshine.nix
    ../../programs/thunar.nix
  ];

  networking.hostName = "styx";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 4455 ]; #obs-websocket

  users.users.loon = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "bluetooth" "docker" ];
    shell = pkgs.bash;
  };

  virtualisation.docker.enable = true;

  system.stateVersion = "25.11";
}
