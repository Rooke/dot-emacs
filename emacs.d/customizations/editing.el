;; editing.el --- Customizations relating to editing a buffer.
;;;; Commentary:
;; These are misc. changes to how Emacs behaves. Likely needs some TLC

;; Key binding to use "hippie expand" for text autocompletion
;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)

;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)


;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
;(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; fix weird os x kill error
(defun ns-get-pasteboard ()
  "Returns the value of the pasteboard, or nil for unsupported formats."
  (condition-case nil
      (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

(setq electric-indent-mode nil)

 ;; Mike's stuff ;;

(setq scroll-step 1)
(column-number-mode t)
(setq hscroll-step 1)
(setq scroll-conservatively 50)
(fringe-mode 1)
(setq sentence-end-double-space nil)


 ;;;;;;;;;; Key re-mappings ;;;;;;;;;;;;;;;;;


(global-set-key (kbd "C-<return>") 'newline)

(global-set-key (kbd "C-x C-j") 'gdb-many-windows)

(defalias 'gf 'grep-find)

(global-set-key (kbd "C-<tab>") `semantic-symref-symbol)

(define-key global-map "\C-k" 'kill-complete-line)
(global-set-key (kbd "C-;") 'kill-line)
;;(define-key global-map "\C-h" 'backward-delete-char)
(defun kill-complete-line ()
  "Kill the entire current line."
  (interactive)
  (beginning-of-line)
  (kill-line))



(setq outline-minor-mode-prefix "\C-o")

;; Avy
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-\"") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(avy-setup-default)

; 'Universal' (x.org) clipboard
(setq x-select-enable-clipboard t)
;;;;;;;;;;;;; End key remappings ;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;; Indentation setup ;;;;;;;;;;;;;;;;;;;;;;;;;

;Set tabs to display as 4 spaces:
(setq-default tab-width 4)

(setq-default bidi-display-reordering nil)

(when (require 'so-long nil :noerror)
  (so-long-enable))

(when (require 'so-long nil :noerror)
  (mapc (apply-partially 'add-to-list 'so-long-minor-modes)
        '(hl-sexp-mode diff-hl-mode diff-hl-amend-mode diff-hl-flydiff-mode
                       idle-highlight-mode rainbow-delimiters-mode grep-mode))
  (so-long-enable))

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
