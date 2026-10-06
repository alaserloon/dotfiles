# nixos
{ inputs, pkgs, ... }:

{

  hardware = {
    graphics.extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
    ];
    xone.enable = true;
    steam-hardware.enable = true;
  };

  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.gamescope.enable = true;

  environment.systemPackages = with pkgs; [
    protonup-qt
    steam-run
  ];

  environment.variables = {
    PROTON_ENABLE_WAYLAND = "1";
    DXVK_HDR = "1";
  };

  nixpkgs.overlays = [ inputs.millennium.overlays.default ];

}
