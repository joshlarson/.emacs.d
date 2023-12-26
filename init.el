(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; Package Management

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(setq use-package-always-defer t)


;; Quality of Life

(global-display-line-numbers-mode)
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)
(use-package which-key
  :demand t
  :config
  (which-key-mode))


;; Language Stuff

(use-package eglot
  :hook ((elixir-ts-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '(elixir-ts-mode "~/.emacs.d/elixir-ls/release/language_server.sh"))
  )

(use-package elixir-ts-mode
  :config
  (add-hook 'elixir-ts-mode-hook (lambda () (add-hook 'before-save-hook 'eglot-format nil t))))


;; Tree Sitter grammar installation

(setq treesit-language-source-alist
      '((elixir . ("https://github.com/elixir-lang/tree-sitter-elixir.git" "main"))
        (heex . ("https://github.com/phoenixframework/tree-sitter-heex.git" "main"))
        ))

(dolist (entry treesit-language-source-alist)
  (let ((name (car entry)))
    (unless (treesit-language-available-p name)
      (treesit-install-language-grammar name))))

