{ ... }:

{
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
}
