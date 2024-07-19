
{
  pkgs,
  ...
} : {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    image = "${/home/tliangso/Wallpaper/hutao.jpg}";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    polarity = "dark";
    opacity = {
      applications = 0.0;
      desktop = 0.0;
      terminal = 0.79;
    };
    fonts = {
      sizes = {
        terminal = 14;
      };
    };
  };
}
