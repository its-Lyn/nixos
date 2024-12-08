{
	stdenvNoCC,
	lib,
	fetchFromGitHub,
}:
stdenvNoCC.mkDerivation rec {
	pname = "zorin-desktop-themes";
	version = "4.2.1";

	src = fetchFromGitHub {
		owner = "ZorinOS";
		repo = "zorin-desktop-themes";
		rev = "4.2.1";
		hash = "sha256-eeEU+yYpfzzIiyGu5IbPPv4rEO5E8Waeh9wyGxcEmPw=";
	};

	dontBuild = true;

	installPhase = ''
		runHook preInstall

		mkdir -p $out/share/themes

		rm -rf debian
		rm LICENSE README.md

		mv * $out/share/themes

		runHook postInstall
	'';
}

