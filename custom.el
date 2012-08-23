;;Stop splash screen
(setq inhibit-splash-screen t)

;; sets the scratch message to empty string
(setq initial-scratch-message nil)

;; See http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_620.html
;; and http://www.gnu.org/software/emacs/manual/elisp.pdf
;; disable line wrap
(setq default-truncate-lines t)

;; make side by side buffers function the same as the main window
(setq truncate-partial-width-windows nil)

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

;;Indent with spaces, never with TABs
(setq-default indent-tabs-mode nil)

;;Sets basic offset
(setq c-basic-offset 2)

;;Indent to 2 spaces
(setq-default tab-width 2)

;;Tabs stop every 2 spaces
(setq-default tab-stop-list (quote (2 4 6 8 10)))

;;Permanently, force TAB to insert just one TAB (in every mode):
(global-set-key (kbd "TAB") 'tab-to-tab-stop);

(autoload 'blank-mode "blank-mode" "Blank Mode." t)

;; turn off tool bar
(tool-bar-mode 0)

;; turn off scroll bar
(scroll-bar-mode -1)

;; ORG MODE
(setq org-log-done 'time)
(setq org-log-done 'note)
;; END ORG MODE

(setq auto-mode-alist (cons '("\\.psql$" . sql-mode) auto-mode-alist))

;; Add F5 to refresh current buffer
(global-set-key [f5] 'revert-buffer)

(global-set-key [f6] 'bury-buffer)

(global-set-key [f7] 'blank-mode)

(global-set-key [f8] 'comint-previous-prompt)

(global-set-key [f9] 'undo)

;; Add F12 to toggle line wrap
(global-set-key [f12] 'toggle-truncate-lines)

(global-set-key (kbd "C--") 'back-window)

(global-set-key (kbd "C-=") 'other-window)

(defalias 'yes-or-no-p 'y-or-n-p)

;;; Fix junk characters in shell-mode
(add-hook 'shell-mode-hook
          'ansi-color-for-comint-mode-on)

;;http://www.emacswiki.org/cgi-bin/emacs-en/LoadPath
;;     (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;         (let* ((my-lisp-dir "~/elisp/")
;;               (default-directory my-lisp-dir))
;;            (setq load-path (cons my-lisp-dir load-path))
;;            (normal-top-level-add-subdirs-to-load-path)))

;;(autoload 'tail "tail" "Tail." t)

;; (add-to-list 'load-path "~/.emacs.d/rinari")
;; (require 'rinari)
;; (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))

;; (add-to-list 'load-path "~/.emacs.d/rhtml")
;; (require 'rhtml-mode)
;;   (add-hook 'rhtml-mode-hook
;;     (lambda () (rinari-launch)))
;; (add-to-list 'auto-mode-alist '("\\.rhtml\\.erb\\'" . rhtml-mode))

;;For Subversion support
(add-to-list 'vc-handled-backends 'SVN)

(setenv "PAGER" "/bin/cat")

(setq split-width-threshold nil)


(defun back-window ()
  (interactive)
  (other-window -1))

;; scala mode hooks
(add-hook 'scala-mode-hook 'scala-turnoff-indent-tabs-mode)
;; end Scala Mode

;; Add color to a shell running in emacs 'M-x shell'
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Makes the prompt read-only running in emacs 'M-x shell'
(add-hook 'shell-mode-hook
     '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)


;; http://www.emacswiki.org/emacs/ShellMode#toc3
;; (global-set-key [f7] 'alt-shell-dwim)

(defun alt-shell-dwim (arg)
  "Run an inferior shell like `shell'. If an inferior shell as its I/O
through the current buffer, then pop the next buffer in `buffer-list'
whose name is generated from the string \"*shell*\". When called with
an argument, start a new inferior shell whose I/O will go to a buffer
named after the string \"*shell*\" using `generate-new-buffer-name'."
  (interactive "P")
  (let* ((shell-buffer-list
   (let (blist)
      (dolist (buff (buffer-list) blist)
        (when (string-match "^\\*shell\\*" (buffer-name buff))
   (setq blist (cons buff blist))))))
   (name (if arg
      (generate-new-buffer-name "*shell*")
    (car shell-buffer-list))))
    (shell name)))

;;(defun my-espresso-mode-hook ()
;;  (require 'espresso)
;;  (setq espresso-indent-level 2
;;        indent-tabs-mode nil
;;        c-basic-offset 2))

;;(add-hook 'espresso-mode-hook 'my-espresso-mode-hook)

;; Scala Mode
(add-to-list 'load-path "~/.emacs.d/custom/scala-mode")
(require 'scala-mode-auto)

(defun scala-turnoff-indent-tabs-mode ()
  (setq indent-tabs-mode nil))
;; end Scala Mode

;; Ensime Mode
(add-to-list 'load-path "~/.emacs.d/custom/ensime/elisp/")
(require 'ensime)

;; Load ENSIME
(add-to-list 'load-path "/home/agoodno/.emacs.d/ensime/elisp/")
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; MINI HOWTO:
;; Open .scala file. M-x ensime (once per project)

;; end ENSIME

(add-to-list 'load-path
             "~/.emacs.d/color-themes/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(load-file "~/.emacs.d/color-themes/color-theme-blackboard.el")

;(add-hook 'org-mode-hook
;          #'(lambda ()
;              (local-set-key [tab] 'yas/expand)))

(load-file "~/.emacs.d/custom/javascript.el")
(load-file "~/.emacs.d/custom/bar-cursor.el")

(require 'bar-cursor)
(bar-cursor-mode 1)

;;(server-start)
