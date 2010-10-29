(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 89 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;;Stop splash screen
(setq inhibit-splash-screen t)

;;Indent with spaces, never with TABs
(setq-default indent-tabs-mode nil)

;;Sets basic offset
(setq c-basic-offset 3)

;;Indent to 3 spaces
(setq-default tab-width 3)

;;Tabs stop every 3 spaces
(setq-default tab-stop-list (quote (3 6 9)))

;;Add all the .el files from andrew directory
(add-to-list 'load-path "~/.emacs.d/andrew")

(autoload 'blank-mode "blank-mode" "Blank Mode." t)

(defun my-espresso-mode-hook ()
  (require 'espresso)
  (setq espresso-indent-level 2
        indent-tabs-mode nil
        c-basic-offset 2))

(add-hook 'espresso-mode-hook 'my-espresso-mode-hook)

(server-start)
