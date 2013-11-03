;; (require 'nrepl)
 
;; ;; Configure nrepl.el
;; (setq nrepl-hide-special-buffers t)
;; (setq nrepl-popup-stacktraces-in-repl t)
;; (setq nrepl-history-file "~/.nrepl-history")
 
;; ;; Some default eldoc facilities
;; (add-hook 'nrepl-connected-hook
;; (defun pnh-clojure-mode-eldoc-hook ()
;; (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
;; (nrepl-enable-on-existing-clojure-buffers)))
 
;; ;; Repl mode hook
;; (add-hook 'nrepl-mode-hook 'subword-mode)
 
;; ;; Auto completion for NREPL
;; (require 'ac-nrepl)
;; (eval-after-load "auto-complete"
;; '(add-to-list 'ac-modes 'nrepl-mode))
;; (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)

(unless (package-installed-p 'cider)
  (package-install 'cider))

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-tab-command 'indent-for-tab-command)
(setq cider-repl-display-in-current-window t)
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
