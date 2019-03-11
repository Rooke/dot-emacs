(require 'rust-mode)
(require 'company-racer)

(setq company-racer-executable "~/.cargo/bin/racer")

(add-hook 'rust-mode-hook 'cargo-minor-mode)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook #'company-mode)

(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)


(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-racer))

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
