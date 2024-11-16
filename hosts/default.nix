inputs: {
	nwix = inputs.nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [
			inputs.self.nixosModules.nvidia
			inputs.self.nixosModules.git

			./nwix

			inputs.self.homeModules.hyfetch
			inputs.home-manager.nixosModules.home-manager {
				home-manager.useGlobalPkgs = true;
				home-manager.users.eve = import ./nwix/home.nix;
			}
		];
	};
}
