{
	programs.konsole =
		let
			root = ../../../.;
		in
		{
			enable = true;

			customColorSchemes = {
				Pastels = root + /data/config/TransparentPastels.colorscheme;
			};

			defaultProfile = "Eve";
			profiles.evelyn = {
				name = "Eve";
				colorScheme = "Pastels";

				extraConfig = {
					"Scrolling" = {
						HighlightScrolledLines = false;
						ScrollBarPosition = 2;
					};

					"Cursor Options" = {
						CursorShape = 1;
					};

					"Terminal Features" = {
						BlinkingCursorEnable = true;
					};
				};
			};

			# Disable the MenuBar
			extraConfig = {
  			General = {
					MenuBar = "Disabled";
				};
			};
		};
}
