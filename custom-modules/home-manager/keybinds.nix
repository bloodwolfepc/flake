{ lib, ... }: {
  options = {
    kb_mod = lib.mkOption {
      default = "SUPER_L";
      type = lib.types.str;
    };
    kb_exec = lib.mkOption {
      default = "e";
      type = lib.types.str;
    };
  };
}
    
    
