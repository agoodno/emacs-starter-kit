;; Start ERC config
(setq erc-autojoin-channels-alist '(("wicourts.gov" "#ccap3" "#cc")))

(setq erc-user-full-name "Andrew Goodnough")
(setq erc-email-userid "andrew.goodnough@wicourts.gov")

(erc :server "irc.wicourts.gov" :port 6667 :nick "agoodno")

(setq erc-save-buffer-on-part nil
      erc-save-queries-on-quit nil
      erc-log-write-after-send t
      erc-log-write-after-insert t)

(setq erc-autoaway-idle-seconds 300)
(setq erc-auto-set-away t)
;;(setq erc-keywords '("agoodno*[,:;]" "\\bagoodno[!?.]+$" "codecommit*[,:;]" "\\bcodecommit[!?.]+$"))
(setq erc-keywords '(".*agoodno.*" "^codecommit.*$"))
;;(setq erc-keywords '("\\b\\(andy\\|agoodno\\)[!?.,;]*$" "\\(andy\\|agoodno\\)[:!?,;]+" "\\b\\([hH]ey\\|[hH]i\\) \\(andy\\|agoodno\\|man\\)\\b"))
(erc-match-mode 1)

;;; Notify me when a keyword is matched (someone wants to reach me)

(defvar my-erc-page-message "%s says %s"
  "Format of message to display in dialog box")

(defvar my-erc-page-nick-alist nil
  "Alist of nicks and the last time they tried to trigger a notification")

(defvar my-erc-page-timeout 60
  "Number of seconds that must elapse between notifications from the same person.")

(defun my-erc-page-popup-notification (nick, message)
  (when window-system
    ;; must set default directory, otherwise start-process is unhappy
    ;; when this is something remote or nonexistent
    (let ((default-directory "~/"))
      ;; 8640000 milliseconds = 1 day
      (start-process "page-me" nil "notify-send"
                     "-u" "normal" "-t" "8640000" "ERC"
                     (format my-erc-page-message (car (split-string nick "!")) message)))))

(defun my-erc-page-allowed (nick &optional delay)
  "Return non-nil if a notification should be made for NICK.
If DELAY is specified, it will be the minimum time in seconds
that can occur between two notifications.  The default is
`my-erc-page-timeout'."
  (unless delay (setq delay my-erc-page-timeout))
  (let ((cur-time (time-to-seconds (current-time)))
        (cur-assoc (assoc nick my-erc-page-nick-alist))
        (last-time))
    (if cur-assoc
        (progn
          (setq last-time (cdr cur-assoc))
          (setcdr cur-assoc cur-time)
          (> (abs (- cur-time last-time)) delay))
      (push (cons nick cur-time) my-erc-page-nick-alist)
      t)))

(defun my-erc-page-me (match-type nick message)
  "Notify the current user when someone sends a message that
matches a regexp in `erc-keywords'."
  (interactive)
  (when (and (eq match-type 'keyword)
             ;; I don't want to see anything from the erc server
             (null (string-match "\\`\\([sS]erver\\|localhost\\)" nick))
             ;; or bots
             (null (string-match "\\(bot\\|serv\\)!" nick))
             ;; or from those who abuse the system
             (my-erc-page-allowed nick))
    (my-erc-page-popup-notification nick message)))
(add-hook 'erc-text-matched-hook 'my-erc-page-me)

(defun my-erc-page-me-PRIVMSG (proc parsed)
  (let ((nick (car (erc-parse-user (erc-response.sender parsed))))
        (target (car (erc-response.command-args parsed)))
        (msg (erc-response.contents parsed)))
    (when (and (erc-current-nick-p target)
               (not (erc-is-message-ctcp-and-not-action-p msg))
               (my-erc-page-allowed nick))
      (my-erc-page-popup-notification nick msg)
      nil)))
(add-hook 'erc-server-PRIVMSG-functions 'my-erc-page-me-PRIVMSG)

;(eval-after-load 'erc-track-mode
;  '(define-key erc-mode-map (kbd "C-x C-u") 'browse-url))

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
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Ubuntu Mono")))))
