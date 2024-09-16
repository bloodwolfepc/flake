{ inputs, ... }: {
  imports = [ inputs.musnix.nixosModules.default ];
  musnix = {
    enable = true;
    alsaSeq.enable = true;
    rtcqs.enable = true;
  };
}

