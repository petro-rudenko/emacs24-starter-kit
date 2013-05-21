(setq stack-trace-on-error t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-auto-activate t)
 '(ecb-layout-name "left3")
 '(ecb-options-version "2.40")
 '(ecb-process-non-semantic-files t)
 '(ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(elc\\|obj\\|o\\|pyc\\|class\\|lib\\|dll\\|a\\|so\\|cache\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))))
 '(ecb-sources-exclude-cvsignore nil)
 '(ecb-tip-of-the-day nil)
 '(ecb-windows-width 0.2)
 '(erc-notice-highlight-type nil)
 '(inhibit-startup-screen t)
 '(scroll-bar-mode (quote right)))

(fset 'yes-or-no-p 'y-or-n-p)
(setq file-name-coding-system 'utf-8)

(custom-set-variables
 '(icomplete-mode t))

;;Line number column
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-linum-mode)

(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))
(setq browse-url-generic-program (executable-find "google-chrome")
browse-url-browser-function 'browse-url-generic)

(require 'color-theme-gruber-darker)
(color-theme-gruber-darker)
(starter-kit-load "python")
(starter-kit-load "scala")
(desktop-save-mode 0)
(global-undo-tree-mode)

(defun temp-buf ()
  (interactive)
  (switch-to-buffer (make-temp-name "scratch")))

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(add-hook 'after-init-hook #'global-flycheck-modes)
(load  "python/mako-mode/mmm-mako.el")
(add-to-list 'auto-mode-alist '("\\.mako\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.mako\\'" 'mako)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(tool-bar-mode -1)
(add-hook 'after-init-hook 'global-company-mode)
;(set-face-background 'hl-line "#056900")
