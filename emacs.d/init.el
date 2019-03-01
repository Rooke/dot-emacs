;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)

;;;;
;;; Code:
;;;;
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
;                    ("melpa" . "http://melpa.org/packages/")
		    ("melpa-stable" . "http://stable.melpa.org/packages/")
		    )
 package-archive-priorities '(("melpa-stable" . 1)))


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))


;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(
    paredit
    company
    clojure-mode
    cider
    clj-refactor
    ido-completing-read+
    smex
    csv-mode

    ;; For R
    ;ess

    ;; Scala
    scala-mode
    sbt-mode
    ensime
    projectile
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit
    js2-mode
    js2-closure
    js2-highlight-vars

    magit
    avy

    ;; typesciprt packages
    tss
    tide
    rust-mode
    elpy
    jedi
    company-jedi
    ))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/dev/tng")

(load "shell-integration.el")

;;p These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; Elisp
(load "elisp-editing.el")

;; Scala
(load "scala-editing.el")

;; Clojure
(load "setup-clojure.el")

;; Javascript
(load "setup-js.el")

;; Turn linenum off for certain major modes
(load "linum-off.el")

;; R indentation and no-wait
;(load "ess-indent.el")

;; Python
(load "setup-python.el")

;; Bash auto-complete
(load "bash-completion.el")
(require 'bash-completion)
(bash-completion-setup)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (company-jedi company company-anaconda jedi helm clojure-mode-extra-font-locking clojure-mode cider-eval-sexp-fu pyenv-mode elpy cargo editorconfig-custom-majormode rust-mode tss tide smex scala-mode2 rainbow-delimiters projectile paredit markdown-mode magit js2-highlight-vars js2-closure ensime csv-mode avy adaptive-wrap ac-php-core))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :family "Inconsolata")))))



