inputs:
{
  default = inputs.nixpkgs.lib.composeManyExtensions (
    builtins.attrValues (
      inputs.nixpkgs.lib.filterAttrs
        (name: _: name != "default")
        inputs.self.overlays
    )
  );

  packages = final: prev: import ./default.nix { pkgs = final; };
}
