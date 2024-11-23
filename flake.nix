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
		# Build with nixos-rebuild switch --flake "./#hostname"
		# Available: nwix
		nixosConfigurations = {
			nwix = inputs.nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit
						inputs
						self;
				};

				modules = [
					inputs.home-manager.nixosModules.home-manager {
						home-manager.useUserPackages = true;
						home-manager.useGlobalPkgs = true;

						home-manager.users.eve = import ./home/eve/home.nix;
					}

					./modules/nixos
					./hosts/nwix
				];
			};
		};
	};
}
