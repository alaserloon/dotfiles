[
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
  {
    match = {
      _props.app-id = "zen-beta";
    };
    default-column-width = {
      proportion = 0.75;
    };
  }
]
