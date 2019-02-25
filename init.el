(require 'linum)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-packages)
(require 'init-tide)
(require 'init-markdown)
(require 'init-osx)

;; Open fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Allow hash to be entered
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Don't write lock-files, I'm the only one here
(setq create-lockfiles nil)

;; Switch line numbers on
(global-linum-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-selected-packages (quote (company tide))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq
   backup-by-copying t
   backup-directory-alist
    '(("." . "~/.emacs-saves/"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)
