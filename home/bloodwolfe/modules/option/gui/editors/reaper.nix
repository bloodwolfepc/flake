{ pkgs, ... }:
{
  home.packages = with pkgs; [
  
    #DAW
    reaper
    ardour

    #VST BRIDGE/PATCHBAY
    yabridge
    yabridgectl
    carla
    
    #PROGRAMMING LANGUAGES
    puredata
    orca-c
    #faust
    
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
    #EFFECTS GUITAR
    gxplugins-lv2
    guitarix
    
    #TODO add reakeys
  ];
}
