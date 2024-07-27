{ pkgs, ... }:
{
  home.packages = with pkgs; [
  
    #DAW
    reaper
    ardour
    musescore

    #VST BRIDGE/PATCHBAY
    yabridge
    yabridgectl
    carla
    sfizz
    
    #PROGRAMMING LANGUAGES
    orca-c
    
    puredata
    plugdata
    #zexy
    #timbreid 
    #maxlib 
    #cyclone 
    
    #faust
    
#carla background piano processing
    
    #SYNTHS
    surge #maveform
    vital #waveform
    cardinal #modular
    #vcv-rack #modular
    odin2 #analog

    #DRUMS
    geonkick
    x42-avldrums
    freepats
    drumgizmo
    

    #LIBRARIES
    freepats
    mda_lv2

    #EFFECTS FOCUSED
    airwindows-lv2
    lsp-plugins
    zam-plugins
    x42-plugins
    calf
    
    CHOWTapeModel
    ladspaPlugins
    AMB-plugins
    aether-lv2

    
    #EFFECTS GUITAR
    gxplugins-lv2
    guitarix
    
    #TODO add reakeys

    
    #soundboard
    #soundux #removed due to being unmaintained


    distrho #includes vitalium and juce
    
    
    #TBE
    supercollider
    airwindows-lv2
    tap-plugins
    zynaddsubfx
    helm
    x42-gmsynth
    yoshimi

    #sound over network
    sonobus

    #pipewire analyzer
    coppwr
    
    
    
    #UNPACKAGED
    #wolf-spectrum
    #zrythm
  ];
	home.persistence."/persist/home/bloodwolfe" = {
		directories = [
      ".local/share/vital"
      #".config/falkTX" 
      ".config/ardour8"
      ".cache/ardour8"
    ];
  };
}
