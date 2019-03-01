(elpy-enable)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot 1)

(add-hook 'python-mode-hook #'company-mode)
