{
  pkgs,
  ...
} : {
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
}