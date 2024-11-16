inputs: {
	nwix = inputs.nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [
			inputs.self.nixosModules.nvidia
			inputs.self.nixosModules.git

			./nwix
			home-manager.nixosModules.home-manager {
				home-manager.users.eve = import ./nwix/home.nix;
			};
		];
	};
}
