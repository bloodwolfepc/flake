{
  security.polkit.enable = true;
  xdg.portal = {
    enable = true;
    config = {
      common.default = [ "gtk" ];
    };
    #wlr = {
    #  enable = true;
    #  settings = { };
    #};
  };
}
