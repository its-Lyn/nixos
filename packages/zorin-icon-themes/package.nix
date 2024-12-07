{
	stdenvNoCC,
	lib,
	fetchFromGitHub,
	gnome-themes-extra,
	gtk-engine-murrine,
	gtk_engines
}:
stdenvNoCC.mkDerivation rec {
	pname = "zorin-icon-themes";
	version = "3.3.1";

	src = fetchFromGitHub {
		owner = "ZorinOS";
		repo = "zorin-icon-themes";
		rev = "3.3.1";
		sha256 = "00ldfz1wcn6h9wp78a1w0m3flyr6k5zp6b0kkcbp6g3g08g9mkv5";
	};

	dontBuild = true;

	installPhase = ''
		runHook preInstall

		mkdir -p $out/share/icons

		rm -rf debian
		rm LICENSE README.md

		mv * $out/share/icons

		runHook postInstall
	'';
}
