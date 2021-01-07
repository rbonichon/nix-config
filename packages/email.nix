# Packages that to read / send mail
{ pkgs ? import <nixpkgs> { } }:


with pkgs; [
  # a 3rd-party bridge implementation for protonmail
  hydroxyde
  # a client-agnostic mail indexer
  notmuch
  # a (modern) mail fetcher working 
  isync
]
