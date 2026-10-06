# home-manager
{ ... }: {

  programs.noctalia = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./config.toml);
  };
}
