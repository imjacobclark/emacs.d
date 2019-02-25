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

(provide 'init-osx)