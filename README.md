Styx is a baseline setup for NixOS with Niri as the desktop environment and Noctalia shell.

Styx is a personal-use project that includes a host of gaming applications, a few art and music applications, and encoding software.

![](https://files.catbox.moe/xt94z6.png)
![](https://files.catbox.moe/qzum7b.png)
Wallpaper Artist: Poupée [@capo_sung](https://linktr.ee/capo_sung) - Wallpaper [Link](https://files.catbox.moe/h41he5.png)

-- Install NixOS Plasma LTS

*Required* Ensure you've checked "Allow unfree software" during install

*Recommended* Use btrfs instead of ext4

-- Once installed, reboot

-- Execute ```nixos-generate-config```

*Important* - Generating a hardware config should be done before your first rebuild

-- Modify /etc/nixos/configuration.nix

```
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
    kitty
  ];
 ```

You can ignore the filesystems, these are personal and left here as examples

``` 
#  fileSystems."/media-pool" = {
#    device = "192.168.50.39:/media-pool";
#    fsType = "nfs";
#    options = [ "x-systemd.automount" "noauto" ];
#  };
 
#  fileSystems."/home/loon/backup" = {
#    device = "/dev/sda1";
#    fsType = "ntfs";
#    options = [ "uid=1000" "gid=100" "umask=0077" ];
#  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Cachix
  nix.settings.extra-substituters = [ "https://noctalia.cachix.org" ];
  nix.settings.extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  nix.settings.substituters = [ "https://cache.nixos-cuda.org" ];
  nix.settings.trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
 ```

-- Execute ```nixos-rebuild switch``` to activate the changes
 
 *Important* - without the Cachix entries, any rebuild will take an extremely long time as CUDA libraries will be built from source
          CUDA is required for the NVENC codecs on Nvidia GPUs

```mkdir ~/styx ; cd ~/styx```

```git clone https://codeberg.org/alaserloon/dotfiles.git ~/styx```

*Important* 

-- Copy your generated hardware-configuration.nix to ~/styx/hosts/asphodel/ overwriting the existing one.

```cp /etc/nixos/hardware-configuration.nix ~/styx/hosts/asphodel/```

```nixos-rebuild switch --flake ~/styx#asphodel```

*Tip* - You can use the following command to find and replace all instances of ``asphodel`` (hostname) and ``loon`` (username) with your own using the following commands.

```find . -name "*.nix" -exec sed -i 's/asphodel/yourhostnamehere/g' {} \;```

```find . -name "*.nix" -exec sed -i 's/loon/yourusernamehere/g' {} \;```

Don't forget to change the directory names too, as this only edits the names in the nix files and not your directory tree.

-- Once the rebuild switch is completed, you will still be on Plasma. 
You can reboot or logout of Plasma to return to the greeter and login to Styx.
