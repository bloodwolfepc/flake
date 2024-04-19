{ inputs, config,... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  
#  services.openssh.hostKeys = [
#    {
#      bits = 4096;
#      path = "/persist/system/etc/ssh/ssh_host_rsa_key";
#      type = "rsa";
#    }
#    {
#      path = "/persist/system/etc/ssh/ssh_host_ed25519_key";
#      type = "ed25519";
#    }
#  ];
  sops = {
    defaultSopsFile = ../../../../secrets.yaml;
 #   validateSopsFiles = false;
    defaultSopsFormat = "yaml";
    gnupg.sshKeyPaths = [];
    age = {
     sshKeyPaths = [ "/persist/system/etc/ssh/ssh_host_ed25519_key" ];
     keyFile = "/persist/system/var/lib/sops-nix/key.txt";
     generateKey = true;
    };
    secrets = {
      "bloodwolfe-pass" = { 
        owner = config.users.users.bloodwolfe.name;
        group = config.users.users.bloodwolfe.group;
      };
      "spotify-cookie" = { 
        owner = config.users.users.bloodwolfe.name;
        group = config.users.users.bloodwolfe.group;
      };
      "git-auth" = {
        owner = config.users.users.bloodwolfe.name;
        group = config.users.users.bloodwolfe.group;
        format = "yaml";
        mode = "7777";
      };
      "test-2" = {
        owner = config.users.users.bloodwolfe.name;
        group = config.users.users.bloodwolfe.group;
      };
      "openai-auth" = {
        owner = config.users.users.bloodwolfe.name;
        group = config.users.users.bloodwolfe.group;
      };
      "test-pass" = {
        owner = "testservice";
      };
    };
  };
  environment.sessionVariables = {
    OPENAI_API_KEY = "$(cat ${config.sops.secrets."openai-auth".path})";
  };
  systemd.services."testservice" = {
    script = ''
      echo "
      $(cat ${config.sops.secrets."test-pass".path}) is of
      ${config.sops.secrets."test-pass".path}
      " > /var/lib/testservice/testfile
      echo "
      service can work 
      $(cat ${config.sops.secrets."test-pass".path})
      " > /var/lib/testservice/testfile2.txt

    '';
    serviceConfig = {
      User = "testservice";
      WorkingDirectory = "/var/lib/testservice";
    };
  };
  users.users.testservice = {
    home = "/var/lib/testservice";
    createHome = true;
    isSystemUser = true;
    group = "testservice";
  };
  users.groups.testservice = { };
}
