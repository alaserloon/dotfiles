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
    "umbriel/animations.toml" = { source = ./animations.toml; force = true; };
    "umbriel/shaders/beam/effect.toml" = { source = ./shaders/beam/effect.toml; force = true; };
    "umbriel/shaders/beam/beam.glsl" = { source = ./shaders/beam/beam.glsl; force = true; };
    "umbriel/shaders/accent-pulse/effect.toml" = { source = ./shaders/accent-pulse/effect.toml; force = true; };
    "umbriel/shaders/accent-pulse/shader.glsl" = { source = ./shaders/accent-pulse/shader.glsl; force = true; };
    "umbriel/shaders/dual-orbit/effect.toml" = { source = ./shaders/dual-orbit/effect.toml; force = true; };
    "umbriel/shaders/dual-orbit/shader.glsl" = { source = ./shaders/dual-orbit/shader.glsl; force = true; };
  };
}
