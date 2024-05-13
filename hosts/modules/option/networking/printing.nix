{
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns = true;
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

#hello,
#im having a wg.service fail to start
#  wg-up[83035]: iptables v1.8.10 (nf_tables): host/network `ffff:ffff:ffff:ffff::f' not found
#  
#  wg-down[83041]: Cannot find device "veth-wg-br"
#  wg-down[83049]: iptables: No chain/target/match by that name.
#
#with airvpn for wg.conf and networkmanager with resolved for networking
