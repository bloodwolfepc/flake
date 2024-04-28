{ pkgs, ... }: {
  imports = [ ./low-latency-audio.nix ];
  services.pipewire.wireplumber.configPackages = [
    (pkgs.writeTextDir "share/wireplumber/main.lua.d/99-alsa-lowlatency.lua" ''
      alsa_monitor.rules = {
        {
          matches = {{{ "node.name", "matches", "alsa_output.*" }}};
          apply_properties = {
            ["audio.format"] = "S32LE",
            ["audio.rate"] = "96000", -- for USB soundcards it should be twice your desired rate
            ["api.alsa.period-size"] = 2, -- defaults to 1024, tweak by trial-and-error
            -- ["api.alsa.disable-batch"] = true, -- generally, USB soundcards use the batch mode
          },
        },
      }
    '')
  ];
  boot.extraModprobeConfig = ''
    options snd slots=snd-usb-audio
  '';
#  services.pipewire.wireplumber.extraLuaConfig.main."99-alsa-lowlatency" = ''
#    alsa_monitor.rules = {
#      {
#        matches = {{{ "node.name", "matches", "alsa_output.*" }}};
#        apply_properties = {
#          ["audio.format"] = "S32LE",
#          ["audio.rate"] = "96000", -- for USB soundcards it should be twice your desired rate
#          ["api.alsa.period-size"] = 2, -- defaults to 1024, tweak by trial-and-error
#          -- ["api.alsa.disable-batch"] = true, -- generally, USB soundcards use the batch mode
#        },
#      },
#    }
#  '';
}
