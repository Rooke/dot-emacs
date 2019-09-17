(defun my-c-indent-setup()
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (setq inden-tabs-mode nil))

(add-hook 'c-mode-hook 'my-c-indent-setup)
(add-hook 'c++-mode-hook 'my-c-indent-setup)
(add-hook 'c++-mode-hook #'company-mode)

;; Compilation
(global-set-key (kbd "<f5>") 'compile)
(define-key global-map "\C-z" 'compile)
(setq compilation-window-height 8)
