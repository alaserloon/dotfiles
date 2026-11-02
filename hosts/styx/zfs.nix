{ ... }:
{
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false; # root isn't on ZFS
  networking.hostId = "deadbeef"; # required; must be unique, see below
  services.zfs.autoScrub.enable = true;
}
