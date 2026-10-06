{ inputs, pkgs, ... }:

{

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  environment.systemPackages = with pkgs; [
    alacritty
    bibata-cursors
    bluez
    curl
    ffmpeg
    fuzzel
    equibop
    git
    gpu-screen-recorder-gtk
    grim
    imv
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    just
    mako
    ncdu
    neovim
    pkgs._7zip-zstd
    pkgs.stremio-linux-shell
    pulseaudio
    satty
    slurp
    tree
    vim
    wget
    wl-clipboard
    xwayland-satellite
  ];
}
