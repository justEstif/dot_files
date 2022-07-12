(setq doom-theme 'doom-nord)
;;(setq doom-theme 'doom-zenburn)

(setq display-line-numbers-type 'nil)

(setq doom-font (font-spec :family "Liga Ubuntu Mono" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Liga Ubuntu Mono" :size 16 :weight 'regular))

(setq scroll-margin 4)

(add-hook! org-mode (electric-indent-local-mode -1))

(setq org-src-fontify-natively t)

(cl-defmacro lsp-org-babel-enable (lang)
  "Support LANG in org source code block."
  (setq centaur-lsp 'lsp-mode)
  (cl-check-type lang stringp)
  (let* ((edit-pre (intern (format "org-babel-edit-prep:%s" lang)))
         (intern-pre (intern (format "lsp--%s" (symbol-name edit-pre)))))
    `(progn
       (defun ,intern-pre (info)
         (let ((file-name (->> info caddr (alist-get :file))))
           (unless file-name
             (setq file-name (make-temp-file "babel-lsp-")))
           (setq buffer-file-name file-name)
           (lsp-deferred)))
       (put ',intern-pre 'function-documentation
            (format "Enable lsp-mode in the buffer of org source block (%s)."
                    (upcase ,lang)))
       (if (fboundp ',edit-pre)
           (advice-add ',edit-pre :after ',intern-pre)
         (progn
           (defun ,edit-pre (info)
             (,intern-pre info))
           (put ',edit-pre 'function-documentation
                (format "Prepare local buffer environment for org source block (%s)."
                        (upcase ,lang))))))))
(defvar org-babel-lang-list
  '("js" "python"))
(dolist (lang org-babel-lang-list)
  (eval `(lsp-org-babel-enable ,lang)))

(custom-set-faces!
  '((org-block org-block-begin-line org-block-end-line) :background nil))

(require 'org-tempo)

(setq org-directory "/home/estifanos/Documents/org/")

;; (setq company-global-modes '(not org-mode))

(setq +zen-text-scale 0.8)

(setq evil-ex-substitute-global t)

(advice-add #'doom-modeline-segment--modals :override #'ignore)

(+global-word-wrap-mode +1)

(add-to-list '+word-wrap-disabled-modes 'vterm-mode)

(setq projectile-project-search-path '("~/Documents/"))

(after! projectile
  (setq projectile-project-root-files-bottom-up
        (remove ".git" projectile-project-root-files-bottom-up)))

(after! hl-todo
  (setq hl-todo-keyword-faces
      '(("TODO"   . "#FF0000")
        ("BUG"  . "#EF4444")
        ("FIXME"  . "#FB7185")
        ("DONE"  . "#60A5FA")
        ("GOTCHA"  . "#BEF264")
        ("NOTE"  . "#E879F9")
        ("REVIEW"  . "#A3E635"))))

(require 'magit-process nil t)

(setq doom-themes-treemacs-theme "doom-colors")

(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(setq deft-directory "/home/estifanos/Documents/org/zettelkasten/")

(setq deft-recursive t)

(setq deft-extensions '("org"))

(defun cm/deft-parse-title (file contents)
  (let ((begin (string-match "^#\\+[tT][iI][tT][lL][eE]: .*$" contents)))
    (if begin
        (string-trim (substring contents begin (match-end 0)) "#\\+[tT][iI][tT][lL][eE]: *" "[\n\t ]+")
      (deft-base-filename file))))
(advice-add 'deft-parse-title :override #'cm/deft-parse-title)

(setq deft-strip-summary-regexp
      (concat "\\("
              "[\n\t]"
      "\\|^#\\+[[:alpha:]_]+:.*$"
      "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
      "\\)"))

(setq user-full-name "Estifanos Beyene"
      user-mail-address "estifanosgetnet@gmail.com")

(setq auto-save-default t
      make-backup-files t)

(setq undo-limit 80000000)

(add-to-list 'default-frame-alist '(height . 100))
(add-to-list 'default-frame-alist '(width . 100))

(setq confirm-kill-emacs nil)

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(setq doom-scratch-initial-major-mode 'org-mode)

(map! :map org-mode-map
      "S-RET"      #'+org/shift-return
      "C-RET"      #'+org/insert-item-below
      "C-S-RET"    #'+org/insert-item-above
      "C-M-RET"    #'org-insert-subheading
      [C-return]   #'+org/insert-item-below
      [C-S-return] #'+org/insert-item-above
      [C-M-return] #'org-insert-subheading)

(map! :leader
      (:prefix-map ("d" . "do")
        (:desc "toggle company" "c" #'company-mode)
        (:desc "toggle dired dot files" "d" #'dired-hide-dotfiles-mode)
        (:desc "v-term" "t" #'vterm)
        (:desc "toggle zen mode" "z" #'olivetti-mode)))

(require 'olivetti)

(require 'activity-watch-mode)
(global-activity-watch-mode)

;; fontend for org-roam
(use-package! websocket
    :after org-roam)
(use-package! org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(use-package! org-pandoc-import :after org)

(use-package wakatime-mode
  :ensure t)
(global-wakatime-mode)

(add-hook 'dired-mode-hook #'dired-hide-dotfiles-mode)

(require 'dired-single)
(defun my-dired-init ()
  (define-key dired-mode-map [remap dired-find-file]
    'dired-single-buffer)
  (define-key dired-mode-map [remap dired-mouse-find-file-other-window]
    'dired-single-buffer-mouse)
  (define-key dired-mode-map [remap dired-up-directory]
    'dired-single-up-directory))
(if (boundp 'dired-mode-map)
    (my-dired-init)
  (add-hook 'dired-load-hook 'my-dired-init))

(use-package! lsp-tailwindcss)
