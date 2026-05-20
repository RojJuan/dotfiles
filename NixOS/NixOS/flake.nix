{
  description = "My NixOS configuration with Stylix and Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  # Specify the branch as needed
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, stylix, home-manager, ... } @ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}

