{ lib, config, pkgs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "sgpt";
    packages = with pkgs; [
      shell-gpt
    ];
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    sops.secrets."sgpt-config" = {
      path = "/home/bloodwolfe/.config/shell_gpt/.sgptrc";
    };
  };
in {
  inherit (attrs) options config;
}
