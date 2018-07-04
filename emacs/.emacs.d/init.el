(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'molokai t)


(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

(require 'package)

(setq
  package-enable-at-startup nil
  package-archives '(("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package evil-collection
  :after 'evil
  :ensure t
  :config
  (evil-collection-init))

(use-package helm
  :ensure t
  :init
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (setq helm-candidate-number-list 50))

(use-package projectile
  :ensure t
  :config
  (setq projectile-use-git-grep t)
  (projectile-mode))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-max-display-columns nil)
  (setq which-key-side-window-max-width 0.5)
  (setq which-key-side-window-location 'right)
  :config
  (which-key-mode))

(use-package rainbow-mode
  :ensure t)

(use-package general
  :ensure t
  :config

    ;; spacemacs-ish keybindings 
    (general-define-key
      :states '(normal visual insert emacs)
      :prefix "SPC"
      :non-normal-prefix "M-SPC"
      "SPC" '(helm-M-x :which-key "M-x")
      "fed" (lambda ()
	      (interactive)
	      (evil-edit (concat user-emacs-directory "init.el")))
      "u"   'universal-argument
      "p" '(:keymap projectile-command-map :wk "projectile prefix")
      )
    
    (general-define-key
     :keymaps 'evil-motion-state-map
     "C-u" 'evil-scroll-up)

    ;; vinegar-ish behavior
    (general-define-key
     :states '(normal emacs)
     "-" 'dired-jump)
    (general-define-key
     :keymaps 'dired-mode-map
     "-" 'dired-jump)
    
    )
     
      
 


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default)))
 '(package-selected-packages
   (quote
    (helm-projectile evil-collection rainbow-mode projectile general which-key helm use-package evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
