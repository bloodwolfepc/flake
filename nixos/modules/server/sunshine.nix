{ pkgs, lib, config, ... }: let
  hypr-dispatch = lib.getExe' config.programs.hyprland.package "hyprctl" + " dispatch exec";
  sh = lib.getExe pkgs.bash;
  steam = lib.getExe config.programs.steam.package + " --";
  prep = let
    packages = [
      pkgs.findutils
      pkgs.gawk
      pkgs.coreutils
      pkgs.procps
      pkgs.curl
      config.programs.hyprland.package
    ];
    do-command = pkgs.writeShellApplication {
      name = "do-command";
      runtimeInputs = packages;
      text = ''
        HYPRLAND_INSTANCE_SIGNATURE=$(find /run/user/1000/hypr/ -mindepth 1 -printf '%P\n' -prune)
        export HYPRLAND_INSTANCE_SIGNATURE
        width=''${1:-1920}
        height=''${2:-1080}
        refresh_rate=''${3:-60}
        mon_string="DP-1,''${width}x''${height}@''${refresh_rate},0x0,1"
        hyprctl keyword monitor "$mon_string"
        hyprctl dispatch workspace name:firefox
      '';
    };
    undo-command = pkgs.writeShellApplication {
      name = "undo-command";
      runtimeInputs = packages;
      text = ''
        HYPRLAND_INSTANCE_SIGNATURE=$(find /run/user/1000/hypr/ -mindepth 1 -printf '%P\n' -prune)
        export HYPRLAND_INSTANCE_SIGNATURE
        mon_string="DP-1,1920x1080@144,0x0,1"
        hyprctl keyword monitor "$mon_string"
      '';
    };
    in {
      do = "${sh} -c \"${lib.getExe do-command} \${SUNSHINE_CLIENT_WIDTH} \${SUNSHINE_CLIENT_HEIGHT} \${SUNSHINE_CLIENT_FPS}\"";
      undo = "${sh} -c \"${lib.getExe undo-command}\"";
    };
    steam-kill = let
    kill-script = pkgs.writeShellApplication {
      name = "steam-kill";
      runtimeInputs = [pkgs.procps];
      text = ''
        pkill steam
      '';
    };
  in {
    do = "";
    undo = "${sh} -c \"${lib.getExe kill-script}\"";
  };
in {
  environment.systemPackages = [ 
    pkgs.sunshine
    pkgs.moonlight-qt
  ];
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
    settings = {
      channels = 2;
      output_name = 1;
    };
    applications = {
      env = {
        PATH = "$(PATH)";
      };
      apps = [
        {
          name = "pc";
          prep-cmd = [prep];
        }
        {
          name = "steam-big-picture";
          cmd = "${hypr-dispatch} \"${steam} -gamepadui\"";
          prep-cmd = [prep steam-kill];
        }
        {
          name = "steam";
          cmd = "${hypr-dispatch} \"${steam}\"";
          prep-cmd = [prep steam-kill];
        }
        {
          name = "prism-launcher";
          prep-cmd = [prep];
          cmd = "${hypr-dispatch} ${pkgs.prismlauncher}";
        }
        {
          name = "pc-bin";
          prep-cmd = ["${pkgs.hyprland}/bin/Hyprland"];
        }
      ];
    };
  };
  networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 47984 47989 47990 48010 ];
  allowedUDPPortRanges = [
    { from = 47998; to = 48000; }
    { from = 8000; to = 8010; }
  ];};
  #security.wrappers.sunshine = {
  #  owner = "root";
  #  group = "root";
  #  capabilities = "cap_sys_admin+p";
  #  source = "${pkgs.sunshine}/bin/sunshine";
  #};
  services.avahi.enable = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;  
}
