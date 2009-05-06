;;; 3rd-party libraries.

;; Store them in "vendor/".
(setq vendor-dir (concat dotfiles-dir "vendor/"))
(add-to-list 'load-path vendor-dir)

;; Anything.
(add-to-list 'load-path (concat vendor-dir "anything-config"))
(require 'anything-config)
(global-set-key (kbd "s-a") 'anything)

(require 'descbinds-anything)
(descbinds-anything-install)
(setq descbinds-anything-window-style 'same-window)

;; psvn.el.
(require 'psvn)
