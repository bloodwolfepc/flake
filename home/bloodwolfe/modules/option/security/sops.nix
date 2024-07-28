{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];  
  sops = {
    age = {
      keyFile = "/persist/home/bloodwolfe/.config/sops/age/key.txt";
    }; 
  defaultSopsFile = ../../../../../secrets/secrets.yaml;
  validateSopsFiles = false; 
    secrets = {
      #"ssh-lapis" = {
      #  path = "/home/bloodwolfe/.ssh/id_ed25519";
      #};
      "ssh-angel" = {
        path = "/home/bloodwolfe/.ssh/id_ed25519";
      };
      "google-api" = {
        path = "/home/bloodwolfe/.local/share/google-api/key";
      };
    };
  };
}
