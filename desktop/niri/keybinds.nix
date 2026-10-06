{
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
    spawn = "zen-beta";
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
  "Mod+Print" = {
    "spawn-sh" = "noctalia msg plugin noctalia/screen_recorder:service all replay-save";
  };
  "Mod+Shift+Print" = {
    "spawn-sh" = "noctalia msg plugin noctalia/screen_recorder:service all replay-toggle";
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

  "Mod+Ctrl+WheelScrollDown" = {
    _props = {
      cooldown-ms = 150;
    };
    "focus-monitor-right" = [ ];
  };
  "Mod+Ctrl+WheelScrollUp" = {
    _props = {
      cooldown-ms = 150;
    };
    "focus-monitor-left" = [ ];
  };
  "Mod+Ctrl+Shift+WheelScrollDown" = {
    _props = {
      cooldown-ms = 150;
    };
    "move-window-to-monitor-right" = [ ];
  };

  "Mod+Ctrl+Shift+WheelScrollUp" = {
    _props = {
      cooldown-ms = 150;
    };
    "move-window-to-monitor-left" = [ ];
  };

  # Monitors

  "Mod+Ctrl+Left" = {
    "focus-monitor-left" = [ ];
  };
  "Mod+Ctrl+Down" = {
    "focus-monitor-down" = [ ];
  };
  "Mod+Ctrl+Up" = {
    "focus-monitor-up" = [ ];
  };
  "Mod+Ctrl+Right" = {
    "focus-monitor-right" = [ ];
  };

  "Mod+Ctrl+Shift+Left" = {
    "move-column-to-monitor-left" = [ ];
  };
  "Mod+Ctrl+Shift+Up" = {
    "move-column-to-monitor-up" = [ ];
  };
  "Mod+Ctrl+Shift+Down" = {
    "move-column-to-monitor-down" = [ ];
  };
  "Mod+Ctrl+Shift+Right" = {
    "move-column-to-monitor-right" = [ ];
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
    "move-window-to-workspace" = 4;
  };
}
