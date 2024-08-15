{ pkgs, ... }: {
  home.packages = with pkgs; [
    shell-gpt
  ];
  sops.secrets."sgpt-config" = {
    path = "/home/bloodwolfe/.config/shell_gpt/.sgptrc";
  };
}
