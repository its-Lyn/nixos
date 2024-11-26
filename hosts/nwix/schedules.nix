{ config, lib, pkgs, specialArgs, ... }:
{
	#! Update the system automatically
	#* Check timer status at `systemctl status nixos-upgrade.timer`
	#* Check update logs at `systemctl status nixos-upgrade.service`
	system.autoUpgrade = {
		enable = true;
		flake = specialArgs.inputs.self.outPath;
		flags = [
			"-L"
		];

		dates = "weekly";
		randomizedDelaySec = "45min";
	};

	#! Run nix-collect-garbage automatically, every day.
	#* Check status at `systemctl status nix-gc.timer`
	#* Check logs at `systemctl status nix-gc.service`
	nix.gc = {
		automatic = true;
		persistent = true;

		dates = "daily";
		options = "--delete-older-than 7d";
	};
}
