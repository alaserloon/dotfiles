{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "nfs" ];

  networking.hostName = "asphodel";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  hardware.enableAllFirmware = true;
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;    
    open = false;    
    nvidiaSettings = true;    
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
    default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
        user = "loon";
      };
    };
  };

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.dbus.enable = true;
  services.dbus.packages = with pkgs; [
    dconf
  ];


  users.users.loon = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "bluetooth" ];
    shell = pkgs.bash;
  };

  nixpkgs.config.allowUnfree = true;

#  xdg.portal = {
#    enable = true;
#    xdgOpenUsePortal = true;
#    extraPortals = with pkgs; [
#      xdg-desktop-portal-gtk
#      xdg-desktop-portal-gnome
#    ];
#    config = {
#      common.default = "gtk";
#      niri = {
#        default = [ "gnome" ];
#        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
#        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
#        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
#      };
#    };
#  };

  environment.systemPackages = with pkgs; [
    bibata-cursors
    bluez
    equibop
    curl
    fuzzel
    git
    kitty
    krita
    librewolf
    mako
    nautilus
    neovim
    steam-run
    tree
    vesktop
    vim
    vulkan-tools
    wget
    xwayland-satellite
  ];

    programs.niri = {
      enable = true;
    };
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-gtk
      ];
      config.common.default = ["gnome"];
    };

  programs.fish.enable = true;
  programs.thunar.enable = true;
  programs.firefox.enable = true;
  services.flatpak.enable = true;
  hardware.xone.enable = true;
  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  environment.variables = {
    DISPLAY = ":0";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    GTK_THEME = "Adwaita-dark";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "22";
  };

  environment.shellAliases = {
  spotify = "QT_QPA_PLATFORM=xcb spotify";
};

  environment.etc."spotify-wrapper".text = ''
    #!/bin/sh
    exec env QT_QPA_PLATFORM=xcb ${pkgs.spotify}/bin/spotify "$@"
  '';

  fileSystems."/media-pool" = {
    device = "192.168.50.39:/media-pool";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };

  fileSystems."/home/loon/backup" = {
    device = "/dev/sda1";
    fsType = "ntfs"; 
    options = [ "uid=1000" "gid=100" "umask=0077" ];
  };

  nix.settings = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
