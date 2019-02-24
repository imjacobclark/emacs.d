(require 'package)

(when (< emacs-major-version 27)
    (setq package-enable-at-startup nil)
    (package-initialize))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(setq package-archive-priorities
      '(("melpa-stable" . 20) ("gnu" . 10) ("melpa" . 0)))

(package-refresh-contents)
(package-install 'tide)
(package-install 'company)

(require 'linum)

;; Setup for OSX
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; OSX/EMACS Shared Clipboard
(defun paste-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun copy-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'copy-to-osx)
(setq interprogram-paste-function 'paste-from-osx)

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

;; Theme
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

;; TIDE
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
