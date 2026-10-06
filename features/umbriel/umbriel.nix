{ inputs, ... }:

{
  imports = [
    inputs.umbriel.homeModules.default
  ];

  programs.umbriel = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./configuration.toml);
  };

  xdg.configFile = {
    "umbriel/outputs.toml".source = ./outputs.toml;
    "umbriel/inputs.toml".source = ./inputs.toml;
    "umbriel/keybinds.toml".source = ./keybinds.toml;
    "umbriel/layout.toml".source = ./layout.toml;
    "umbriel/window-rules.toml".source = ./window-rules.toml;
    "umbriel/appearance.toml".source = ./appearance.toml;
  };

}
