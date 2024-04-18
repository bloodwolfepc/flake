{config, ...}:
{
  sops.secrets."git-auth" = { };

  programs.git = {
    enable = true;
    userName = "bloodwolfepc";
    userEmail = "bloodwolfepc@gmail.com";
  };
  programs.gh.enable = true;
#  programs.gh = {
#    enable = true;
#    gitCredentialHelper = {
#      enable = true;
#      hosts = [ "https://github.com" ];
#    };
#    settings = {
#      git_protocol = "https";
#      prompt = "enabled";
#      user = "bloodwolfepc";
#      oauth_token = "cat ${config.sops.secrets."git-auth".path}";
#    };
#  };
}

