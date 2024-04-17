{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age = {
      keyFile = "/persist/system/var/lib/sops-nix/key.txt";
    }; 
#    gnupg.home = "~/.gnupg";
    defaultSopsFile = ../../../../../secrets.yaml;
    validateSopsFiles = false; 

    secrets = {
      "git-auth" = {};
    };
  };
}
