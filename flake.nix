{
	description = "Eve's System Configuration";

	inputs = {
		nixpkgs.url = "github:NixOs/nixpkgs/nixos-24.05";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		plasma-manager = {
			url = "github:nix-community/plasma-manager";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};
	};

	outputs = { self, nixpkgs, home-manager, plasma-manager, ... }@inputs: {
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

						home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];

						home-manager.users.eve = import ./home/eve/home.nix;
					}

					./modules/nixos
					./hosts/nwix
				];
			};
		};
	};
}
