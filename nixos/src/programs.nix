{
  pkgs,
  inputs,
  ...
} : {
  # programs.hyprland = {
  #   enable = true;
  #   # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  # };
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.zsh.enable = true;
  programs.nm-applet = {
    enable = true;
    indicator = true;
  };
  programs.dconf.enable = true;
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      xorg.libX11
      libGL
      libGLU
    ];
  };
}
