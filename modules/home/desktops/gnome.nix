{ pkgs, ... }:
let
	zorin-icon-themes = pkgs.callPackage ../../../packages/zorin-icon-themes/package.nix {};

	wallpaperPath  = ../../../data/img/zorin-night-wallpaper.jpg;
	wallpaperDConf = "file://${wallpaperPath}";
in
{
	dconf.enable = true;
	dconf.settings = {
		"org/gnome/desktop/interface" = {
			clock-show-weekday = true;

			color-scheme = "prefer-dark";
			cursor-size = 32;
			enable-animations = false;
			locate-pointer = true;
		};

		"org/gnome/desktop/a11y/interface" = {
			show-status-shapes = true;

		};

		"org/gnome/desktop/wm/preferences" = {
			button-layout = "appmenu:minimize,close";
		};

		"org/gnome/desktop/background" = {
			picture-uri-dark = wallpaperDConf;
			picture-uri = wallpaperDConf;
		};

		"org/gnome/shell" = {
			disable-user-extensions = false;
			enabled-extensions = [
				"window-list@gnome-shell-extensions.gcampax.github.com"
				"xwayland-indicator@swsn3.de"
				"runcat@kolesnikov.se"
				"arcmenu@arcmenu.com"
			];
		};

		"org/gnome/shell/extensions/runcat" = {
			idle-treshold = 15;
			displaying-items = "character-and-percentage";
		};

		"org/gnome/shell/extensions/arcmenu" = {
			hide-overview-on-startup = true;
			show-activities-button = true;

			menu-layout = "Windows";
			menu-background-color = "rgba(28,28,28,0.98)";
			menu-border-color = "rgb(63,62,64)";
			menu-foreground-color = "rgb(211,218,227)";
			menu-item-active-bg-color = "rgba(228,228,226,0.15)";
			menu-item-hover-bg-color = "rgba(238,238,236,0.08)";
			menu-separator-color = "rgb(63,62,64)";
			menu-item-grid-icon-size = "Medium";
			menu-item-icon-size = "Extralarge";
			menu-font-size = 14;

			distro-icon = 22;
			custom-menu-button-icon-size = 31.0;
		};

		"org/gnome/mutter" = {
			dynamic-workspaces = true;
			workspaces-only-on-primary = true;
		};
	};

	gtk = {
		enable = true;

		font = {
			name = "Ubuntu Sans";
			package = pkgs.ubuntu-sans;
			size = 14;
		};

		theme = {
			name = "adw-gtk3-dark";
			package = pkgs.adw-gtk3;
		};

		iconTheme = {
			name = "ZorinBlue-Dark";
			package = zorin-icon-themes;
		};

		cursorTheme = {
			name = "Adwaita";
			package = pkgs.adwaita-icon-theme;
		};
	};
}
