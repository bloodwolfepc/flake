{ lib, config, pkgs, inputs, ... }: let 
  attrs = lib.custom.mkHomeApplication {
    name = "wl-crosshair";
    packages = [
      #TODO use pkgsFor system, use submap v and c to crosshair toggle
      inputs.wl-crosshair.packages.x86_64-linux.default
    ];
    inherit config;
  }; 
in {
  inherit (attrs) options config;
}
