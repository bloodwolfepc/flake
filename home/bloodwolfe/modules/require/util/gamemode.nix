{
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        softrealtime = "on";
        inhibit_screensave = 1;
      };
      gpu = {
        apply_gpu_optimisations = "accept-resposibility";
        gpu_device = 0;
        amd_performance_level = "high";
      };
    };
  };
}
