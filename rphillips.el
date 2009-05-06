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

;; Org-Mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-hide-leading-stars      t
      org-odd-levels-only         t
      org-log-done t
      org-blank-before-new-entry '((heading         . t)
                                   (plain-list-item . nil)))
(setq org-agenda-files (list "~/Orgs/Home.org"
                             "~/Orgs/Notes.org"))

;; My Journal.
;; (org-remember-insinuate)
;; (setq org-remember-templates
;;       '(("Journal"
;;          ?j
;;          "* %U %? %^g\n\n   %x"
;;          "~/Orgs/Journal.org"
;;          'top)))

;; Follow git commit message best practices in Magit.
(add-hook 'magit-log-edit-mode-hook (lambda () (setq fill-column 72)))

;; stop cursor from blinking
(blink-cursor-mode nil)             

;;; Keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-xk" 'kill-current-buffer) ;; Kill without confirmation
(global-set-key "\M-l" 'goto-line)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
