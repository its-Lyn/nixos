# This is a function
inputs: {
  wynux = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      inputs.self.nixosModules.git
      inputs.self.nixosModules.nvidia
      inputs.self.nixosModules.gnome

      ./wynux/default.nix

      # Begin Home Manager setup.
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.evelyn = import ./wynux/home.nix;

        home-manager.extraSpecialArgs = { inherit inputs; };
      }
    ];
  };
}
