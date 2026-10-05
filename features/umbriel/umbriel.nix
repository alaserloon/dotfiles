{ inputs, ... }:

{
  imports = [
    inputs.umbriel.nixosModules.default
  ];

  programs.umbriel = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./configuration.toml);
  };
}
