inputs: {
	nwix = inputs.nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [
			inputs.self.nixosModules.nvidia
			inputs.self.nixosModules.git

			./nwix
		];
	};
}
