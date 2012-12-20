;; Load the ensime lisp code...
(setq dotfiles-dir (file-name-directory
                   (or load-file-name (buffer-file-name))))
(add-to-list 'load-path (concat dotfiles-dir "ensime/elisp/"))
(require 'ensime)
(require 'scala-mode2)
;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
