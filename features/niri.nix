{ config, pkgs, inputs, ... }:

{
  programs.niri.settings = {

    cursor = {
      theme = "Bibata-Modern-Ice";
      size = 22;
    };

    # Workspaces
    workspaces = {
      "main" = {
        open-on-output = "DP-4";
      };
      "browser" = {
        open-on-output = "DP-4";
      };
      "discord" = {
        open-on-output = "DP-5";
      };
      "music" = {
        open-on-output = "DP-5";
      };
    };

    # Outputs (monitors)
    outputs = {
      "DP-4" = {
        scale = 1.0;
        position = { x = 0; y = 0; };
        mode = {
          width = 3440;
          height = 1440;
          refresh = 165.0;
        };
        variable-refresh-rate = true;
        focus-at-startup = true;
      };
      "DP-5" = {
        scale = 1.0;
        position = { x = 3445; y = 0; };
        mode = {
          width = 2560;
          height = 1440;
          refresh = 165.0;
        };
        transform.rotation = 270;
      };
    };

    # Keyboard and input
    input = {
      keyboard = {
        xkb.layout = "us";
        numlock = true;
      };
      focus-follows-mouse.enable = true;
      warp-mouse-to-focus.enable = false;
    };

    # Keybinds
    binds = with config.lib.niri.actions; 
    let
      noctalia = cmd: [ "noctalia-shell" "ipc" "call" ] ++ (pkgs.lib.splitString " " cmd);
    in
    {
      # Volume
      "XF86AudioRaiseVolume".action.spawn = noctalia "volume increase";
      "XF86AudioLowerVolume".action.spawn = noctalia "volume decrease";
      "XF86AudioMute".action.spawn = noctalia "volume muteOutput";
      "shift+XF86AudioRaiseVolume".action.spawn = noctalia "volume increaseInput";
      "shift+XF86AudioLowerVolume".action.spawn = noctalia "volume decreaseInput";
      "shift+XF86AudioMute".action.spawn = noctalia "volume muteInput";
      "control+XF86AudioMute".action.spawn = noctalia "volume togglePanel";

      # Media
      "XF86AudioPlay".action.spawn = noctalia "media playPause";
      "XF86AudioNext".action.spawn = noctalia "media next";
      "XF86AudioPrev".action.spawn = noctalia "media previous";

      # App launcher & shortcuts
      "super+space".action.spawn = noctalia "launcher toggle";
      "super+q".action = close-window;
      "super+b".action.spawn = [ "librewolf" ];
      "super+Return".action.spawn = [ "kitty" ];
      "super+E".action.spawn = [ "thunar" ];
      "super+L".action.spawn = noctalia "lockScreen lock";

      # Window control
      "super+f".action = fullscreen-window;
      "super+v".action = toggle-window-floating;

      # Screenshot
      "Print".action.screenshot = [ ];
      "Shift+Print".action.screenshot-window = [ ];

      # Navigation - Columns
      "super+Left".action = focus-column-left;
      "super+Right".action = focus-column-right;
      "super+Shift+WheelScrollDown" = { action = focus-column-right; };
      "super+Shift+WheelScrollUp" = { action = focus-column-left; };

      # Navigation - Workspaces
      "super+Down".action = focus-workspace-down;
      "super+Up".action = focus-workspace-up;
      "super+WheelScrollDown" = { action = focus-workspace-down; cooldown-ms = 150; };
      "super+WheelScrollUp" = { action = focus-workspace-up; cooldown-ms = 150; };

      # Move windows
      "super+Alt+Left".action = move-column-left;
      "super+Alt+Right".action = move-column-right;
      "super+Alt+Down".action = move-column-to-workspace-down;
      "super+Alt+Up".action = move-column-to-workspace-up;

      # Workspace switching
      "super+1".action = focus-workspace "main";
      "super+2".action = focus-workspace "browser";
      "super+3".action = focus-workspace "discord";
      "super+4".action = focus-workspace "music";
    };

    # Layout
    layout = {
      gaps = 10;
      background-color = "transparent";
      focus-ring = {
        enable = true;
        width = 3;
        active = { color = "#A8AEFF"; };
        inactive = { color = "#505050"; };
      };
    };

    # Window and layer rules
    layer-rules = [
      {
        matches = [
          {
            namespace = "^noctalia-wallpaper*";
          }
        ];
        place-within-backdrop = true;
      }
    ];

    window-rules = [
      # Browsers
      {
        matches = [
          { app-id = "firefox"; }
        ];
        open-on-workspace = "browser";
      }
      {
        matches = [
          { app-id = "librewolf"; }
        ];
        open-on-workspace = "browser";
      }

      # Discord
      {
        matches = [
          { app-id = "vesktop"; }
        ];
        open-on-workspace = "discord";
      }
      {
        matches = [
          { app-id = "discord"; }
        ];
        open-on-workspace = "discord";
      }

      # Music
      {
        matches = [
          { title = "spotify_player"; }
        ];
        open-on-workspace = "music";
      }

      # Gaming
      {
        matches = [
          { app-id = "waywall"; }
        ];
        open-maximized = true;
      }

      # Global window styling
      {
        matches = [{ }];
        geometry-corner-radius = {
          top-left = 20.0;
          top-right = 20.0;
          bottom-left = 20.0;
          bottom-right = 20.0;
        };
        clip-to-geometry = true;
      }
    ];

    # UI settings
    hotkey-overlay = {
      skip-at-startup = true;
    };

    overview = {
      workspace-shadow.enable = false;
    };

    # Spawn at startup
    spawn-at-startup = [
      {
        command = [
          "systemctl"
          "--user"
          "start"
          "hyprpolkitagent"
        ];
      }
      { command = [ "arrpc" ]; }
      { command = [ "xwayland-satellite" ]; }
      { command = [ "noctalia-shell" ]; }
      { command = [ "librewolf" ]; }
    ];

    # Environment variables for Wayland
    environment = {
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
      DISPLAY = ":0";
    };
  };

  # Systemd user services
  systemd.user.startServices = "sd-switch";
}
