sudo pip install epc ropemacs rope pyflakes pep8

(package-initialize)
;; check if the packages is installed; if not, install it.
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
           (package-install package))))
'(flycheck s dash ahg auctex bash-completion color-theme company durendal ecb ess expand-region jedi auto-complete epc ctable concurrent deferred lua-mode magit cl-lib nrepl clojure-mode paredit popup puppet-mode scala-mode scala-mode2 slime sml-mode sml-modeline tuareg caml undo-tree yasnippet-bundle))
