{ config, lib, pkgs, specialArgs, ... }:
{
	imports = [
		./hardware-configuration.nix
		./schedules.nix
		./services.nix
	];

	# ! Switch from Nix to Lix
	# * A better version of the nix *programming language*
	# * Basically it has a better dev team, as well as more features
	# * And it has the lesbian colour scheme (https://lix.systems)
	# ! Comment below line if you do not want that.
	# !!
	nix.package = pkgs.lix;
	# !!

	# Enable flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Custom OS Modules.
	specialModules = {
		nvidia.enable = true;
		nvidia.amdgpuBusId = "PCI:5:0:0";
		nvidia.nvidiaBusId = "PCI:1:0:0";

		git.enable = true;
		git.user   = "its-Lyn";
		git.email  = "143884194+its-Lyn@users.noreply.github.com";
	};

	programs = {
		steam = {
			enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
			localNetworkGameTransfers.openFirewall = true;
		};

		nh = {
			enable = true;
		};

		fish.enable = true;
	};

	boot = {
		# Use the systemd-boot EFI boot loader.
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};

		# V4L2Loopback
		extraModulePackages = with config.boot.kernelPackages; [
			v4l2loopback
		];

		kernelModules = [ "v4l2loopback" ];
		extraModprobeConfig = ''
			options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
		'';
	};

	# God knows
	security.polkit.enable = true;

	networking.hostName = "nwix"; # Define your hostname.
	networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

	# Set your time zone.
	time.timeZone = "Europe/Bucharest";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_GB.UTF-8";
	console = {
		font = "Lat2-Terminus16";
		keyMap = "us";
	};

	# User
	users.users.eve = {
		isNormalUser = true;
		description = "Evelyn Serra";
		extraGroups = [ "wheel" ];
		shell = pkgs.fish;
		packages = with pkgs; [
			# Communication
			discord

			# Network
			firefox

			# Dev
			vscode
			kakoune

			# Minecraft
			prismlauncher

			# .NET Development
			dotnet-sdk_8
			dotnet-runtime_8
			dotnet-aspnetcore_8

			jetbrains.rider

			# Utils
			cloc
			specialArgs.inputs.hopnot.packages."x86_64-linux".hopnot
		];
	};

	environment.systemPackages = with pkgs; [
			nix-output-monitor
	];

	# Allow unfree software.
	nixpkgs.config.allowUnfree = true;

	# This option defines the first version of NixOS you have installed on this particular machine,
	# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
	#
	# Most users should NEVER change this value after the initial install, for any reason,
	# even if you've upgraded your system to a new NixOS release.
	#
	# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
	# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
	# to actually do that.
	#
	# This value being lower than the current NixOS release does NOT mean your system is
	# out of date, out of support, or vulnerable.
	#
	# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
	# and migrated your data accordingly.
	#
	# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
	system.stateVersion = "24.05"; # Did you read the comment?
}

