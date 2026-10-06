{ ... }:

{
  wayland.windowManager.niri = {
    enable = true;
    settings = {
      hotkey-overlay = {
        skip-at-startup = [ ];
        hide-not-bound = [ ];
      };
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      prefer-no-csd._args = [ ];
      overview = {
        workspace-shadow = {
          off._args = [ ];
        };
      };
      layer-rule = [
        {
          match = {
            _props.namespace._raw = ''r#"^noctalia-wallpaper.*"#'';
          };
          place-within-backdrop = true;
        }
      ];
      input = import ./inputs.nix;
      output = import ./outputs.nix;
      layout = import ./layout.nix;
      window-rule = import ./window-rules.nix;
      spawn-at-startup = import ./startup.nix;
      binds = import ./keybinds.nix;
    };
  };
}
