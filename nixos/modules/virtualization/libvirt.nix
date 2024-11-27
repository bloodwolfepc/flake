{ pkgs, ... }: {
  virtualisation = {
    #tpm.enable = true;
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
      };
    };
  };
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [ qemu ];
}
