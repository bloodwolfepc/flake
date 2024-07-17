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


    #TBE
    supercollider
    airwindows-lv2
    tap-plugins
    zynaddsubfx
    helm

    #sound over network
    sonobus

    #pipewire analyzer
    coppwr
    
    
    
    #zrythm
  ];
}
