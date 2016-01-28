;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;;;;;;;;;;;;;;;;; Grep mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(grep-compute-defaults)
(setq grep-find-command "find . ! -name \"cscope.out\" ! -name \"*~\" ! -name \"^.#\" -type f -print0 | xargs -0 grep -niH -e ")
