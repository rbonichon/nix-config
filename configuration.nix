{ pkgs, ... }:
let

  packages = pkgs.callPackage ./packages { };

in
{
  imports = [
    # ./nix
    # ./nix/home-manager.nix

    # ./system
    # ./system/gpu.nix
    # ./system/desktop.nix
    ./system/fonts.nix
    ./system/services.nix
    #    ./system/keyboard.nix
    # ./system/power.nix
    # ./system/virtualisation.nix
    # ./system/ledgerlive.nix
  ];

  environment = {
    systemPackages = packages;
    pathsToLink = [ "/libexec" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    oraclejdk.accept_license = true;

    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3GapsSupport = true;
        mpdSupport = true;
        pulseSupport = true;
      };
    };
  };

  users = {
    # See https://valh.io/blog/Ledger-NixOS.html
    groups.plugdev = { };

    users.richard = {
      isNormalUser = true;
      home = "/home/richard";
      description = "Richard B.";
      extraGroups = [
        "wheel"
        "networkmanager"
        "docker"
        "storage"
        "audio"
        "video"
        "pulse"
        "vboxusers"
        "vboxsf"
        "plugdev"
      ];
      shell = pkgs.fish;
    };
  };


  programs = {

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    gnupg.agent = { enable = true; enableSSHSupport = true; };

    # zsh = {
    #   ohMyZsh = {
    #     enable = true;
    #     plugins = [ "git" "python" "man" "fasd" ];
    #     theme = "pygmalion";
    #   };
    #   enable = true;
    # };
    fish.enable = true;

    light.enable = true;

    tmux = {
      enable = true;
      clock24 = true;
      extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
         # More friendly split pane
         bind-key h split-window -h
         bind-key v split-window -v
    '';
    };

    java.enable = true;
  };
}
