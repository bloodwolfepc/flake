{config, ...}:
{
  sops.secrets = {
    "git-auth" = {
      #owner = config.users.users.bloodwolfe.name;
      #inherit (config.users.users.bloodwolfe) group;
    };
  };

  programs.git = {
    enable = true;
    userName = "bloodwolfe";
    userEmail = "bloodwolfepc@gmail.com";
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
      hosts = [ "https://github.com" ];
    };
    settings = {
      git_protocol = "https";
      prompt = "enabled";
      user = "bloodwolfepc";
      oauth_token = "cat ${config.sops.secrets."git-auth".path}";
    };
  };
}

