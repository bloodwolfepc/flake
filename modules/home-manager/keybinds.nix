{ lib, ... }: {
  options = {
    kb_NML = lib.mkOption {
      default = "SUPER_L";
      type = lib.types.str;
    };
    kb_EXEC = lib.mkOption {
      default = "e";
      type = lib.types.str;
    };
    #might move to w and change f to find
    kb_WS = lib.mkOption {
      default = "f";
      type = lib.types.str;
    };
    kb_EXEC_WS = lib.mkOption {
      default = "d";
      type = lib.types.str;
    };
    kb_EXEC_TERM = lib.mkOption {
      default = "t";
      type = lib.types.str;
    };
    kb_MIGRATE = lib.mkOption {
      default = "g";
      type = lib.types.str;
    };
    kb_POSITION = lib.mkOption {
      default = "o";
      type = lib.types.str;
    };
    kb_RESIZE = lib.mkOption {
      default = "r";
      type = lib.types.str;
    };
    kb_REC = lib.mkOption {
      default = "s";
      type = lib.types.str;
    };
    kb_MONITOR = lib.mkOption {
      default = "m";
      type = lib.types.str;
    };
  };
}
    
    
