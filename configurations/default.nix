inputs: {
  wynux = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      inputs.self.nixosModules.git-config
      ./wynux/default.nix
    ];
  };
}
