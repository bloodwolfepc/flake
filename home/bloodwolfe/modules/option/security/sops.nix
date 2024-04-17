{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age = {
      #sshKeyPaths = [ "/persist/system/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/persist/system/var/lib/sops-nix/key.txt";
      #generateKey = true;

      #sshKeyPaths = [ "/persist/system/etc/ssh/ssh_host_ed25519_key" ];
      #keyFile = "/persist/home/bloodwolfe/.config/sops/age/keys.txt";
      #generateKey = true;
    };

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
