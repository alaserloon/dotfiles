# home-manager
{ pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-gstreamer
      obs-vkcapture
      obs-websocket
    ];
  };

  networking.firewall.allowedTCPPorts = [ 4455 ]; #obs-websocket
}
