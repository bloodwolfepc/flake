{config, ...}:
{

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
  
	#home.persistence."/persist/home/bloodwolfe" = {
  #  files = [ 
  #    ".config/gh/hosts.yml"
  #  ];
  #};
  sops.secrets."gh-hosts" = {
    path = "/home/bloodwolfe/.config/gh/hosts.yml";
  };
  #sops.secrets."git-auth" = { };
  #home.sessionVariablesExtra = ''
  #  export GH_TOKEN=''$(cat ${config.sops.secrets."git-auth".path})
  #'';
}

