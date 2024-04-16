{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    #age.keyFile = "/persist/home/bloodwolfe/.config/sops/age/keys.txt";
    #gnupg.home = "~/.gnupg";

    defaultSopsFile = ../../../../../secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      #"private_keys/bloodwolfe" = {
      #  path = "/persist/home/bloodwolfe/.ssh/id_default";
      #};
      git-auth = {};
    };
  };
}
