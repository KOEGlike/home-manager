
{ config, pkgs,plasma-manager, ... }:
{
  imports = [
    ./plasma.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
  };

  home.username = "koeg";
  home.homeDirectory = "/home/koeg";
  programs.kitty.enable = true;
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

  home.packages = [];
}