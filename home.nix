{
  config,
  pkgs,
  lib,
  ...
}: {
  home.username = "brianna";
  home.homeDirectory = "/home/brianna";
  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
  programs.fzf.enable = true;

  home.file."/home/brianna/.emacs" = {
    source = ./emacs-conf.el;
    recursive = true;
  };

  services.emacs.enable = true;

  programs.mu = {
    enable = true;
  };
  
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: (with epkgs; [
      ebuku
      vterm
      org-modern
      mindre-theme
      all-the-icons
      avy
      god-mode
      dashboard
      format-all
      org-superstar
      writeroom-mode
      olivetti
      pocket-reader
      company-math
      counsel
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
      elfeed-org
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
      doom-themes
      magit
    ]);
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
}
