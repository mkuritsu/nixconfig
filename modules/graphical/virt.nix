{pkgs, ...}: {
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
  programs.virt-manager.enable = true;

  environment.systemPackages = [ pkgs.dnsmasq];
}