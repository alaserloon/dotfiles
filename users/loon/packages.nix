{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    bash
    bat
    btop
    deadlock-mod-manager
    eza
    fastfetch
    fd
    fish
    fuzzel
    fzf
    gh
    git
    jq
    kdePackages.kate
    kitty
    krita
    lazygit
    mako
    nautilus
    pkgs.atuin
    pkgs.direnv
    pkgs.qbittorrent
    pkgs.vlc
    prismlauncher
    retroarch-full
    ripgrep
    starship
    unzip
    tigervnc
    yazi
    zoxide
  ];
}
