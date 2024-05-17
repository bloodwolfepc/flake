{ inputs, config,... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ../../../../secrets.yaml;
    validateSopsFiles = false;
    defaultSopsFormat = "yaml";
    #gnupg.sshKeyPaths = [];
    age = {
     sshKeyPaths = [ "/persist/system/etc/ssh/ssh_host_ed25519_key" ];
     keyFile = "/persist/system/var/lib/sops-nix/key.txt"; #TODO I think it is safe not to persist this if the key available on boot
     generateKey = true; 
    };
    secrets = {
      "openai-auth" = {
        owner = config.users.users.bloodwolfe.name;
        group = config.users.users.bloodwolfe.group;
      };  
      "ssh1" = {
        path = "/home/bloodwolfe/.ssh/rainbow";
        owner = config.users.users.bloodwolfe.name;
        group = config.users.users.bloodwolfe.group;
      };
      "google-api" = {
        path = "/home/bloodwolfe/.local/share/google-api/key";
        owner = config.users.users.bloodwolfe.name;
        group = config.users.users.bloodwolfe.group;
      };
     # "spotify-credential" = {
     #   path = "/home/bloodwolfe/.cache/spotify-player/credentials.json"; 
     #   owner = config.users.users.bloodwolfe.name;
     #   group = config.users.users.bloodwolfe.group;
     #   mode = "7777";
     # }; 
    };
  };
#  environment.sessionVariables = {
#    OPENAI_API_KEY = "$(cat ${config.sops.secrets."openai-auth".path})";
#  };
#  systemd.services."testservice" = {
#    script = ''
#      echo "
#      $(cat ${config.sops.secrets."test-pass".path}) is of
#      ${config.sops.secrets."test-pass".path}
#      " > /var/lib/testservice/testfile
#      echo "
#      service can work 
#      $(cat ${config.sops.secrets."test-pass".path})
#      " > /var/lib/testservice/testfile2.txt
#
#    '';
#    serviceConfig = {
#      User = "testservice";
#      WorkingDirectory = "/var/lib/testservice";
#    };
#  };
#  users.users.testservice = {
#    home = "/var/lib/testservice";
#    createHome = true;
#    isSystemUser = true;
#    group = "testservice";
#  };
#  users.groups.testservice = { };
}
