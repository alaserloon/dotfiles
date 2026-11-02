{ ... }:

{
  fileSystems."/fshore" = {
    device = "192.168.50.39:/fshore";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" "nofail" "_netdev" ];
  };

  fileSystems."/home/loon/backup" = {
    device = "/dev/sda1";
    fsType = "ntfs";
    options = [ "uid=1000" "gid=100" "umask=0077" "nofail" ];
  };
}
