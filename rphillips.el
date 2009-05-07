;;; 3rd-party libraries.

;; Store them in "vendor/".
(setq vendor-dir (concat dotfiles-dir "vendor/"))
(add-to-list 'load-path vendor-dir)

;; Disable Menubar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Anything.
(add-to-list 'load-path (concat vendor-dir "anything-config"))
(require 'anything-config)
(global-set-key (kbd "s-a") 'anything)

(require 'descbinds-anything)
(descbinds-anything-install)
(setq descbinds-anything-window-style 'same-window)

;; psvn.el.
(require 'psvn)

;; line numbers
(require 'linum)

;; twitter
(autoload 'twitter-get-friends-timeline "twitter" nil t)
(autoload 'twitter-status-edit "twitter" nil t)
(global-set-key "\C-xt" 'twitter-get-friends-timeline)
(add-hook 'twitter-status-edit-mode-hook 'longlines-mode)

;; Org-Mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-hide-leading-stars      t
      org-odd-levels-only         t
      org-log-done t
      org-blank-before-new-entry '((heading         . t)
                                   (plain-list-item . nil)))
(setq org-agenda-files (list "~/Orgs/Home.org"
                             "~/Orgs/Notes.org"))

;; yasnippet from elpa
;; (require 'yasnippet-bundle)

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

;; Color Theme
(color-theme-zenburn)

;; No tabs
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4);

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
(global-set-key (kbd "<M-return>") 'rphillips/toggle-fullscreen)
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)
(global-set-key "\C-cb" 'anything)

;;; Options
(setq inhibit-startup-message t) ;; Disable start up message
(setq search-highlight t) ;; Highlight search results
(setq backup-inhibited t) ;; Never backup
(setq line-number-mode 1) ;; Show line numbers
(setq-default indent-tabs-mode nil) ;; Use spaces for tabs
(setq visible-bell t) ;; Visable bells
(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'

;; Kill without confirmation
(defun kill-current-buffer ()
 "Kill the current buffer, without confirmation."
 (interactive)
 (kill-buffer (current-buffer)))

(defun rphillips/toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil
                       'fullscreen
                       (if (frame-parameter nil 'fullscreen)
                           nil
                         'fullboth)))

;; Apache Style
;; to use this style: C-c . apache
(c-add-style "apache"
 '((inclass . ++)
   (defun-block-intro . ++)
   (statement-block-intro . ++)
   (substatement . ++)
   (brace-list-intro . ++)
   (statement-case-intro . ++)
   (inextern-lang . 0)
  ))

;; Default C Style
(setq c-default-style "apache")

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
(defface hl-line '((t (:background "#222222"))) "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default
