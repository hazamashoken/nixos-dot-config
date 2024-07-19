{ pkgs, ... }:
let
  image = "${/home/tliangso/Wallpaper/hutao.jpg}";
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "HimDek";
    repo = "Utterly-Nord-Plasma";
    rev = "e513b4dfeddd587a34bfdd9ba6b1d1eac8ecadf5";
    sha256 = "1l6fgnrz18az5wg5q6zbn5y5k8h3rcpxzm8w20i0l1kyah2f10ls";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm -f Background.jpg
    cp -r ${image} $out/Background.jpg
   '';
}