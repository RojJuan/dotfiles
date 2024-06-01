{
  description = "My NixOS configuration with Stylix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; 
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, stylix, ... } @ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}

