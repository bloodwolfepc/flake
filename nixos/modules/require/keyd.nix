{
  #services.keyd = {
  #  enable = true;
  #  keyboards.default = {
  #    ids = [ "*" "258a:0036" ];
  #    settings = {
  #      main = {
  #        #shift = "oneshot(shift)"; #I could do this if I detected gamemode maybe
  #        #meta = "oneshot(meta)";
  #        #control = "oneshot(control)";
  #        leftalt = "oneshot(alt)";
  #        rightalt = "oneshot(altgr)";
  #        capslock = "overload(control, esc)"; #TODO map esc here to be the number layer

  #        #press CL once and it will remember it for the next key, hold it and it will continue
  #        #capslock = "overload(nubmer, numbjjer )"; 

  #      #"nubmer" = {
  #      #  a = "1";
  #      #  s = "2";
  #      #  d = "3";
  #      #  f = "4";
  #      #  g = "5";
  #      #  h = "6";
  #      #  j = "7";
  #      #  k = "8";
  #      #  l = "9";
  #      #  ";" = "0";
  #      };
  #    };
  #  };
  #};
}
