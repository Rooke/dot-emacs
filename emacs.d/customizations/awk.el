(defun my-awk-indent-setup()
  (setq awk-basic-offset 4)
  (setq awk-indent-level 4)
  (setq inden-tabs-mode nil))

(add-hook 'awk-mode-hook 'my-awk-indent-setup)
