{ pkgs, ... }: {
  imports = [
    ./hyprland.nix
  ];
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
    #lsp-plugins
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
    soundfont-fluid
  ];
	home.persistence."/sync/home/bloodwolfe" = {
		directories = [
      ".local/share/vital" #~/.local/share/vital/User/{Wavetables,Presets}
      ".config/falkTX" 
      ".config/ardour8"
      ".cache/ardour8"

      "ardour"
      "vital"
      "sfz"
      "carla"
      "orca"
    ];
  };
}
