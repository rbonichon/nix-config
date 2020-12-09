/*
This is a nix expression to build Emacs and some Emacs packages I like
from source on any distribution where Nix is installed. This will install
all the dependencies from the nixpkgs repository and build the binary files
without interfering with the host distribution.

To build the project, type the following from the current directory:

$ nix-build emacs.nix

To run the newly compiled executable:

$ ./result/bin/emacs
*/

{ pkgs ? import <nixpkgs> { } }:
let
  myEmacs = pkgs.emacs26.override {
    inherit (pkgs) imagemagick;
  };
  emacsWithPackages = (pkgs.emacsPackagesGen myEmacs).emacsWithPackages;
in
emacsWithPackages (
  epkgs: (
    with epkgs.melpaPackages; [
      ac-c-headers
      vterm
      magit
      yaml-mode
      bbdb
      notmuch
      gitlab
      helm-gitlab
      no-littering
      google-this
      git-timemachine
      smartparens
      auto-yasnippet
      ebib
      merlin
      merlin-eldoc
      all-the-icons
      all-the-icons-dired
      ace-window
      ace-jump-mode
      plantuml-mode
      mingus
      esup
      bind-key
      tablist
      use-package-chords
      multi-term
      zeal-at-point
      company
      company-auctex
      company-bibtex
      company-ghci
      company-go
      company-lsp
      company-statistics
      company-shell
      company-web
      company-nixos-options
      #    company-org-roam
      dap-mode
      deft
      hydra
      auto-compile
      deadgrep
      diminish
      dired-narrow
      dired-subtree
      dired-quick-sort
      dired-rainbow
      docker
      dockerfile-mode
      docker-tramp
      reaper
      emmet-mode
      elfeed
      elfeed-org
      flycheck
      google-c-style
      haskell-mode
      magit
      forge
      projectile
      which-key
      wttrin
      ag
      rg
      go-mode
      nov
      helm
      helm-rg
      helm-ag
      helm-bbdb
      helm-dash
      helm-descbinds
      helm-swoop
      helm-flyspell
      helm-company
      helm-nixos-options
      helm-notmuch
      helm-pass
      helm-projectile
      helm-spotify-plus
      helm-org-rifle
      nix-buffer
      nix-mode
      nix-sandbox
      nixos-options
      pandoc
      pandoc-mode
      pdf-tools
      tuareg
      yasnippet
      yasnippet-snippets
      web-mode
      zoom
      unicode-fonts
      calfw
      calfw-org
      calfw-gcal
      ivy
      smex
      ivy-hydra
      counsel
      counsel-projectile
      swiper
      ivy-pass
      lsp-mode
      lsp-ui
      lsp-haskell
      lsp-java
      helm-lsp
      eshell-git-prompt
      esh-autosuggest
      eshell-bookmark
      fish-completion
      mode-icons
      multi
      anzu
      beginend
      vlf
      copy-as-format
      cider
      shackle
      poporg
      graphviz-dot-mode
      powerthesaurus
      rmsbolt
      try
      direnv
      gnuplot-mode
      major-mode-hydra
      helpful
      toml-mode
      rust-mode
      cargo
      stripe-buffer
      dired-rainbow
      rainbow-delimiters
      interleave
      orgit
      #    org-roam
      org-journal
      org-ref
      org-bullets
      org-rich-yank
      org-noter
      org-super-agenda
      org-re-reveal
      ob-diagrams
      ob-rust
      ob-mermaid
      ob-go
      ob-prolog
      ob-restclient
      ob-async
      ox-reveal
      ox-pandoc
      ox-ioslide
    ]
  ) ++ (
    with epkgs.elpaPackages; [
      auctex # ; LaTeX mode
      undo-tree
      rainbow-mode
    ]
  ) ++ (
    with epkgs.orgPackages; [
      org
      org-plus-contrib
    ]
  ) ++ [
    pkgs.notmuch # From main packages set
  ]
)
