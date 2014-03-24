(require 'cc-mode)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq vc-keep-workfiles nil)
(setq version-control (quote never))
(setq scroll-step 1)
(setq scroll-conservatively 50)
(setq scroll-preserve-screen-position nil)
(column-number-mode t)
;force spaces only, not tabs
(setq-default indent-tabs-mode nil)


;;;;;;;;;;;;;;;;; Grep mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(grep-compute-defaults)
(setq grep-find-command "find . ! -name \"cscope.out\" ! -name \"*~\" ! -name \"^.#\" -type f -print0 | xargs -0 grep -niH -e ")


;;;;;;;;;;;;;;;;; Set colours ;;;;;;;;;;;;;;;;;;;;;;;;;
(set-foreground-color "#dbdbdb")
(set-cursor-color "#ff0000")
(set-background-color "#000000")

 
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#dbdbdb" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "unknown" :family "Inconsolata"))))
 '(diff-added-face ((t (:foreground "green"))))
 '(diff-changed-face ((t (:foreground "yellow"))))
 '(diff-header-face ((t (:foreground "cyan"))))
 '(diff-hunk-header-face ((t (:foreground "magenta"))))
 '(diff-removed-face ((t (:foreground "red"))))
 '(font-lock-builtin-face ((t (:foreground "deepskyblue"))))
 '(font-lock-comment-face ((t (:foreground "gray60"))))
 '(font-lock-doc-face ((t (:foreground "darkkhaki"))))
 '(font-lock-function-name-face ((t (:foreground "green"))))
 '(font-lock-keyword-face ((t (:foreground "magenta"))))
 '(font-lock-string-face ((t (:foreground "gold"))))
 '(font-lock-type-face ((t (:foreground "cyan"))))
 '(font-lock-variable-name-face ((t (:foreground "yellow"))))
 '(mode-line ((t (:foreground "plum1" :background "navy"))))
 '(region ((t (:background "sienna")))))
 (put 'upcase-region 'disabled nil)
 
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t))
;;;;;;;;;;;;;;;;;;;;; End Set colours ;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;; Get rid of menus, and truncate long lines
(set-default 'truncate-lines t)
(tool-bar-mode -1)
(menu-bar-mode -1)

 ;;;;;;;;;; Key re-mappings ;;;;;;;;;;;;;;;;;

 (global-set-key [(f2)] 'grep-find) ; the F8 key
 (global-set-key (kbd "C-<return>") 'newline)

 (global-set-key (kbd "C-x C-j") 'gdb-many-windows)

 (defalias 'gf 'grep-find)

 (global-set-key (kbd "C-<tab>") `semantic-symref-symbol)

 ;; Bind M-<return> to re-sync autocomplete
 (global-set-key (kbd "M-<return>") 'shell-resync-dirs)

 (define-key global-map "\C-k" 'kill-complete-line)
 (global-set-key (kbd "C-;") 'kill-line)
 ;;(define-key global-map "\C-h" 'backward-delete-char)
 (defun kill-complete-line ()
   "Kill the entire current line."
   (interactive)
   (beginning-of-line)
   (kill-line))
;; Compilation
 (global-set-key (kbd "<f5>") 'compile)
 (define-key global-map "\C-z" 'compile)
 (setq compilation-window-height 8)

(setq outline-minor-mode-prefix "\C-o")

; 'Universal' (x.org) clipboard
(setq x-select-enable-clipboard t)
;;;;;;;;;;;;; End key remappings ;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;; Indentation setup ;;;;;;;;;;;;;;;;;;;;;;;;;

;Set tabs to display as 4 spaces:
(setq-default tab-width 4)

 (defun my-c-indent-setup()
   (setq c-basic-offset 4)
   (setq c-indent-level 4)
   (setq inden-tabs-mode nil))

 (defun my-awk-indent-setup()
   (setq awk-basic-offset 4)
   (setq awk-indent-level 4)
   (setq inden-tabs-mode nil))

(add-hook 'c-mode-hook 'my-c-indent-setup)
(add-hook 'awk-mode-hook 'my-awk-indent-setup)
(add-hook 'c++-mode-hook 'my-c-indent-setup)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;; 'Include' directories ;;;;;;;;;;;;;;;;;;;
(setq load-path (cons "~/.emacs.d/" load-path))
(setq load-path (cons "~/.emacs.d/cedet/lisp/cedet/" load-path))
(load-file "~/.emacs.d/cedet/lisp/cedet/cedet.el")
;(load "~/.emacs.d/haskell-mode-2.8.0/haskell-site-file")
(setq exec-path (cons "/opt/local/bin" exec-path))
(setq exec-path (cons "~/local/bin" exec-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;; External Add-ons ;;;;;;;;;;;;;;;;;;;;;
;purcell emacs.d
;(load-file "~/.emacs.d/init.el")

;;go stuff
(require 'go-mode-load)
;;git
(require 'git)
;; cscope
(require 'xcscope)
(setq cscope-display-cscope-buffer nil)
;; filladapt
(require 'filladapt)
(setq-default filladapt-mode t)
(add-hook 'c-mode-hook 'turn-on-filladapt-mode)
;; cedet
(require 'ecb)
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-gaudy-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu
;(semantic-load-enable-minimum-features)
;(global-set-key (kbd "C-<tab>") `semantic-symref-symbol)

;Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;Ruby
(setq rsense-home "~/.emacs.d/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;Popup
(add-to-list 'load-path "~/.emacs.d/popup-el/")
(require 'popup)

;Autocomplete
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict/")
(ac-config-default)

;Web Browswer
;(require 'w3m-e21)
(provide 'w3m-e23)
 (setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)
(setq w3m-use-cookies t)

;C# highlighting
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;Scheme
(setq scheme-program-name "snow")

;TRAMP
(setq tramp-default-method "ssh")

;Bash-completion
(autoload 'bash-completion-dynamic-complete 
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
  'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
  'bash-completion-dynamic-complete)

;Erlang
(setq load-path (cons "~/.emacs.d/erlang-otp/lib/tools/emacs/"
                      load-path))
(setq erlang-root-dir "~/.emacs.d/erlang-otp/")
(setq exec-path (cons "~/.emacs.d/erlang-otp/bin" exec-path))
(require 'erlang-start)
