;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Estifanos Beyene"
      user-mail-address "estifanosgetnet@gmail.com")

(setq org-directory "~Documents/org/")

;; dark themes
;; (setq doom-theme 'doom-nord
(setq doom-theme 'doom-oceanic-next
;; light themes
;; (setq doom-theme 'doom-acario-light
;; (setq doom-theme 'doom-nord-light
      doom-font (font-spec :family "Comic Code Ligatures" :size 13)
      doom-variable-pitch-font (font-spec :family "Comic Code Ligatures" :size 14))
      ;; doom-font (font-spec :family "Hack" :size 14 :weight 'regular)
      ;; doom-variable-pitch-font (font-spec :family "Hack" :size 14 :weight 'regular))
;; line number like vim for jumping around
(setq display-line-numbers-type 'relative)

;; no exit promt in doom emacs
(setq confirm-kill-emacs nil)

;; wakatime settings
(use-package wakatime-mode
  :ensure t)
(global-wakatime-mode)

;; prettier
(require 'prettier)
;;
(require 'elcord)
(elcord-mode)


;; Implicit /g flag on evil ex substitution
(setq evil-ex-substitute-global t)

;; Prevents some cases of Emacs flickering.
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; :ui modeline
;; An evil mode indicator is redundant with cursor shape
(advice-add #'doom-modeline-segment--modals :override #'ignore)

;; normal list keybindings in org mode
(map! :map org-mode-map
      "S-RET"      #'+org/shift-return
      "C-RET"      #'+org/insert-item-below
      "C-S-RET"    #'+org/insert-item-above
      "C-M-RET"    #'org-insert-subheading
      [C-return]   #'+org/insert-item-below
      [C-S-return] #'+org/insert-item-above
      [C-M-return] #'org-insert-subheading)

;; fix for scheduled todo not showing up in agenda
(setq org-agenda-start-day nil)
