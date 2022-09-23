(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(package-initialize)



(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(setq visible-bell t)
(setq ring-bell-function 'ignore)

(setq window-divider-default-right-width 3)
(setq window-divider-default-places 'right-only)
(window-divider-mode)

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package auto-compile
    :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)
(use-package use-package-ensure-system-package)
(setq byte-compile-warnings '(cl-functions))

(setq default-frame-alist
      (append (list '(width  . 72) '(height . 40)
                    '(vertical-scroll-bars . nil)
                    '(internal-border-width . 24))))

(set-frame-parameter (selected-frame)
                     'internal-border-width 24)

					; General
(scroll-bar-mode -1)        ; Disable visible scrollbar.
(menu-bar-mode -1) 	    ; Disable visible menubar.
(tool-bar-mode -1) 	    ; Disable visible toolbar.
(global-display-line-numbers-mode t) ; Display line numbers
(setq display-time-default-load-average nil)
      (display-time-mode t)





(use-package pdf-tools)     ; PDF reading
(use-package nov)           ; EPUB Reading


(use-package evil           ; VIM
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))


(use-package beacon
  :config
  (beacon-mode 1))

(use-package powerline)

(use-package elfeed)
  :init
  (setq elfeed-feeds
      '("https://archlinux.org/feeds/news/"                            
	"https://bugs.archlinux.org/feed.php?feed_type=rss2&project=0" 	
	"https://www.reddit.com/r/kernel/.rss"                     
	"https://www.schneier.com/feed/atom"))
  :config
  (elfeed-update)

(use-package flycheck-aspell)

(use-package solarized-theme)
  :config
  (load-theme `solarized-dark t)

(use-package lsp-mode)

(use-package company)
  :config
  (add-hook `after-init-hook `global-company-mode)

(use-package treemacs)
  :ensure t
  :defer t

(use-package disaster) 


;; (use-package sly) I'll need to look more into this
;;  :config
;;  (setq inferior-lisp-program "/opt/sbcl/bin/sbcl")

(use-package all-the-icons)

(use-package go-mode)

(use-package org-chef)

(use-package centaur-tabs
  :demand
  :config
  (setq centaur-tabs-style "bar"
  centaur-tabs-height 32
  centaur-tabs-set-icons t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))


(use-package dirvish
  :ensure t
  :init
  ;; Let Dirvish take over Dired globally
  (dirvish-override-dired-mode))

(use-package magit)
