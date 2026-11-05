{ pkgs, ... }: {

  environment.systemPackages = [ pkgs.appimage-run ];

  programs.appimage = {
    enable = true;
    binfmt = true; # lets you run .AppImage files directly
    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [ pkgs.libsecret pkgs.gtk3 pkgs.nss ];
    };
  };
}
