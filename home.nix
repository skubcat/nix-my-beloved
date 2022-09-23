{ config, pkgs, lib, ... }:


{


  home.username = "brianna";
  home.homeDirectory = "/home/brianna";
  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    enableSyntaxHighlighting = true;
    enableCompletion = true; 
  };

  home.file.".emacs.d" = {
    source = ./catmacs.d;
    recursive = true;
  };

  programs.emacs.enable = true;
  programs.emacs.extraPackages = epkgs: (with epkgs; [
    nix-mode
    rtags
    auto-complete-clang
    use-package-ensure-system-package
    use-package
    auto-compile
    pdf-tools
    nov
    evil
    evil-collection
    beacon
    powerline
    elfeed
    flycheck-aspell
    solarized-theme
    lsp-mode
    company
    treemacs
    disaster
    sly
    all-the-icons
    go-mode
    org-chef
    centaur-tabs
    dirvish
    magit
  ]);


  services.dunst = {
    enable = true;
    iconTheme =  
    {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  services.dunst.settings = {

    global = {
      markup = "full";
      format = ''
      %s %p %I 
      %b'';
      word_wrap = true;

    };
  };



  services.picom = {
    enable = true;

  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; 
    [ 
      # lisp<-
      vim-sexp
      vim-better-whitespace      
      dashboard-nvim
      vim-nerdtree-tabs
      telescope-nvim
      nvim-fzf
      vim-lastplace
      multiple-cursors
      vim-nix
    ];

    extraConfig = ''

      

      set number
      set mouse=a
    '';
  };

}
