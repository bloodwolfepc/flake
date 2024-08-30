{ pkgs, ... }: {
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    context.properties = {
      default.clock.rate = 48000;
      default.clock.quantum = 32;
      default.clock.min-quantum = 32;
      default.clock.max-quantum = 32;
    };
  };
  services.pipewire.extraConfig.pipewire."91-null-sinks" = {
    "context.objects" = [
      {
        # A default dummy driver. This handles nodes marked with the "node.always-driver"
        # properyty when no other driver is currently active. JACK clients need this.
        factory = "spa-node-factory";
        args = {
          "factory.name"     = "support.node.driver";
          "node.name"        = "Dummy-Driver";
          "priority.driver"  = 8000;
        };
      }
      {
        factory = "adapter";
        args = {
          "factory.name"     = "support.null-audio-sink";
          "node.name"        = "Microphone-Proxy";
          "node.description" = "Microphone";
          "media.class"      = "Audio/Source/Virtual";
          "audio.position"   = "MONO";
        };
      }
      {
        factory = "adapter";
        args = {
          "factory.name"     = "support.null-audio-sink";
          "node.name"        = "Main-Output-Proxy";
          "node.description" = "Main Output";
          "media.class"      = "Audio/Sink";
          "audio.position"   = "FL,FR";
        };
      }
    ];  
  };
  services.pipewire.extraConfig.jack = {
    "20-low-latency" = {
      "jack.properties" = {
        "rt.prio" = 95;
        "node.latency" = "256/48000";
        "jack.show-monitor" = "true";
        "node.lock-quantum" = "true";
        "node.force.quantum" = 256;
      };
    };
  };
  services.pipewire.extraConfig.pipewire-pulse."92-low-latency" = {
    context.modules = [
      {
        name = "libpipewire-module-protocol-pulse";
        args = {
          pulse.min.req = "32/48000";
          pulse.default.req = "32/48000";
          pulse.max.req = "32/48000";
          pulse.min.quantum = "32/48000";
          pulse.max.quantum = "32/48000";
        };
      }
    ];
    stream.properties = {
      node.latency = "32/48000";
      resample.quality = 1;
    };
  };
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
}
