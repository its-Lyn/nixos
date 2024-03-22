{
  description = "lyn's flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs: {
    # include as modules in nixos configurations
    nixosModules = import ./modules;

    # use with: nixos-rebuild boot --flake "./#wynux"
    nixosConfigurations = import ./configurations inputs;

    # run with: `nix fmt`
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
  };
}
