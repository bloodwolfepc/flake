{ pkgs, lib, inputs, ... }: let
  minecraftServer = _config: rec {
    srv = {
      name = "minecraft server";
      motd = "sample text";
      package = pkgs.papermc;
      dataDir = "/data/srv/minecraft" ;
    };
    net = {
      hostaddress = "10.11.0.1";
      localAddress = "10.12.0.1";
      ports = {
        minecraft = "25565";
        rcon = "35567";
      };
    };
    containerAttrs = let
      worlds = [ "world" "world_nether" "world_the_end" ]; #depends enabled
      bindMountAttrs = world: {
        hostPath = "${srv.dataDir}/${srv.name}/${world}";
        mountPoint = "/srv/minecraft/${srv.name}/${world}";
        isReadOnly = false;
      };
    in {
      autoStart = true;
      ephemeral = true;
      privateNetwork = true;
      ports = lib.attrValues net.ports;
      hostAddress = net.hostAddress;
      localAddress = net.localAddress;
      forwardPorts = lib.attrValues (lib.genAttrs (builtins.attrNames net.ports) (portName: {
        containerPort = net.ports.${portName};
        hostPort = net.ports.${portName};
      }));
      bindmounts = lib.genAttrs worlds bindMountAttrs;
      config = { pkgs, ... }: containerAttrs';
    };
    containerAttrs' = { 
      imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
      nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
      system.stateVersion = "24.05";
      networking = {
        firewall = { 
          enable = true;
          allowedTCPPorts = lib.attrValues net.ports;
        };
        useHostResolvConf = lib.mkForce false;
      };
      services.resolved.enable = true;
      services.minecraft-server = serverConf; 
    }; 
    serverConf = {
      enable = true;
      eula = true;
      openFirewall = true;
      servers = {    
        srv.name = serverConf';
      };
    };
    serverConf' = {
      enable = true;
      package = srv.package;
      serverProperties = { server-port = net.ports.minecraft; };
      symlinks = { 
        "forwarding.secret" = pkgs.writeTextFile {
          name = "forwarding.secret";
          text = "ExampleForwardingSecret";
        };
        "mods" = {
        };
      };
      files = {
        "ops.json" = {};
        "config/paper-global.yml" = {};
      };
    };
  };
in {
  mkMinecraftServer = _config: minecraftServer // _config;
}
##{ pkgs, lib }:
##rec {
##  toJSONFile = expr: builtins.toFile "expr" (builtins.toJSON expr);
##  toYAMLFile = expr: pkgs.runCommand "expr.yaml" { } ''
##    ${lib.getExe pkgs.remarshal} -i ${toJSONFile expr} -o $out -if json -of yaml
##  '';
##  toTOMLFile = expr: pkgs.runCommand "expr.toml" { } ''
##    ${lib.getExe pkgs.remarshal} -i ${toJSONFile expr} -o $out -if json -of toml
##  '';
##  toPropsFile = expr: pkgs.writeText "expr.properties" (
##    lib.concatStringsSep "\n" (lib.mapAttrsToList
##      (n: v: "${n}=${if builtins.isBool v then lib.boolToString v else toString v}")
##      expr
##    )
##  );
##  gzipFile = file: pkgs.runCommand "file.gz" { } ''
##    ${lib.getExe pkgs.gzip} ${file} -c > $out
##  '';
##  #aikarFlags = memory: "-Xms${memory} -Xmx${memory} -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1";
##  #proxyFlags = memory: "-Xms${memory} -Xmx${memory} -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15";
##  #mkMCServer = { pname ? "minecraft-server", version ? "1.0", url, sha256 ? pkgs.lib.fakeSha256 }:
##  #  pkgs.stdenv.mkDerivation {
##  #    inherit pname version;
##  #    src = pkgs.fetchurl { inherit url sha256; };
##
##  #    preferLocalBuild = true;
##  #    dontUnpack = true;
##  #    installPhase = ''
##  #      mkdir -p $out/bin $out/lib/minecraft
##  #      cp -v $src $out/lib/minecraft/server.jar
##  #      cat > $out/bin/${pname} << EOF
##  #      #!/bin/sh
##  #      exec ${pkgs.jre_headless}/bin/java \$@ -jar $out/lib/minecraft/server.jar nogui
##  #      EOF
##  #      chmod +x $out/bin/${pname}
##  #    '';
##  #  };
##}

