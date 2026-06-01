{ ... }: {

  wayland.windowManager.niri = {
    enable = true;
    settings = {

      hotkey-overlay = {
        skip-at-startup = [ ];
        hide-not-bound = [ ];
      };

      input = {
        keyboard = {
          xkb = {
            layout = "us";
          };
          numlock._args = [ ];
        };
        focus-follows-mouse._args = [ ];
      };

      output = [
        {
          _args = [ "DP-4" ];
          mode = "3440x1440@164.900";
          position._props = {
            x = 0;
            y = 0;
          };
          scale = 1.0;
          focus-at-startup._args = [ ];
        }
        {
          _args = [ "DP-5" ];
          mode = "2560x1440@143.972";
          position._props = {
            x = 3442;
            y = 0;
          };
          transform = "270";
        }
      ];



      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      layout = {
        gaps = 10;
        always-center-single-column._args = [ ];
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
        preset-column-widths = {
          _children = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
            { proportion = 1.0; }
          ];
        };
        default-column-width = { };
        focus-ring = {
          on._args = [ ];
          width = 2;
          active-color._args = [ "#A8AEFF" ];
          inactive-color._args = [ "#505050" ];
        };
        background-color = "transparent";
      };

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

      window-rule = [
        {
          geometry-corner-radius = 10;
          clip-to-geometry = true;
        }

        # Steam Notification Fix
        {
          match = {
            _props.app-id = "steam";
            _props.title._raw = ''r#"^notificationtoasts_\d+_desktop$"#'';
          };
          open-focused = false;
          default-floating-position = {
            _props = {
              x = 10;
              y = 10;
              relative-to = "bottom-right";
            };
          };
        }
        {
          match = {
            _props.app-id = "librewolf";
          };
          default-column-width = {
            proportion = 0.75;
          };
        }
      ];

      prefer-no-csd._args = [ ];

      spawn-at-startup = [
        {
          _args = [ "systemctl" "--user" "start" "hyprpolkitagent" ];
        }
        {
          _args = [ "arrpc" ];
        }
        {
          _args = [ "xwayland-satellite" ];
        }
        {
          _args = [ "noctalia" ];
        }
        {
          _args = [ "librewolf" ];
        }
      ];

      binds = {

        "Mod+slash" = {
          show-hotkey-overlay._args = [ ];
        };

        # Volume
        "XF86AudioRaiseVolume" = {
          "spawn-sh" = "noctalia msg volume-up";
        };
        "XF86AudioLowerVolume" = {
          "spawn-sh" = "noctalia msg volume-down";
        };
        "XF86AudioMute" = {
          "spawn-sh" = "noctalia msg volume-mute";
        };
        "shift+XF86AudioRaiseVolume" = {
          "spawn-sh" = "noctalia msg volume-up";
        };
        "shift+XF86AudioLowerVolume" = {
          "spawn-sh" = "noctalia msg volume-down";
        };
        "shift+XF86AudioMute" = {
          "spawn-sh" = "noctalia msg volume-mute";
        };
        "ctrl+XF86AudioMute" = {
          "spawn-sh" = "noctalia msg volume togglePanel";
        };

        # Media
        "XF86AudioPlay" = {
          "spawn-sh" = "noctalia msg media toggle";
        };
        "XF86AudioNext" = {
          "spawn-sh" = "noctalia msg media next";
        };
        "XF86AudioPrev" = {
          "spawn-sh" = "noctalia msg media previous";
        };

        # App launcher & shortcuts
        "Mod+space" = {
          _props.hotkey-overlay-title = "App Launcher";
          "spawn-sh" = "noctalia msg panel-toggle launcher";
        };
        "Mod+q" = {
          "close-window" = [ ];
        };
        "Mod+b" = {
          spawn = "librewolf";
        };
        "Mod+w" = {
          _props.hotkey-overlay-title = "Open Web Browser";
          spawn = "librewolf";
        };
        "Mod+Return" = {
          _props.hotkey-overlay-title = "Open Terminal";
          spawn = "kitty";
        };
        "Mod+e" = {
          _props.hotkey-overlay-title = "Open File Browser";
          spawn = "thunar";
        };
        "Mod+l" = {
          _props.hotkey-overlay-title = "Lock screen";
          "spawn-sh" = "noctalia msg session lock";
        };

        # Window control
        "Mod+f" = {
          "fullscreen-window" = [ ];
        };
        "Mod+v" = {
          "toggle-window-floating" = [ ];
        };

        # Screenshot
        "Print" = {
          screenshot = [ ];
        };
        "shift+Print" = {
          "screenshot-window" = [ ];
        };

        # Navigation - Columns
        "Mod+Left" = {
          "focus-column-left" = [ ];
        };
        "Mod+Right" = {
          "focus-column-right" = [ ];
        };
        "Mod+shift+WheelScrollDown" = {
          "focus-column-right" = [ ];
        };
        "Mod+shift+WheelScrollUp" = {
          "focus-column-left" = [ ];
        };

        # Navigation - Workspaces
        "Mod+Down" = {
          "focus-workspace-down" = [ ];
        };
        "Mod+Up" = {
          "focus-workspace-up" = [ ];
        };
        "Mod+WheelScrollDown" = {
          _props = {
            cooldown-ms = 150;
          };
          "focus-workspace-down" = [ ];
        };
        "Mod+WheelScrollUp" = {
          _props = {
            cooldown-ms = 150;
          };
          "focus-workspace-up" = [ ];
        };

        # Workspaces
        "Mod+1" = {
          "focus-workspace" = 1;
        };
        "Mod+2" = {
          "focus-workspace" = 2;
        };
        "Mod+3" = {
          "focus-workspace" = 3;
        };
        "Mod+4" = {
          "focus-workspace" = 4;
        };
        "Mod+shift+1" = {
          "move-window-to-workspace" = 1;
        };
        "Mod+shift+2" = {
          "move-window-to-workspace" = 2;
        };
        "Mod+shift+3" = {
          "move-window-to-workspace" = 3;
        };
        "Mod+shift+4" = {
          "move-window-to-workspace" = [ "4" ];
        };
      };
    };
  };
}
