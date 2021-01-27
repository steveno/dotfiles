;; Write customizations elsewhere
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;; Package repositories
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

;; Custom command to refresh the repos and
;; install the package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Execute a command after you compile it
(eval-when-compile
  ;; (defvar use-package-verbose t)
  (eval-after-load 'advice
    `(setq ad-redefinition-action 'accept))
  (require 'use-package))

;; evil
(require 'evil')
(evil-mode 1)

;;(use-package paredit)
(use-package haskell-mode)

;; ivy
(use-package counsel)
(ivy-mode 1)

;; Enable theme
(load-theme 'brutalist)
(enable-theme 'brutalist)

;; Don't show splash screen
(setq inhibit-startup-screen t)

;; Hide the menu bar and such
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)

;; Create new lines if at end of buffer with C-n
(setq next-line-add-newlines t)

;; Save and backups
(setq auto-save-list-file-prefix "~/.cache/emacs/auto-save-list/.saves-")
(setq backup-directory-alist '(("." . "~/.cache/emacs/backup"))
      backup-by-copying t ; Use copies
      version-control t ; Use version numbers on backups
      delete-old-versions t ; Automatically delete excess backups
      kept-new-versions 10 ; Newest versions to keep
      kept-old-versions 5 ; Old versions to keep
      )

;; Line numbers
(global-display-line-numbers-mode 1)
