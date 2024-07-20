# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  # inputs,
  outputs,
  lib,
  # config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./src/stylix.nix
    ./src/stylix-home.nix
    # ./src/hyprland.nix
    ./src/zsh.nix
    ./src/nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightzsh-powerlevel10k meslo-lgs-nfly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # TODO: Set your username
  home = {
    username = "tliangso";
    homeDirectory = "/home/tliangso";
  };

  # Add stuff for your user as you see fit:

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Note: To use unstable package, use `unstable.packageName`
    # Util
    fastfetch
    # waybar
    # rofi-wayland
    # rofi-bluetooth
    # hyprpaper
    btop
    # hyprnome ???
    # hyprlock
    # hypridle
    # hyprpicker
    # hyprshot
    # wl-clipboard
    # cliphist
    # Build tools
    gnumake
    cmake
    meson
    # Debuggers
    valgrind
    gdb
    lldb
    # Language servers
    clang
    nixd
    # File management
    dolphin
    ark
    # Editors
    vscode
    # Media
    mpv
    obs-studio
    yt-dlp
    # Internet / Social media
    firefox
    chromium
    vesktop # discord, but doesn't suck
    # Fonts
    (nerdfonts.override {
      fonts = [ "Hack" "FiraCode" ];
    })
    tlwg
    noto-fonts-cjk
  	noto-fonts-emoji
    zsh-powerlevel10k
    # dev tools
    warp-terminal
    volta
    pyenv
    jetbrains.datagrip
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  
  
  gtk = {
    enable = true;
    iconTheme = {
      name = "Flat-Remix-Orange-Dark";
      package = pkgs.flat-remix-icon-theme;
    };
  };
  # programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
