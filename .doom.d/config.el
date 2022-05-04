;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Estifanos Beyene"
      user-mail-address "estifanosgetnet@gmail.com")

(setq org-directory "~Documents/org/")

;; dark themes
;; (setq doom-theme 'doom-vibrant
;; (setq doom-theme 'doom-one
(setq doom-theme 'doom-nord
;; light themes
;; (setq doom-theme 'doom-one-light
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
