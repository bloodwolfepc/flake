# opts . poversave govornor, igpu, power-saver profile, 60Hz, on battery. goal is 5W idle
# screen brightness, core/thread restriction, undervolt

{ lib, pkgs, config, ... }: {

  #homeConfigurations = { "bloodwolfe@angel" = lib.homeManagerConfiguration {
  #  home-manager.users.bloodwolfe.home.wayland.winodowManager.hyprland.settings = {
  #    input.touchpad = { 
  #      natural_scroll = false;
  #      disable_while_typing = false;
  #    };
  #  };
  #};
  #};
  
# powersave = powerprofilesctl set power-saver / performance 
# 
# asusctl set to quiet will also set power-saver
  powerManagement = {
    enable = true;
    cpuFreqGovernor = lib.mkForce "powersave"; #musnix sets as performance
    powertop.enable = true;
  };
  environment.systemPackages = with pkgs; [
    powertop
  ];
  services.asusd = {
    enable = true;
    enableUserService = true;
    #profileConfig = "power-saver";
    asusdConfig = ''
      (
          charge_control_end_threshold: 100,
          panel_od: false,
          boot_sound: false,
          mini_led_mode: false,
          disable_nvidia_powerd_on_battery: true,
          ac_command: "",
          bat_command: "",
          throttle_policy_linked_epp: true,
          throttle_policy_on_battery: Quiet,
          change_throttle_policy_on_battery: true,
          throttle_policy_on_ac: Performance,
          change_throttle_policy_on_ac: true,
          throttle_quiet_epp: Power,
          throttle_balanced_epp: BalancePower,
          throttle_performance_epp: Performance,
      )
    '';
  };
  services.supergfxd = {
    enable = true;
    settings = {
      mode = "Hybrid";
      #always_reboot = false;
      #no_logind = true;
      #mode = "Integrated";
      ## mode = "Hybrid";
      #vfio_enable = false;
      #vfio_save = false;
      #logout_timeout_s = 180;
      #hotplug_type = "None";
    };
  };
  services.power-profiles-daemon.enable = true;
  services.supergfxd.enable = true;
  services.asusd.enable = true;
}
