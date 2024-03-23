{ pkgs, ... }: {
  somescript = pkgs.callPackage ./somescript { };
}
