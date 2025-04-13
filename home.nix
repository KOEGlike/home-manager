
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

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      ms-azuretools.vscode-docker
      jnoortheen.nix-ide
    ];
  };
}