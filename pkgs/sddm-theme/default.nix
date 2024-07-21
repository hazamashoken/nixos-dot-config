{
  lib,
  formats,
  stdenvNoCC,
  fetchFromGitHub,
  qt6,
  libsForQt5,
  fetchurl,
  variants ? [ "qt6" ],
  /*
    An example of how you can override the background on the NixOS logo

      environment.systemPackages = [
        (pkgs.where-is-my-sddm-theme.override {
          themeConfig.General = {
            background = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            backgroundMode = "none";
          };
        })
      ];
  */
  themeConfig ? null,
}:

let
  user-cfg = (formats.ini { }).generate "theme.conf.user" themeConfig;
  validVariants = [
    "qt5"
    "qt6"
  ];
  image = fetchurl {
    url = "https://static.vecteezy.com/system/resources/previews/036/431/995/non_2x/ai-generated-colorful-starry-sky-with-sunset-background-in-anime-style-generative-ai-photo.jpg";
    sha256 = "1dy299d99x4p9bix0bd227qs7lchijgrl2idlz93kjbdpnhmmf1q";
  };
in

lib.checkListOfEnum "sddm-astronaut-theme: variant" validVariants variants

stdenvNoCC.mkDerivation rec {
  pname = "sddm-astronaut-theme";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "Keyitdev";
    repo = pname;
    rev = "48ea0a792711ac0c58cc74f7a03e2e7ba3dc2ac0";
    sha256 = "0ga4jvw23vlj52vnfmzvkz16wybn9mrzlfmrnn62y1bprp7jyyli";
  };

  propagatedUserEnvPkgs =
    [ ]
    ++ lib.optional (lib.elem "qt5" variants) [ libsForQt5.qtgraphicaleffects ]
    ++ lib.optional (lib.elem "qt6" variants) [
      qt6.qt5compat
      qt6.qtsvg
    ];

  installPhase = ''
      mkdir -p $out/share/sddm/themes/
    ''
    + lib.optionalString (lib.elem "qt6" variants) (
      ''
        cp -aR $src $out/share/sddm/themes/$pname
      ''
      + lib.optionalString (lib.isAttrs themeConfig) ''
        ln -sf ${user-cfg} $out/share/sddm/themes/$pname/theme.conf.user
      ''
    );
}
