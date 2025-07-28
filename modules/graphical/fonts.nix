{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    dejavu_fonts
    cantarell-fonts
    adwaita-fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-mono
  ];
}
