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


;; Magit

(setq magit-define-global-key-bindings 'recommended)
(use-package magit)


;; Language Stuff

(use-package eglot
  :hook ((elixir-ts-mode . eglot-ensure)
	 (typescript-ts-mode . eglot-ensure)
	 (tsx-ts-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs '(elixir-ts-mode "~/.emacs.d/elixir-ls/release/language_server.sh"))
  )

(use-package mix)

(use-package elixir-ts-mode
  :config
  (add-hook 'elixir-ts-mode-hook (lambda () (add-hook 'before-save-hook 'eglot-format nil t)))
  (add-hook 'elixir-ts-mode-hook 'mix-minor-mode)
  (add-hook 'elixir-ts-mode-hook 'hs-minor-mode))

(use-package add-node-modules-path
  :config
  (setq add-node-modules-path-command '("echo \"$(npm root)/.bin\""))
  :hook ((typescript-ts-mode . add-node-modules-path)
	 (tsx-ts-mode . add-node-modules-path)))

(require 'typescript-ts-mode)
(add-hook 'typescript-ts-mode-hook 'hs-minor-mode)

(use-package prettier-js
  :hook ((typescript-ts-mode . prettier-js-mode)
	 (tsx-ts-mode . prettier-js-mode)))

(use-package jest-test-mode 
  :ensure t 
  :commands jest-test-mode
  :hook (typescript-mode js-mode typescript-ts-mode tsx-ts-mode))

(use-package markdown-mode)


;; Tree Sitter grammar installation

(setq treesit-language-source-alist
      '((elixir . ("https://github.com/elixir-lang/tree-sitter-elixir.git" "main"))
        (heex . ("https://github.com/phoenixframework/tree-sitter-heex.git" "main"))
        (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript.git" "master" "typescript/src"))
        (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript.git" "master" "tsx/src"))
        ))

(dolist (entry treesit-language-source-alist)
  (let ((name (car entry)))
    (unless (treesit-language-available-p name)
      (treesit-install-language-grammar name))))


;; Terraform

(use-package terraform-mode)


;; Dockerfile

(use-package dockerfile-mode)


;; YAML

(use-package yaml-mode)
