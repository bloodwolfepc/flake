{ lib, ... }: let
  inherit (lib) mkOption types;
in {
  options = {
    mc = mkOption {
      default = [{ }];
      type = types.listOf (types.submodule {
        options = {
          mc-port-default = mkOption {
            type = types.str;
            default = "25565";
          };
          rcon-port-default = mkOption {
            type = types.str;
            default = "25567";
          };
          motd = mkOption {
            type = types.str;
            default = "never knows best.";
          };
        };
      });
    };
  };
}
                  
                
                

