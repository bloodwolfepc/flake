{ inputs, config, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ]; #home.activation.setupEtc = config.lib.dag.entryAfter [ "writeBoundary" ] ''
  #  /run/current-system/sw/bin/systemctl start --user sops-nix
  #'';
  sops = {
    age = {
      #going back to this a home located directory should be used for this module 
      #looking into services.gpg-agent.sshkeys
      sshKeyPaths = [ "/persist/system/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/persist/home/bloodwolfe/.config/sops/age/keys.txt";
      generateKey = true;
    }; 
    #gnupg.home = 
  defaultSopsFile = ../../../../../secrets.yaml;
  validateSopsFiles = false; 
    #secrets = {
    #  "ssh1" = {
    #    path = "/home/bloodwolfe/.ssh/rainbow"; #belongs in ssh
    #  };
    #  "spotify-credential" = {
    #    path = "/home/bloodwolfe/.cache/spotify-player/credentials.json"; 
    #  }; 
    #};
  };
  #defaultSymlinkPath = "/run/user/1000/secrets";
  #defaultSecretsMountPoint = "/run/user/1000/secrets.d";
  #home.sessionVariables = {
    #OPENAI_API_KEY = "$(cat ${config.sops.secrets."openai-auth".path})";
  #};
  #programs.zsh.envExtra = ''
  #  export OPENAI_API_KEY=$(cat ${config.sops.secrets."openai-auth".path})
  #'';
}
