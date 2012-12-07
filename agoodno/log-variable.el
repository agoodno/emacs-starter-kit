(global-set-key (kbd "C-x C-l")
  (lambda (&optional arg)
    "Keyboard macro."
    (interactive "p")
    (kmacro-exec-ring-item (quote ([134217847 16 5 return 108 111 103 103 101 114 46 100 101 98 117 103 40 34 25 61 37 115 34 46 102 111 114 109 97 116 40 25 41 41] 0 "%d")) arg)))
