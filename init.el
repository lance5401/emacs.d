(server-start)

(add-to-list 'load-path "~/.emacs.d")

; input method
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "S-SPC") 'set-mark-command)

;;
;; set up unicode
;;
;(set-language-environment   'Chinese-GBK)
(set-language-environment   'English)
(prefer-coding-system       'utf-8)
(setq-default default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
; MS Windows clipboard is UTF-16LE
(set-clipboard-coding-system 'utf-16le-dos)

; short yes no
(defalias 'yes-or-no-p 'y-or-n-p)

; show file path on window title
(setq frame-title-format "%n%F/%b")

; don't use VC
(setq vc-handled-backends nil)

; use clipboard for copy/paste
(setq x-select-enable-clipboard t)

;; Remove splash screen
(setq inhibit-splash-screen t)

;disable backup and auto save
(setq make-backup-files nil)			; Don't want any backup files
(setq auto-save-default nil)			; Don't want any auto saving
(setq auto-save-list-file-name nil)     ; Don't want any .saves files

; enable line and column numbering
(line-number-mode 1)
(column-number-mode 1)

; case sensitive
(setq-default case-fold-search nil)
(setq-default case-replace t)

; disable toolbar
(tool-bar-mode -1)

; highlight current line
(defface hl-line '((t (:background "grey95")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode 1)

; highlight matching parenthese
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
;(setq show-paren-style 'expression)

; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(global-set-key [M-left]  'windmove-left)       ; move to left windnow
(global-set-key [M-right] 'windmove-right)      ; move to right window
(global-set-key [M-up]    'windmove-up)         ; move to upper window
(global-set-key [M-down]  'windmove-down)       ; move to downer window

; trailing whitespaces
(setq-default show-trailing-whitespace t)
;(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key "\C-m" 'newline-and-indent)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
      '(("default"
         ("dired"       (mode . dired-mode))
         ("C"           (or (mode . c-mode)
                            (mode . c++-mode)))
         ("Javascript"  (mode . js-mode))
         ("Python"      (mode . python-mode))
         ("Elisp"       (mode . emacs-lisp-mode))
         ("Html"        (or(mode . html-mode)
                           (mode . nxhtml-mode)))
         ("css"         (mode . css-mode))
         ("Shell"       (or (mode . shell-mode)
                            (mode . eshell-mode)))
         ("Subversion"  (name . "\*svn"))
         ("Magit"       (name . "\*magit"))
         ("Org"         (or (mode . org-mode)
                            (filename . "OrgMode")))
         ("Help"        (or (name . "\*Help\*")
                            (name . "\*Apropos\*")
                            (name . "\*info\*"))))))
(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))

;; tabs
(global-set-key (kbd "<C-tab>") 'tab-to-tab-stop)
(setq-default tab-width 4)
(setq-default tab-stop-list (list 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108))
(setq-default indent-tabs-mode nil)

; cua mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;
; color theme
;
;(add-to-list 'load-path "~/.emacs.d/color-theme")
;(require 'color-theme)
;(color-theme-initialize)
;(eval-after-load "color-theme"
;  '(progn
;     (color-theme-initialize)
;     (color-theme-hober)))

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(add-to-list 'custom-theme-load-path "~/.emacs.d/zenburn-emacs/")
;(load-theme 'zenburn t)
;(load-theme 'wombat t)

; autopair
(add-to-list 'load-path "~/.emacs.d/autopair")
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

; icicles
;(add-to-list 'load-path "~/.emacs.d/icicles")
;(require 'icicles)

; evil mode
(add-to-list 'load-path "~/.emacs.d/evil-evil")
(require 'evil)
(evil-mode 1)

(add-to-list 'load-path "~/.emacs.d/evil-surround")
(require 'surround)
(global-surround-mode 1)

;; recentf stuff
(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq
  ;ido-save-directory-list-file "~/.emacs.d/cache/ido.last"

  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace" "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
  ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
  ido-case-fold  nil                 ; be case-sensitive

  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
  ido-max-work-file-list      50   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)

  ido-enable-flex-matching nil     ; don't try to be too smart
  ido-max-prospects 8              ; don't spam my minibuffer
  ido-confirm-unique-completion t) ; wait for RET, even with unique completion
;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

;; imenu
(defun try-to-add-imenu ()
 (condition-case nil (imenu-add-to-menubar "iMenu") (error nil)))
(add-hook 'font-lock-mode-hook 'try-to-add-imenu)
(setq imenu-sort-function 'imenu--sort-by-name)
(setq imenu-auto-scan t)
(setq imenu-max-items 32)

; auto-complete
(add-to-list 'load-path "~/.emacs.d/popup-el")
(add-to-list 'load-path "~/.emacs.d/fuzzy-el")
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)
(setq ac-ignore-case nil)
(define-key ac-completing-map [return] 'ac-complete) ; work with autopair

;; sr-speedbar
(require 'sr-speedbar)
(global-set-key (kbd "<f9>") 'sr-speedbar-toggle)
(setq sr-speedbar-width 30)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
;(setq speedbar-tag-hierarchy-method '(speedbar-simple-group-tag-hierarchy) )
(setq speedbar-tag-hierarchy-method '(speedbar-sort-tag-hierarchy) )

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; dired
(require 'dired+)
(toggle-diredp-find-file-reuse-dir 1)
; list directories before files in dired
(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))
(defadvice dired-readin
  (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))
; don't create new buffer when use "^"
(eval-after-load "dired+"
  ;; don't remove `other-window', the caller expects it to be there
  '(defun dired-up-directory (&optional other-window)
     "Run Dired on parent directory of current directory."
     (interactive "P")
     (let* ((dir (dired-current-directory))
	    (orig (current-buffer))
	    (up (file-name-directory (directory-file-name dir))))
       (or (dired-goto-file (directory-file-name dir))
	   ;; Only try dired-goto-subdir if buffer has more than one dir.
	   (and (cdr dired-subdir-alist)
		(dired-goto-subdir up))
	   (progn
	     (kill-buffer orig)
	     (dired up)
	     (dired-goto-file dir))))))

; js2-mode
(add-to-list 'load-path "~/.emacs.d/js2-mode/")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(eval-after-load 'js2-mode
  '(progn
     (require 'js2-imenu-extras)
     (js2-imenu-extras-setup)))

; yasnippet
;(add-to-list 'load-path "~/.emacs.d/yasnippet/")
;(require 'yasnippet)
;(yas-global-mode 1)

; nxhtml
(load "~/.emacs.d/nxhtml/autostart.el")

;; magit
;(add-to-list 'load-path "~/.emacs.d/magit")
;(require 'magit)
;(require 'magit-svn)

;; ibus
(add-to-list 'load-path "~/.emacs.d/ibus-el")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(setq ibus-cursor-color '("red" "blue" "limegreen"))
