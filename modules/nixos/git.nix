{ config, lib, pkgs, ... }: {
	options = {
		specialModules.git.enable = lib.mkEnableOption "Enable Git support.";

		specialModules.git.email = lib.mkOption {
			type = lib.types.str;
			description = "The git email.";
		};

		specialModules.git.user = lib.mkOption {
			type = lib.types.str;
			description = "The git user name.";
		};
	};

	config = lib.mkIf config.specialModules.git.enable {
		programs.git = {
			enable = true;

			config = {
				alias = {
					l = "log";
					lg =
						"log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cD) %C(bold blue)<%an>%Creset' --abbrev-commit";
					};

				user = {
					name = config.specialModules.git.user;
					email = config.specialModules.git.email;
				};
			};
		};
	};
}
