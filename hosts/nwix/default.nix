{ config, lib, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
	];

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

	# Use the systemd-boot EFI boot loader.
	boot = {
		loader.systemd-boot.enable = true;
		loader.efi.canTouchEfiVariables = true;
	};

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

	services = {
		# Enable the X11 windowing system.
		xserver.enable = true;

		# Enable the Plasma Desktop Environment.
		displayManager.sddm.enable = true;
		desktopManager.plasma6.enable = true;

		# Set wayland default
		displayManager.defaultSession = "plasma";
		displayManager.sddm.wayland.enable = true;

		# Configure keymap in X11
		xserver.xkb.layout = "us";
		xserver.xkb.options = "eurosign:e,caps:escape";

		# Enable CUPS to print documents.
		printing.enable = true;

		# Enable sound.
		pipewire = {
			enable = true;
			pulse.enable = true;

			alsa = {
				enable = true;
				support32Bit = true;
			};
		};

		# Enable touchpad support (enabled default in most desktopManager).
		libinput.enable = true;

		# SSH.
		openssh.enable = true;
	};

	programs.fish.enable = true;

	# User
	users.users.eve = {
		isNormalUser = true;
		description = "Evelyn Serra";
		extraGroups = [ "wheel" ];
		shell = pkgs.fish;
		packages = with pkgs; [
			firefox
			kakoune

			discord
			steam
			vscode

			# Minecraft
			prismlauncher

			# .NET Development
			dotnet-sdk_8
			dotnet-runtime_8
			dotnet-aspnetcore_8

			jetbrains.rider
		];
	};

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

