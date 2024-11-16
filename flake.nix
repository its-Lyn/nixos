{
	description = "Eve's System Configuration";

	inputs = { nixpkgs.url = "github:NixOs/nixpkgs/nixos-24.05"; };

	outputs = { self, nixpkgs, ... }@inputs: {
		nixosModules = import ./modules/nixos;

		# Build with nixos-rebuild switch --flake "./#hostname"
		# Available: nwix
		nixosConfigurations = import ./hosts inputs;
	};
}
