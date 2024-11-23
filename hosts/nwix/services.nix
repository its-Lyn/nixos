{ config, libs, pkgs, ... }:
{
	services = {
		# Enable the Plasma Desktop Environment.
		desktopManager.plasma6.enable = true;
		displayManager = {
			sddm.enable = true;

			# Set wayland default
			defaultSession = "plasma";
			sddm.wayland.enable = true;
		};

		# Enable the X11 windowing system.
		xserver = {
			enable = true;

			# Configure keymap in X11
			xkb.layout = "us";
			xkb.options = "eurosign:e,caps:escape";
		};

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
}
