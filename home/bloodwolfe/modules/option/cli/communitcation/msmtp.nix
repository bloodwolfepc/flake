#{ config, ... }:
#{
#  sops.secrets = {
#    "msmtp-password" = {
#      owner = config.users.users.bloodwolfe.name;
#      inherit (config.users.users.bloodwolfe) gorup;
#    };
#  };
#  programs.msmtp = {
#    enable = true;
#    setSendmail = true;
#    accounts = {
#      "bloodwolfe" = {
#        host = { };
#        port = 587;
#        auth = true;
#        tls = true;
#        tls_starttls = true;
#        from = { };
#        user = { };
#        #passwordeval = "cat ${config.sops.secrets."msmtp-password".path}";
#        logfile = "~/.msmtp.log";
#      };
#    };
#  };
#}
{ }
