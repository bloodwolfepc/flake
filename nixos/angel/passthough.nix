{ pkgs, config, ... }: let
  user = "bloodowlfe";
  platform = "amd";
  vfioIds = [ "1002:74ef" "1002:ab28" ];
in {
  boot = {
    kernelModules = [ 
      "kvm-${platform}" 
      "vfio_virqfd"
      "vfio_pci"
      "vfio_iommu_type1"
      "vfio"
    ];
    kernelParams = [
      "${platform}_iommu=on"
      "${platform}_iommu=pt"
      "kvm.ignore_msrs=1"
    ];
    extraModprobeConifg = "options vfio-pci
      ids=${builtins.concatStringsSep "," vfioIds}";
    environment.systemPackages = [
      pkgs.looking-glass-client
      #-cdrom /home/${user}/qemu/Win11_24H2_English_x64.iso \
      (pkgs.writeShellScriptBin "pt-boot-windows" ''
        qemu-system-x86_64 \
        -drive file=/home/bloodwolfe/qemu/win11.qcow2,format=qcow2 \
        -cpu Skylake-Client-v3 \
        -enable-kvm \
        -m 4096 \
        -smp 2 \
        -device intel-hda \
        -device hda-duplex \
        -usb \
        -nic user,ipv6=off,model=rtl8139,mac=84:1b:77:c9:03:a6 \        
        -device vfio-pci,host= 03:00.0,multifunction-on,x-vga=on,id=vfio0 \
        -device vfio-pci,host=03:00.1,id-vfio1 \
        -vga none \
        -display none \
        -nographic \
        -parallel none \
        -serial none \
        -enable-kvm \
      '')
    ];
  };
  virtualisation = {
    libvirtd = {
      enable = true;
        extraConfig = ''
          user="${user}"
        '';
      onBoot = "ignore";
      onShutdown = "shutdown";
      qemu = {
        package = pkgs.qemu_kvm;
        #ovmf = "enabled";
        verbatimConfig = ''
          namespaces = []
          user = "+${builtins.toString config.users.users.${user}.uid}"
        '';
      };
    };
  };
  users.users.${user}.extraGroups = [ "qemu-libvirtd" "libvirtd" "disk" ]; 
}
#shopt -s nullglob
#for d in /sys/kernel/iommu_groups/*/devices/*; do 
#    n=${d#*/iommu_groups/*}; n=${n%%/*}
#    printf 'IOMMU Group %s ' "$n"
#    lspci -nns "${d##*/}"
#done;

#15 03:00.0 1002:73ef
#16 03:00.1 1002:ab28

#qemu-system-x86_64 \
#-cdrom ./Win11_24H2_English_x64.iso \
#-drive file=win11.qcow2,format=qcow2 \
#-cpu Skylake-Client-v3 \
#-enable-kvm \
#-m 4096 \
#-smp 2 \
#-device intel-hda \
#-device hda-duplex \
#-usb \
#-nic user,ipv6=off,model=rtl8139,mac=84:1b:77:c9:03:a6 \
