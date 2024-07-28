{ pkgs, ... }: {
  home.packages = with pkgs; [
    reaper
    ardour
    musescore
    yabridge
    yabridgectl
    carla
    sfizz
    orca-c
    puredata
    plugdata
    #zexy
    #timbreid 
    #maxlib 
    #cyclone 
    #faust
    surge 
    vital 
    cardinal 
    odin2
    geonkick
    x42-avldrums
    freepats
    drumgizmo
    freepats
    mda_lv2
    airwindows-lv2
    lsp-plugins
    zam-plugins
    x42-plugins
    calf
    CHOWTapeModel
    ladspaPlugins
    AMB-plugins
    aether-lv2
    gxplugins-lv2
    guitarix
    #soundux #removed due to being unmaintained
    distrho #includes vitalium and juce
    supercollider
    airwindows-lv2
    tap-plugins
    zynaddsubfx
    helm
    x42-gmsynth
    yoshimi
    sonobus
    coppwr
    
    #UNPACKAGED
    #wolf-spectrum
    #zrythm
  ];
	home.persistence."/data/home/bloodwolfe" = {
		directories = [
      ".local/share/vital" #~/.local/share/vital/User/{Wavetables,Presets}
      ".config/falkTX" 
      ".config/ardour8"
      ".cache/ardour8" #local

      "data/ardour"
      "data/vital"
      "data/sfz"
      "data/carla"
      "data/orca"
    ];
  };
  services.syncthing.settings.folders = {
    "/data/sound/ardour" = {
      path = "/data/home/bloodwolfe/data/ardour";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/vital" = {
      path = "/data/home/bloodwolfe/data/vital";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/sfz" = {
      path = "/data/home/bloodwolfe/data/sfz";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/carla" = {
      path = "/data/home/bloodwolfe/data/carla";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/sound/orca" = {
      path = "/data/home/bloodwolfe/data/orca";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    
    #dotfiles
    "/data/home/bloodwolfe/.config/ardour8" = {
      path = "/data/home/bloodwolfe/.config/ardour8";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
    "/data/home/bloodwolfe/.local/share/vital" = {
      path = "/data/home/bloodwolfe/.local/share/vital";
      devices = [ "navi" "lapis" ];
      ignorePerms = false;
    };
  };
}
