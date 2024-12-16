{ lib, config, pkgs, ... }: let
  mkOneShots = let
    escape-to-mode = "INS";
    keys = [
      "GRAVE" "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "MINUS" "EQUAL"
      "q" "w" "e" "r" "t" "y" "u" "i" "o" "p" "BRACKETLEFT" "BRACKETRIGHT" "BACKSLASH"
      "a" "s" "d" "f" "g" "h" "j" "k" "l" "SEMICOLON" "APOSTROPHIE"
      "z" "x" "c" "v" "b" "n" "m" "COMMA" "PERIOD" "SLASH"
    ];
  in
    lib.concatStringsSep "\n" (map (key: "bindi = , ${keys}, submap, ${escape-to-mode}") keys);
  passOneshots = pkgs.writeText mkOneShots;
  submaps = [
    "EXEC" "WS" "EXEC_WS" "TERM" "MIGRATE"
    "POSITION" "REC" "MONITOR" "RESIZE"
  ];
  mkSubmap = map: ''
    submap = ${map}
      bindi = ${config.kb_ISN}, submap, INS
      bindi = ${config.kb_NML}, submap, NML
    submap = escape
  '';
  #${passOneshots}
in {
  wayland.windowManager.hyprland = {
    settings = lib.mkBefore { };
    extraConfig = lib.mkAfter ''
      ${lib.concatStringsSet "\n" (map mkSubmap submaps)}
    '';
  };
}
      


  #{ lib, config, ... }: {
  #  wayland.windowManager.hyprland = { 
  #    settings = lib.mkBefore {
  #      "submap, INS" = "submap, INS";
  #      "$pass-oneshots" = "/home/bloodwolfe/projects/flake/home-manager/bloodwolfe/modules/pc/pass-oneshots.conf"; #TODO add to nix store
  #    };
  #    extraConfig = lib.mkAfter ''
  #      
  #      submap = NML
  #        source = $pass-oneshots
  #      submap = escape
  #      
  #      #FOR EACH MODE
  #      
  #      submap = EXEC
  #        bindi = ,${config.kb_INS}, submap, INS
  #        bindi = ,${config.kb_NML}, submap, NML
  #        source = $pass-oneshots
  #      submap = escape
  #      submap = WS
  #        bindi = , ${config.kb_INS}, submap, INS
  #        bindi = , ${config.kb_NML}, submap, NML
  #        source = $pass-oneshots
  #      submap = escape
  #      submap = EXEC_WS
  #        bindi = , ${config.kb_INS}, submap, INS
  #        bindi = , ${config.kb_NML}, submap, NML
  #        source = $pass-oneshots
  #      submap = escape
  #      submap = TERM
  #        bindi = , ${config.kb_INS}, submap, INS
  #        bindi = , ${config.kb_NML}, submap, NML
  #        source = $pass-oneshots
  #      submap = escape
  #      submap = MIGRATE
  #        bindi = , ${config.kb_INS}, submap, INS
  #        bindi = , ${config.kb_NML}, submap, NML
  #        source = $pass-oneshots
  #      submap = escape
  #      submap = POSITION
  #        bindi = , ${config.kb_INS}, submap, INS
  #        bindi = , ${config.kb_NML}, submap, NML
  #        source = $pass-oneshots
  #      submap = escape
  #      submap = REC
  #        bindi = , ${config.kb_INS}, submap, INS
  #        bindi = , ${config.kb_NML}, submap, NML
  #        source = $pass-oneshots
  #      submap = escape
  #      submap = MONITOR
  #        bindi = , ${config.kb_INS}, submap, INS
  #        bindi = , ${config.kb_NML}, submap, NML
  #        source = $pass-oneshots
  #      submap = escape
  #      
  #      submap = RESIZE
  #        bindi = , ${config.kb_INS}, submap, INS
  #        bindi = , ${config.kb_NML}, submap, NML
  #      submap = escape
  #    '';
  #  };
  #}
