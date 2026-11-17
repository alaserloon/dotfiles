# home-manager
{ ... }:

{
  programs.luciole = {
    enable = true;
    settings = ./config.toml;
  };
}
