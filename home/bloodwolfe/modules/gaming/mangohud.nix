{ lib, ... }: {
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    settings = { #the final result is alphabetized
      #fps_limit = "0";
      #fps_limit_method = "";
      toggle_hud = "Control_L+F12";
      custom_text_center = lib.mkOrder 1 "never knows best";
      legacy_layout = 0;
      time = 1;
      time_no_label = 1;
      time_format = "%T"; 
      gpu_stats = 1;
      cpu_stats = 1;
      vram = 1;
      ram = 1;
      fps = 1;
      frametime = 1;
      frame_timing = 1; #graph
      gpu_name = 1;
      vulkan_driver = 1;
      wine = 1;
      exec_name = 1;
      gamemode = 1;
      fsr = 1;
      debug = 1;
      hdr = 1;
      refresh_rate = 1;
      mangoapp_steam = 1;
      resolution = 1;
      network = 1;
    };
  };
}
