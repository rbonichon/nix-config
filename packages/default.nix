{ pkgs, config, ... }:
let
  # sources = import ../nix/sources.nix;

  # nixpkgs-unstable = import sources.nixpkgs-unstable { config.allowUnfree = true; };
  # nixos-unstable = import sources.nixos-unstable { config.allowUnfree = true; };

  # #torguard = pkgs.callPackage ./torguard {};
  # ledger-live-desktop = pkgs.callPackage ./ledger-live-desktop { };
  # nix-sysdig = pkgs.callPackage ./nix-sysdig { };

  # TODO: Move whatever we can to home manager modules
  packages = with pkgs;
    let
      dvcs = [ git git-lfs subversion ];
      browsers = [ firefox google-chrome-dev mesa_drivers ];
      compilers = [ clang gcc_multi go ocaml ];
      cstuff = [ flex bison ];
      imgstuff = [ gimp inkscape ];
      office = [ libreoffice ];
      my-python-packages = python-packages:
        with python-packages; [
          pandas
          requests
          matplotlib
          pygments
          jedi
          flake8
        ];
      python-with-my-packages = python3.withPackages my-python-packages;
      myemacs = import ./emacs.nix { inherit pkgs; };
      email = import./email.nix { inherit pkgs; };
      # all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") { };
      # my-haskell-packages = with haskellPackages; [ ghc hoogle ];
      # haskell_stuff = [ cabal-install (all-hies.selection { selector = p: p; }) ] ++ my-haskell-packages;
      # rust_stuff = [ cargo rustc ];
    in
    email ++
    compilers ++ # smt_provers ++
    dvcs ++ cstuff ++ browsers ++ imgstuff ++ [
      acpitool
      acpi
      acpid
      ag
      anki
      arandr
      autorandr
      aspell
      aspellDicts.fr
      aspellDicts.de
      aspellDicts.en
      aspellDicts.en-computers
      aspellDicts.en-science
      autoconf
      automake
      gnumake
      biber
      binutils-unwrapped
      blueman
      bluezFull
      bluedevil
      brightnessctl
      bubblewrap
      bundler
      cachix
      calibre
      cmake
      cloc
      compton
      coreutils
      cowsay
      cpufrequtils
      curl
      direnv
      dmenu
      dmidecode
      docker
      docker-compose
      drive
      dunst
      myemacs # see ./emacs.nix
      fasd # autojump-like features
      ffmpeg
      file
      findutils
      firefox-devedition-bin
      firmwareLinuxNonfree
      flac
      fuse_exfat
      fzf
      gsasl
      gdb
      gmp
      gnupg1
      gnutls
      gparted
      graphviz
      hidapi
      htop
      hunspell
      gocode
      imagemagick
      ispell
      # others
      jmtpfs
      geoclue2
      killall
      ledger-live-desktop
      ledger-udev-rules
      lftp
      lxterminal
      btar
      libarchive
      libgcc
      libtool
      libnotify
      light
      llvm
      lm_sensors
      lxappearance
      m4 # opam needs this (& autoconf ;-)
      manpages
      mercurial
      mg
      mpv
      mupdf
      nasm
      neofetch
      nixpkgs-fmt
      networkmanager_dmenu
      networkmanagerapplet
      niv
      ntp
      opam
      openssl
      powerline-go
      p7zip
      pa_applet
      pass
      pandoc
      pango
      pavucontrol
      pciutils
      perl
      pinentry
      pinentry_gnome
      pinentry_emacs
      pkg-config
      plantuml
      python-with-my-packages
      polybar
      powerstat
      powertop
      protobuf
      psmisc
      ripgrep
      rlwrap
      rmlint
      rofi
      rofi-pass
      rsync
      rtags
      ruby
      (pkgs.slack.override { nss = nss_3_44; })
      spotify
      sqlite
      scrot
      s-tui
      st
      stack
      stow
      # simple image viewer
      sxiv
      systool
      texlive.combined.scheme-full
      tigervnc
      tmate
      trayer
      transmission-gtk
      tree
      uncrustify
      unzip
      usbutils
      vim
      vlc
      w3m
      wget
      xchm
      xfontsel
      xorg.xmodmap
      xorg.xev
      xorg.xbacklight
      youtube-dl
      yubikey-personalization-gui
      zathura
      zlib
      mumble
      zoom-us
      linuxPackages.cpupower
      linuxPackages.virtualboxGuestAdditions
      starship
      noto-fonts-emoji
    ];
in
packages
