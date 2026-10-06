{ pkgs, lib, ... }:

{
  home.activation.flatpakSetup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub fr.handbrake.ghb || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub org.vinegarhq.Sober || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub net.lutris.Lutris || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub com.usebottles.bottles || true
    ${pkgs.flatpak}/bin/flatpak install --user -y https://chrisdkn.github.io/Amethyst-Mod-Manager/amethyst.flatpakref || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub io.github.Faugus.faugus-launcher || true
    ${pkgs.flatpak}/bin/flatpak install --user -y flathub com.streamlabs.StreamlabsDesktop || true
  '';
  # ${pkgs.flatpak}/bin/flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}
