{ config, lib, pkgs, ... }:
{
	options = {
		specialModules.nvidia.enable = lib.mkEnableOption "Enable NVIDIA drivers.";

		specialModules.nvidia.nvidiaBusId = lib.mkOption {
			type = lib.types.str;
			description = "PCI bus ID for the NVIDIA GPU.";
		};

		specialModules.nvidia.amdgpuBusId = lib.mkOption {
			type = lib.types.str;
			description = "PCI bus ID for the AMD GPU.";
		};
	};

	config = lib.mkIf config.specialModules.nvidia.enable {
		hardware.graphics = {
			enable = true;
		};

		services.xserver.videoDrivers = [ "nvidia" ];

		hardware.nvidia = {
			modesetting.enable = true;

			powerManagement = {
				enable = true;
				finegrained = false;
			};

			# NOTE: NOT the nouveau drivers.
			# Though these ones are currently buggy
			open = false;

			# When will this be discontinued?
			nvidiaSettings = true;

			# stable, beta, production
			# ^^^^^^
			# Stable but not as stable as prod
			package = config.boot.kernelPackages.nvidiaPackages.stable;

			# Prime setup
			prime = {
				# One day I will be able to
				# Tell the difference between
				# sync, reverseSync and offload
				reverseSync.enable = true;
				allowExternalGpu = false;
				# ???

				amdgpuBusId = config.specialModules.nvidia.amdgpuBusId;
				nvidiaBusId = config.specialModules.nvidia.nvidiaBusId;
			};
		};
	};
}
