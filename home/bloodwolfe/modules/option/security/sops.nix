{ inputs, config, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];
  home.activation.setupEtc = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    /run/current-system/sw/bin/systemctl start --user sops-nix
  '';
  sops = {
    age = {
      sshKeyPaths = [ "/persist/system/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/persist/home/bloodwolfe/.config/sops/age/keys.txt";
      generateKey = true;
    }; 
  defaultSopsFile = ../../../../../secrets.yaml;
  validateSopsFiles = false; 

    secrets = {
      git-auth = { };
    };
  };
}
