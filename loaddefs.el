;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (erc-highlight-nicknames) "erc-highlight-nicknames"
;;;;;;  "elpa-to-submit/erc-highlight-nicknames.el" (20070 17255))
;;; Generated autoloads from elpa-to-submit/erc-highlight-nicknames.el

(autoload 'erc-highlight-nicknames "erc-highlight-nicknames" "\
Searches for nicknames and highlights them. Uses the first
twelve digits of the MD5 message digest of the nickname as
color (#rrrrggggbbbb).

\(fn)" nil nil)

;;;***

;;;### (autoloads (htmlize-many-files-dired htmlize-many-files htmlize-file
;;;;;;  htmlize-region htmlize-buffer) "htmlize" "elpa-to-submit/htmlize.el"
;;;;;;  (20070 17255))
;;; Generated autoloads from elpa-to-submit/htmlize.el

(autoload 'htmlize-buffer "htmlize" "\
Convert BUFFER to HTML, preserving colors and decorations.

The generated HTML is available in a new buffer, which is returned.
When invoked interactively, the new buffer is selected in the current
window.  The title of the generated document will be set to the buffer's
file name or, if that's not available, to the buffer's name.

Note that htmlize doesn't fontify your buffers, it only uses the
decorations that are already present.  If you don't set up font-lock or
something else to fontify your buffers, the resulting HTML will be
plain.  Likewise, if you don't like the choice of colors, fix the mode
that created them, or simply alter the faces it uses.

\(fn &optional BUFFER)" t nil)

(autoload 'htmlize-region "htmlize" "\
Convert the region to HTML, preserving colors and decorations.
See `htmlize-buffer' for details.

\(fn BEG END)" t nil)

(autoload 'htmlize-file "htmlize" "\
Load FILE, fontify it, convert it to HTML, and save the result.

Contents of FILE are inserted into a temporary buffer, whose major mode
is set with `normal-mode' as appropriate for the file type.  The buffer
is subsequently fontified with `font-lock' and converted to HTML.  Note
that, unlike `htmlize-buffer', this function explicitly turns on
font-lock.  If a form of highlighting other than font-lock is desired,
please use `htmlize-buffer' directly on buffers so highlighted.

Buffers currently visiting FILE are unaffected by this function.  The
function does not change current buffer or move the point.

If TARGET is specified and names a directory, the resulting file will be
saved there instead of to FILE's directory.  If TARGET is specified and
does not name a directory, it will be used as output file name.

\(fn FILE &optional TARGET)" t nil)

(autoload 'htmlize-many-files "htmlize" "\
Convert FILES to HTML and save the corresponding HTML versions.

FILES should be a list of file names to convert.  This function calls
`htmlize-file' on each file; see that function for details.  When
invoked interactively, you are prompted for a list of files to convert,
terminated with RET.

If TARGET-DIRECTORY is specified, the HTML files will be saved to that
directory.  Normally, each HTML file is saved to the directory of the
corresponding source file.

\(fn FILES &optional TARGET-DIRECTORY)" t nil)

(autoload 'htmlize-many-files-dired "htmlize" "\
HTMLize dired-marked files.

\(fn ARG &optional TARGET-DIRECTORY)" t nil)

;;;***

;;;### (autoloads (javadoc-lookup) "javadoc-help" "elpa-to-submit/javadoc-help.el"
;;;;;;  (20070 17255))
;;; Generated autoloads from elpa-to-submit/javadoc-help.el

(autoload 'javadoc-lookup "javadoc-help" "\
Look up Java class in Javadoc.

\(fn)" t nil)

;;;***

;;;### (autoloads (markdown-mode) "markdown-mode" "elpa-to-submit/markdown-mode.el"
;;;;;;  (20070 17255))
;;; Generated autoloads from elpa-to-submit/markdown-mode.el

(autoload 'markdown-mode "markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;;;***

;### (autoloads (paredit-mode) "paredit" "elpa-to-submit/paredit.el"
;;;;  (19671 17922))
; Generated autoloads from elpa-to-submit/paredit.el

(autoload 'paredit-mode "paredit" "\
 Minor mode for pseudo-structurally editing Lisp code.
 With a prefix argument, enable Paredit Mode even if there are
   imbalanced parentheses in the buffer.
 Paredit behaves badly if parentheses are imbalanced, so exercise
   caution when forcing Paredit Mode to be enabled, and consider
   fixing imbalanced parentheses instead.
 \\<paredit-mode-map>

 \(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (paredit-mode) "paredit" "elpa-to-submit/paredit.el"
;;;;;;  (20070 17255))
;;; Generated autoloads from elpa-to-submit/paredit.el

(autoload 'paredit-mode "paredit" "\
Minor mode for pseudo-structurally editing Lisp code.
With a prefix argument, enable Paredit Mode even if there are
  imbalanced parentheses in the buffer.
Paredit behaves badly if parentheses are imbalanced, so exercise
  caution when forcing Paredit Mode to be enabled, and consider
  fixing imbalanced parentheses instead.
\\<paredit-mode-map>

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (pcomplete/rake) "pcmpl-rake" "elpa-to-submit/pcmpl-rake.el"
;;;;;;  (20070 17255))
;;; Generated autoloads from elpa-to-submit/pcmpl-rake.el

(autoload 'pcomplete/rake "pcmpl-rake" "\
Completion rules for the `ssh' command.

\(fn)" nil nil)

;;;***

;;;### (autoloads (ri) "ri" "elpa-to-submit/ri.el" (20070 17255))
;;; Generated autoloads from elpa-to-submit/ri.el

(autoload 'ri "ri" "\
Look up Ruby documentation.

\(fn &optional RI-DOCUMENTED)" t nil)

;;;***

;;;### (autoloads (ruby-electric-mode) "ruby-electric" "elpa-to-submit/ruby-electric.el"
;;;;;;  (20070 17255))
;;; Generated autoloads from elpa-to-submit/ruby-electric.el

(autoload 'ruby-electric-mode "ruby-electric" "\
Toggle Ruby Electric minor mode.
With no argument, this command toggles the mode.  Non-null prefix
argument turns on the mode.  Null prefix argument turns off the
mode.

When Ruby Electric mode is enabled, an indented 'end' is
heuristicaly inserted whenever typing a word like 'module',
'class', 'def', 'if', 'unless', 'case', 'until', 'for', 'begin',
'do'. Simple, double and back quotes as well as braces are paired
auto-magically. Expansion does not occur inside comments and
strings. Note that you must have Font Lock enabled.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (scpaste-region scpaste) "scpaste" "elpa-to-submit/scpaste.el"
;;;;;;  (20070 17255))
;;; Generated autoloads from elpa-to-submit/scpaste.el

(autoload 'scpaste "scpaste" "\
Paste the current buffer via `scp' to `scpaste-http-destination'.

\(fn ORIGINAL-NAME)" t nil)

(autoload 'scpaste-region "scpaste" "\
Paste the current region via `scpaste'.

\(fn NAME)" t nil)

;;;***

;;;### (autoloads (textile-mode) "textile-mode" "elpa-to-submit/textile-mode.el"
;;;;;;  (20070 17255))
;;; Generated autoloads from elpa-to-submit/textile-mode.el

(autoload 'textile-mode "textile-mode" "\
A major mode for editing textile files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

;;;***

;;;### (autoloads (tt-mode) "tt-mode" "elpa-to-submit/tt-mode.el"
;;;;;;  (20070 17255))
;;; Generated autoloads from elpa-to-submit/tt-mode.el

(autoload 'tt-mode "tt-mode" "\
Major mode for editing Template Toolkit files

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("elpa-to-submit/color-theme.el" "elpa-to-submit/eshell-vc.el"
;;;;;;  "elpa-to-submit/notify.el") (20070 17570 728068))
(autoload 'notify "nofify" "\
Something here

\(fn)" t nil)

;;;***

;;;***

(provide 'loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; loaddefs.el ends here
