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
      openai-auth = {
      };
    };
  defaultSymlinkPath = "/run/user/1000/secrets";
  defaultSecretsMountPoint = "/run/user/1000/secrets.d";
  };
  home.sessionVariables = {
    OPENAI_API_KEY = "$(cat ${config.sops.secrets."openai-auth".path})";
  };
  programs.zsh.envExtra = ''
    export OPENAI_API_KEY=$(cat ${config.sops.secrets."openai-auth".path})
  '';
}
