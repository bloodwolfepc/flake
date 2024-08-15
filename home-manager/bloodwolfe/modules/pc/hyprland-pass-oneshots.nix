{ lib, config, ... }: {
  wayland.windowManager.hyprland = { 
    settings = lib.mkBefore {
      "$submap-reset" = "submap, INS";
      "$pass-oneshots" = "$FLAKE/home/bloodwolfe/modules/pc/pass-oneshots.conf";
    };
    extraConfig = lib.mkAfter ''
      
      submap = NML
        source = $pass-oneshots
      submap = escape
      
      #FOR EACH MODE
      
      submap = EXEC
        bindi = ,${config.kb_INS}, submap, INS
        bindi = ,${config.kb_NML}, submap, NML
        source = $pass-oneshots
      submap = escape
      submap = WS
        bindi = , ${config.kb_INS}, submap, INS
        bindi = , ${config.kb_NML}, submap, NML
        source = $pass-oneshots
      submap = escape
      submap = EXEC_WS
        bindi = , ${config.kb_INS}, submap, INS
        bindi = , ${config.kb_NML}, submap, NML
        source = $pass-oneshots
      submap = escape
      submap = TERM
        bindi = , ${config.kb_INS}, submap, INS
        bindi = , ${config.kb_NML}, submap, NML
        source = $pass-oneshots
      submap = escape
      submap = MIGRATE
        bindi = , ${config.kb_INS}, submap, INS
        bindi = , ${config.kb_NML}, submap, NML
        source = $pass-oneshots
      submap = escape
      submap = POSITION
        bindi = , ${config.kb_INS}, submap, INS
        bindi = , ${config.kb_NML}, submap, NML
        source = $pass-oneshots
      submap = escape
      submap = REC
        bindi = , ${config.kb_INS}, submap, INS
        bindi = , ${config.kb_NML}, submap, NML
        source = $pass-oneshots
      submap = escape
      submap = MONITOR
        bindi = , ${config.kb_INS}, submap, INS
        bindi = , ${config.kb_NML}, submap, NML
        source = $pass-oneshots
      submap = escape
      
      submap = RESIZE
        bindi = , ${config.kb_INS}, submap, INS
        bindi = , ${config.kb_NML}, submap, NML
      submap = escape
    '';
  };
}
