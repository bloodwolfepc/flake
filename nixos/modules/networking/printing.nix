{
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  #ensureDefaultPrinter = "cannon";
  #hardware.printers = {
  #  ensurePrinters = [
  #    {
  #      name = "cannon";
  #      location = "Home";
  #      deviceUri = "https://<IP>:<PORT>/printers/cannon";
  #      model = "";
  #        ppdOptions = {
  #          pageSize = "A4";
  #        };
  #      };
  #    }
  #  ];
}
