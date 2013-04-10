;===============================================================================
;basic settings


(setq dotfiles-dir (file-name-directory
                   (or load-file-name (buffer-file-name))))
(setq pythonEmacsDir (concat dotfiles-dir "python/"))
(add-to-list `load-path pythonEmacsDir)
(load (concat pythonEmacsDir "mako-mode/mmm-mako.el"))
(add-to-list 'auto-mode-alist '("\\.mako\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.mako\\'" 'mako)


(load-file (concat pythonEmacsDir "emacs-for-python/epy-init.el"))
(require 'epy-setup) ;; It will setup other loads, it is required!
(require 'epy-python) ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing) ;; For configurations related to editing [optional]
(require 'epy-bindings) ;; For my suggested keybindings [optional]
;(epy-setup-checker (concat pythonEmacsDir "/pychecker.sh"))


(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list (concat pythonEmacsDir "flymake/pyflymake.py") (list local-file))))
      ;;     check path

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
(epy-setup-checker "flint %f")

(epy-django-snippets)
(epy-setup-ipython)
(add-to-list 'load-path (concat pythonEmacsDir "pony-mode/src/"))
(require 'pony-mode)

;;  (add-to-list `load-path (concat pythonEmacsDir  "/yasnippet-0.6.1c/"))
;;  ;(add-to-list `ac-dictionary-directories "~/.emacs.d/dict")
;;  (require `auto-complete-config)
;;  (ac-config-default)
;;  (require `yasnippet)
;;  (yas/initialize)
;;  (yas/load-directory (concat pythonEmacsDir "/yasnippet-0.6.1c/snippets"))
;;  (require `smart-operator)
;; ;; ;===============================================================================
;;  ;(require `auto-complete-config)

;;  (load-library "init_python")

;; ;; ;;Pony mode
(add-to-list `load-path (concat pythonEmacsDir "pony-mode/src"))
(require 'pony-mode)


(defun python--add-debug-highlight ()
  "Adds a highlighter for use by `python--pdb-breakpoint-string'"
  (highlight-lines-matching-regexp "## DEBUG ##\\s-*$" 'hi-red-b))
 
(add-hook 'python-mode-hook 'python--add-debug-highlight)
 
(defvar python--pdb-breakpoint-string "import ipdb; ipdb.set_trace() ## DEBUG ##"
  "Python breakpoint string used by `python-insert-breakpoint'")
 
(defun python-insert-breakpoint ()
  "Inserts a python breakpoint using `pdb'"
  (interactive)
  (back-to-indentation)
  ;; this preserves the correct indentation in case the line above
  ;; point is a nested block
  (split-line)
  (insert python--pdb-breakpoint-string))
(define-key python-mode-map (kbd "<f5>") 'python-insert-breakpoint)
 
(defadvice compile (before ad-compile-smart activate)
  "Advises `compile' so it sets the argument COMINT to t
if breakpoints are present in `python-mode' files"
  (when (derived-mode-p major-mode 'python-mode)
    (save-excursion
      (save-match-data
        (goto-char (point-min))
        (if (re-search-forward (concat "^\\s-*" python--pdb-breakpoint-string "$")
                               (point-max) t)
            ;; set COMINT argument to `t'.
            (ad-set-arg 1 t))))))

(add-hook 'python-mode-hook 'jedi:setup)
