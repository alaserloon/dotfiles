# home-manager
{ ... }: {

  programs.noctalia = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./noctalia-config.toml);
  };
}
