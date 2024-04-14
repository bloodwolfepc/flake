{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerMoudules.sops
  ];

  sops = {
    age.keyFile = "/home/bloodwolfe/.config/sops/age/keys.txt";

    defaultSopsFile = ../../../../secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private_keys/bloodwolfe" = {
        path = "home/bloodwolfe/.ssh/id_default";
      };
    };
  };
}
