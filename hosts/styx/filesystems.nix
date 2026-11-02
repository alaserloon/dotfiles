{ ... }:

{
  fileSystems."/media-pool" = {
    device = "192.168.50.39:/media-pool";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" ];
  };

  fileSystems."/home/loon/backup" = {
    device = "/dev/disk/by-id/ata-Samsung_SSD_840_Series_S14JNEACB10526N";
    fsType = "ntfs";
    options = [ "uid=1000" "gid=100" "umask=0077" ];
  };
}
