{ lib, config, pkgs, ... }: let 
  inherit lib;
  attrs = lib.custom.mkHomeApplication {
    name = "mangohud";
    inherit config;
    inherit extraConfig;
  }; 
  extraConfig = {
    programs.mangohud = {
      enable = true;
      enableSessionWide = false;
      settings = {
        no_display = true;
        output_folder = "${config.home.homeDirectory}/mangohud-logs";
        toggle_hud = "Control_L+F1";
        toggle_hud_position = "Control_L+F2";
        toggle_logging = "Control_L+F3";
        reload_cfg = "Control_L+F4";

        #the final result is reordered, so it looks messy
        custom_text_center = lib.mkBefore "never knows best";
        exec_name = 1;
        time = 1;
        time_no_label = 1;
        time_format = "%T"; 
        gpu_stats = 1;
        cpu_stats = 1;
        vram = 1;
        ram = 1;
        fps = 1;
        frametime = lib.mkAfter 1;
        frame_timing = 1; #graph
        gpu_name = 1;
        vulkan_driver = 1;
        fsr = 1;
        debug = 1;
        hdr = 1;
        refresh_rate = 1;
        mangoapp_steam = 1;
        resolution = 1;
        network = 1;
      };
    };
  };
in {
  inherit (attrs) options config;
}

