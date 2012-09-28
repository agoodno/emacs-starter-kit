;; Start ERC config
(erc :server "irc.wicourts.gov" :port 6667 :nick "agoodno")
(setq erc-autojoin-channels-alist
  '(("irc.wicourts.gov" "#ccap3" "#cc" "#release")))

;; Notify my when someone mentions my nick.
(defun erc-global-notify (matched-type nick msg)
  (interactive)
  (when (eq matched-type 'current-nick)
    (shell-command
     (concat "notify-send -t 4000 -c \"im.received\" \""
             (car (split-string nick "!"))
             " says\" \""
             msg
             "\""))))
(add-hook 'erc-text-matched-hook 'erc-global-notify)
;; End ERC config

;; custom for agoodno
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(erc-modules (quote (autoaway autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands notify readonly ring stamp track)))
 '(tooltip-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "Liberation Mono")))))
