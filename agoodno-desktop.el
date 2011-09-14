;; custom for agoodno-desktop
(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 150))

;; Start ERC config
(erc :server "irc.wicourts.gov" :port 6667 :nick "agoodno")
(setq erc-autojoin-channels-alist
          '(("irc.wicourts.gov" "#ccap3" "#db" "#jenkins")))

(defun my-notify-erc (match-type nickuserhost message)
  "Notify when a message is received."
  (notify (format "%s in %s"
                  ;; Username of sender
                  (car (split-string nickuserhost "!"))
                  ;; Channel
                  (or (erc-default-target) "#unknown"))
          ;; Remove duplicate spaces
          (replace-regexp-in-string " +" " " message)
          :icon "emacs-snapshot"
          :timeout -1))

(add-hook 'erc-text-matched-hook 'my-notify-erc)

;; End ERC config
