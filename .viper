;;; S. Pradeep Kumar's .viper

(setq viper-expert-level '5)
(setq viper-inhibit-startup-message 't)
;;; '/' Search ignores case
(setq case-fold-search t)

;;; Can't live without auto-indent in any mode, be it text or source code
(setq-default viper-auto-indent t)

;;; Electrifies Viper
(setq-default viper-electric-mode t)
;;; Useful if you like to bang the ESC key
;; (setq-default viper-no-multiple-ESC t)

(setq viper-shift-width 4)

(setq viper-case-fold-search t) ; don't touch or else...
