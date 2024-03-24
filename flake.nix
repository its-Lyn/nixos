{
  # Big thanks to con-f-use
  description = "Eve's Configuration Flake.";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

  # Home Manager url.
  inputs.home-manager.url = "github:nix-community/home-manager/release-23.11";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { home-manager, ... }@inputs: {
    # Include as modules in nixos configurations
    nixosModules = import ./modules/nixos;

    homeManagerModules = import ./modules/home;

    # Use with: nixos-rebuild switch --flake "./#hostname"
    nixosConfigurations = import ./hosts inputs;

    # Run with: `nix fmt`
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
  };
}
