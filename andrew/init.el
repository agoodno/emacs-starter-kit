(custom-set-variables
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(scroll-bar-mode (quote right)))
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;;Stop splash screen
(setq inhibit-splash-screen t)

;;Indent with spaces, never with TABs
(setq-default indent-tabs-mode nil)

;;Sets basic offset
(setq c-basic-offset 2)

;;Indent to 2 spaces
(setq-default tab-width 2)

;;Tabs stop every 2 spaces
(setq-default tab-stop-list (quote (2 4 6 8 10)))

(autoload 'blank-mode "blank-mode" "Blank Mode." t)

(defun my-espresso-mode-hook ()
  (require 'espresso)
  (setq espresso-indent-level 2
        indent-tabs-mode nil
        c-basic-offset 2))

(add-hook 'espresso-mode-hook 'my-espresso-mode-hook)

;; (global-font-lock-mode t)

;; (windmove-default-keybindings)

;; (setq use-file-dialog nil)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions and add special behaviors to regions.
;; "C-h d transient" for more info
(setq transient-mark-mode t)

;; Display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;(global-set-key "\C-q" 'backward-kill-word)

;; Scala Mode
(add-to-list 'load-path "/home/andrew/.emacs.d/andrew/plugins/scala-mode")
(require 'scala-mode-auto)

;; Ensime Mode
(add-to-list 'load-path "/home/andrew/.emacs.d/andrew/plugins/ensime/elisp/")
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(add-to-list 'load-path
             "~/.emacs.d/andrew/plugins/emacs-color-theme-solarized")
(require 'color-theme-solarized)

;(add-hook 'org-mode-hook
;          #'(lambda ()
;              (local-set-key [tab] 'yas/expand)))

(server-start)
