# This is a function
inputs: {
  wynux = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      inputs.self.nixosModules.git
      inputs.self.nixosModules.nvidia

      ./wynux/default.nix

      # Begin Home Manager setup.
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.evelyn = import ./wynux/home.nix;

        extraSpecialArgs = { inherit inputs; };
      }
    ];
  };
}
