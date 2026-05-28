{ config, pkgs, lib, ... }:

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

  hardware = {
    enableAllFirmware = true;
    graphics.enable = true;
    graphics.extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
    ];
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
    xone.enable = true;
    steam-hardware.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      package = pkgs.bluez;
    };
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
          user = "loon";
        };
      };
    };
    power-profiles-daemon.enable = true;
    upower.enable = true;
    dbus.enable = true;
    dbus.packages = with pkgs; [
      dconf
    ];
    flatpak.enable = true;
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    sunshine = {
      enable = true;
      autoStart = false; # Will need to start with `sunshine`
      capSysAdmin = true; # Needed on Wayland
      openFirewall = true;
    };
  };

  security.rtkit.enable = true;

  users.users.loon = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "bluetooth" ];
    shell = pkgs.bash;
  };

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alacritty
    bibata-cursors
    bluez
    cudatoolkit
    curl
    fuzzel
    equibop
    git
    gpu-screen-recorder-gtk
    krita
    mako
    nautilus
    neovim
    pkgs.firefoxpwa
    steam-run
    thunar-volman
    thunar-archive-plugin
    tree
    vim
    vulkan-tools
    wget
    wl-clipboard
    xwayland-satellite
  ];

  programs = {
    niri.enable = true;
    fish.enable = true;
    thunar.enable = true;
    xfconf.enable = true;
    gpu-screen-recorder.enable = true;
    firefox = {
      enable = true;
      package = pkgs.firefox;
      nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = [ "gnome" ];
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

  nixpkgs.config.cudaSupport = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Cachix
  nix.settings.extra-substituters = [ "https://noctalia.cachix.org" ];
  nix.settings.extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  nix.settings.substituters = [ "https://cache.nixos-cuda.org" ];
  nix.settings.trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];

  system.stateVersion = "25.11";
}
