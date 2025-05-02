{
  config,
  pkgs,
  plasma-manager,
  ...
}:
{
  imports = [
    ./plasma.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      if command -v tmux &> /dev/null && [ -z "$TMUX"]; then 
        tmux attach-session -t main || tmux new-session -s main
      fi
    '';
  };

  home.username = "koeg";
  home.homeDirectory = "/home/koeg";
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

  home.packages = [ ];
}
