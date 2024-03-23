{
  programs.firefox = {
    enable = true;
    profiles.default = {
      userChrome = ''
        #TabsToolbar {
	        visibility: collapse;
        }

        #main-menubar > menu {
	        min-height: 40px;
        }
      '';
      extraConfig = ''
        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
      '';

      bookmarks = [
        # Misc Nix search sites.
        {name = "Nix Searches";
          toolbar = true;

          bookmarks = [
            {name = "Home-Manager options";
              url = "https://home-manager-options.extranix.com";
            }

            {name = "Nix options";
              url = "https://search.nixos.org/options";
            }

            {name = "Nix packages";
              url = "https://search.nixos.org/packages";
            }
          ];
        }

        # SyncTube stuff for me and someone :3
        {name = "SyncTube";
          toolbar = true;

          bookmarks = [
            {name = "SyncTube queue";
              url = "https://sync-tube.de/room/TR6MenLo";
            }

            {name = "SyncTube playlist";
              url = "https://sync-tube.de/room/VCnBMeyW";
            }
          ];
        }

        # Nix Documentation Section
        {name = "Documentation";
          toolbar = true;
          bookmarks = [
            {name = "Nix Manual";
              url = "https://nixos.org/manual/nix/stable";
            }

            {name = "Nix Good Documentation";
              url = "https://nix.dev/index.html";
            }

            {name = "Nix Bad Documentation";
              url = "https://nixos.wiki/";
            }
          ];
        }
      ];
    };
  };
}
