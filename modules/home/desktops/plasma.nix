{
	#* NOTE: You must set the accent color yourself!
	#* This doesn't offer an API to set that iirc.
	programs.plasma =
		let
			root = ../../../.;
		in
		{
			enable = true;

			workspace = {
				lookAndFeel = "org.kde.breeze.desktop";
				colorScheme = "BreezeLight";

				cursor = {
					theme = "Breeze_Light";
					size = 30;
				};

				iconTheme = "breeze";
				wallpaper = root + /data/img/manjaro_wallpaper.png;
			};

			fonts = {
				general = {
					family = "Ubuntu Sans";
					pointSize = 12;
				};
			};

			panels = [
				{
					location = "top";
					height = 27;
					widgets = [
						{
							kickoff = {
								sortAlphabetically = true;

								favoritesDisplayMode = "grid";

								icon  = "nix-snowflake";
								label = "Applications";
							};
						}

						{
							name = "org.kde.plasma.taskmanager";
							config = {
								General = {
									# No launchers
									launchers = [];
								};
							};
						}

						"org.kde.plasma.panelspacer"
						"org.kde.plasma.marginsseparator"

						{
							pager = {
								general.showOnlyCurrentScreen = true;
							};
						}

						{
							systemTray.items = {
								shown = [
									"org.kde.plasma.battery"
								];

								hidden = [
									"steam"
								];
							};
						}

						"org.kde.plasma.digitalclock"
					];
				}
			];

			configFile = {
				"kwinrc"."Desktops"."Number" = {
					value = 4;
					immutable = true;
				};
			};
		};
}
