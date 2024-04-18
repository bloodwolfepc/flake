{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  
#  services.openssh.hostKeys = [
#    {
#      bits = 4096;
#      path = "/persist/system/etc/ssh/ssh_host_rsa_key";
#      type = "rsa";
#    }
#    {
#      path = "/persist/system/etc/ssh/ssh_host_ed25519_key";
#      type = "ed25519";
#    }
#  ];
  sops = {
    defaultSopsFile = ../../../../secrets.yaml;
    validateSopsFiles = false;
    age = {
     sshKeyPaths = [ "/persist/system/etc/ssh/ssh_host_ed25519_key" ];
     #keyFile = "/persist/system/var/lib/sops-nix/key.txt";
     keyFile = "/persist/home/bloodwolfe/.config/sops/age/keys.txt";
     generateKey = true;
    };
    secrets = {
      bloodwolfe-pass = { };
    };
  };

}
