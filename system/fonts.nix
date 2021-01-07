{ pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;

    fonts = with pkgs; [
      ucs-fonts
      inriafonts
      opensans-ttf
      source-serif-pro
      source-sans-pro
      source-code-pro
      liberation_ttf
      iosevka
      dejavu_fonts
      corefonts
      powerline-fonts
      google-fonts
      inconsolata
      nerdfonts
      ubuntu_font_family
      font-awesome_5
      fantasque-sans-mono
      fira-code
      fira-code-symbols
      siji
      freetype
      material-icons
      emacs-all-the-icons-fonts
      nixos-icons
    ];
  };
}
