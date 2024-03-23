{
  description = "Eve's Configuration Flake. ";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = { };
        overlays = [ inputs.self.overlays.default ];
      };
    in
    {
      packages.${system} = import ./packages pkgs;

      overlays = import ./packages/overlays.nix inputs;

      # include as modules in nixos configurations
      nixosModules = import ./modules;

      # use with: nixos-rebuild boot --flake "./#wynux"
      nixosConfigurations = import ./hosts inputs;

      # run with: `nix fmt`
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
