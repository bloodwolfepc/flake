{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
    };
    hostKeys = [
      {
        bits = 4096;
        path = "/persist/system/etc/ssh/ssh_host_rsa_key";
        type = "rsa";
      }
      {
        path = "/persist/system/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      } 
    ];
  };
}
