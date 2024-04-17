{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  
  sops = {
    defaultSopsFile = ../../../../secrets.yaml;
    validateSopsFiles = false;
    age = {
      sshKeyPaths = [ "/persist/system/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/persist/system/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets = {
      bloodwolfe-pass = {};
    };
  };

}
