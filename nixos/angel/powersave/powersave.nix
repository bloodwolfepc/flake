{ lib, pkgs, config, ... }: let
  cfg = config.hardware.asus-zypherus-ga402.powersave;
in {
  config = lib.mkIf cfg.enable {
    #services.tlp = {
    #  enable = true;
    #  settings = {
    #    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    #    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

    #    CPU_ENERGY_PERF_FOLICY_ON_BAT = "power";
    #    CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

    #    CPU_MIN_PERF_ON_AC = 0;
    #    CPU_MAX_PERF_ON_AC = 100;
    #    CPU_MIN_PERF_ON_BAT = 0;
    #    CPU_MAX_PERF_ON_BAT = 20;

    #    #START_CHARGE_THRESH_BAT0 = 40;
    #    #START_CHARGE_THRESH_BAT0 = 80;
    #  };
    #};
    boot.postBootCommands = ''
      asusctl profile -P Quiet
    '';
    powerManagement.powertop.enable = true;
    services.auto-cpufreq = {
      enable = false; #conflicts services.power-profiles-daemon
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
    environment.systemPackages = with pkgs; [
      powertop
    ];
    environment.etc = {
      "supergfxd.conf" = {
        mode = "0664";
        source = (pkgs.formats.json { }).generate "supergfxd.conf" {
          mode = "Integrated";
          vfio_enable = false;
          vfio_save = false;
          always_reboot = false;
          no_logind = false;
          logout_timeout_s = 180;
          hotplug_type = "None";
        };
      };
    };
  };  
}


#(
#    charge_control_end_threshold: 100,
#    panel_od: false,
#    boot_sound: false,
#    mini_led_mode: false,
#    disable_nvidia_powerd_on_battery: true,
#    ac_command: "",
#    bat_command: "",
#    throttle_policy_linked_epp: true,
#    throttle_policy_on_battery: Quiet,
#    change_throttle_policy_on_battery: true,
#    throttle_policy_on_ac: Performance,
#    change_throttle_policy_on_ac: true,
#    throttle_quiet_epp: Power,
#    throttle_balanced_epp: BalancePower,
#    throttle_performance_epp: Performance,


