{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    #age = {
    #  keyFile = "/persist/home/bloodwolfe/.config/sops/age/keys.txt";
    #}; 
    gnupg.home = "~/.gnupg";
    defaultSopsFile = ../../../../../secrets.yaml;
    validateSopsFiles = false; 

    secrets = {
      "git-auth" = {};
    };
  };
}
