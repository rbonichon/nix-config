{ pkgs, ... }:

with pkgs;
let
  my-python-packages = python-packages:
    with python-packages; [
      pandas
      requests
      matplotlib
      pygments
      # jedi and flake8 are used by elpy under Emacs
      jedi
      flake8
    ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
[ python-with-my-packages ]
