{
  # Big thanks to con-f-use
  description = "Eve's Configuration Flake.";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  # Home Manager url.
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { home-manager, ... }@inputs: {
    # Include as modules in nixos configurations
    nixosModules = import ./modules/nixos;

    # Include as modules in home-manager configurations
    homeManagerModules = import ./modules/home;

    # Use with: nixos-rebuild switch --flake "./#hostname"
    nixosConfigurations = import ./hosts inputs;

    # Run with: `nix fmt`
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
  };
}
