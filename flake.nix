{
	description = "Eve's System Configuration";

	inputs = {
		nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		plasma-manager = {
			url = "github:nix-community/plasma-manager";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};

		hopnot = {
			url = "github:its-Lyn/HopNotCLI";
			inputs.nixpkgs.follows = "nixpkgs";
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
