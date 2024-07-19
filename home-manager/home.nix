# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  # inputs,
  outputs,
  # lib,
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
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

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
    jetbrains.datagrip
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "kubectl" ];
    };
    # plugins = [
    #   {
    #     name = "zsh-powerlevel10k";
    #     src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
    #     file = "powerlevel10k.zsh-theme";
    #   }
    # ];
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      transparent-nvim
      vim-airline
      vim-airline-themes
      # nvim-treesitter.withAllGrammars
    ];
    extraConfig = ''
      " set			autoindent
      set			smartindent
      set			noexpandtab
      set			tabstop=4
      set			shiftwidth=4
      set			backspace=indent,eol,start
      syntax		on
      set			nu
      set			list
      set			listchars+=space:⋅
      set			listchars+=tab:→\ 
      set			listchars+=eol:↴

      hi Pmenu	ctermfg=white ctermbg=black gui=NONE guifg=white guibg=black
      hi PmenuSel	ctermfg=white ctermbg=blue gui=bold guifg=white guibg=purple
      
      let g:airline_powerline_fonts = 1
      let g:airline_theme='owo'
    '';
  };
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
