{
  description = "Home Manager configuration of koeg";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    nvim-config = {
      # Use the actual path to your nvim-config project
      url = "github:KOEGLike/nvim-config";
      # Since it's a local path and likely shares inputs, prevent refetching
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixCats.follows = "nixCats"; # Make sure nixCats is also an input here or below
    };
    # Ensure nixCats is an input if your nvim-config depends on it
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      plasma-manager,
      nvim-config,
      nixCats,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true; # Allow unfree packages
      };
    in
    {
      homeConfigurations."koeg" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          nvim-config.homeModules.default
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit pkgs;
          inherit plasma-manager;
          inherit home-manager;
          inherit system;
          inherit nixpkgs;
          inherit nixCats;
        };
      };
    };
}
