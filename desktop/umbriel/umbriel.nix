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
    "umbriel/outputs.toml" = { source = ./outputs.toml; force = true; };
    "umbriel/inputs.toml" = { source = ./inputs.toml; force = true; };
    "umbriel/keybinds.toml" = { source = ./keybinds.toml; force = true; };
    "umbriel/layout.toml" = { source = ./layout.toml; force = true; };
    "umbriel/appearance.toml" = { source = ./appearance.toml; force = true; };
    "umbriel/window-rules.toml" = { source = ./window-rules.toml; force = true; };
  };
}
