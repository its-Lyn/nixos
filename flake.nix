{
	description = "Eve's System Configuration";

	inputs = {
		nixpkgs.url = "github:NixOs/nixpkgs/nixos-24.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, ... }@inputs: {
		nixosModules = import ./modules/nixos;
		homeModules  = import ./modules/home;

		# Build with nixos-rebuild switch --flake "./#hostname"
		# Available: nwix
		nixosConfigurations = import ./hosts inputs;
	};
}
