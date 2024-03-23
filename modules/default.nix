{
  # Defined modules. They go here.

  # ## System-Wide modules ## #
  git = import ./nixos/git.nix;
  nvidia = import ./nixos/nvidia.nix;

  # ## Home-Specific modules ## #
  fish = import ./home/fish.nix;
}
