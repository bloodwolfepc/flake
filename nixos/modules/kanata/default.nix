{ pkgs, ... }: {
  services.kanata = {
    enable = true;
    package = pkgs.kanata-with-cmd;
    keyboards."60-percent-default" = {
      extraDefCfg = "process-unmapped-keys yes";
      config = ''
        ;;(defsrc
        ;;  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
        ;;  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
        ;;  caps a    s    d    f    g    h    j    k    l    ;    '    ret
        ;;  lsft z    x    c    v    b    n    m    ,    .    /    rsft
        ;;  lctl lmet lalt           spc            ralt rmet rctl
        ;;)
        (defsrc
          j k
        )
        
        (defalias
          chj (chord jkesc j)
          chk (chord jkesc k)
        )

        (defchords jkesc 75
          (j    ) j
          (   k ) k
          (j  k ) esc
        )

        (deflayer base
          @chj @chk
        ) 
      '';
    };
  };
}
