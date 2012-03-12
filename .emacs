;;; SPK's .emacs

;;{{{ Custom

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "k&r"))))
 '(ecb-options-version "2.40")
 '(eshell-cmpl-ignore-case t)
 '(org-hide-leading-stars t)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)

 ;; <2011-10-15 Sat> Had to set this here cos Vimpulse sets it to the
 ;; default value (nil) AFTER .emacs is loaded. I guess Custom does it
 ;; later or overrides it.
 '(viper-ESC-moves-cursor-back t))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "k&r"))))
;;  '(eshell-cmpl-ignore-case t)
;;  '(org-hide-leading-stars t)
;;  '(read-buffer-completion-ignore-case t)
;;  '(read-file-name-completion-ignore-case t)
;;  '(save-place t nil (saveplace))
;;  '(scroll-bar-mode nil)
;;  '(show-paren-mode t)
;;  '(tool-bar-mode nil)
;;  '(tooltip-mode nil))

;;}}}

;;{{{ Global Stuff

;;{{{ Settings

;;; <2011-10-19 Wed> 

(require 'cl)

(defun current-location ()
  "Return current location.
Possible values of location - 'home', 'iit', 'other'."
  (interactive)
  (cond ((equal system-name "pradeep-laptop")
	 'home)
	((and (not (equal system-name "pradeep-laptop"))
	      (equal system-type 'gnu/linux))
	 'iit)
	(t 'other)))

;;; Add .emacs.d to the load-path
(case (current-location)
  ('home (progn
	   (add-to-list 'load-path "/home/pradeep/.emacs.d/")
	   (add-to-list 'load-path "/home/pradeep/.emacs.d/elisp/")))
  ('iit (add-to-list 'load-path "/home/spradeep/.emacs.d/")))

;; Change the yes-or-no prompt to y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Inhibit the splash screen
(setq inhibit-splash-screen t)

;; Dynamic Abbreviation - Make search case sensitive - <2010-12-05 Sun>
(setq dabbrev-case-fold-search nil)

;; Save Emacs session - Confusing!
;; (desktop-save-mode 1)
;; (cd "~/.emacs.d/desktop-saves/")

;; Confirm before exit
(setq confirm-kill-emacs 'yes-or-no-p)

;; Set language environment
(set-language-environment "English")

;; Winner Mode - Undo / Redo window configurations
(winner-mode 1)

(savehist-mode 1)

;;; Enable commands within minibuffer - <2011-10-26 Wed> 
(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode 1)

(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;; Makes Emacs put killed and yanked (or yanked and pasted) text into
;;; the clipboard
(setq x-select-enable-clipboard t)

;;; Unbind C-h h (irritating languages popup) - <2011-09-22 Thu> 
(global-unset-key (kbd "C-h h"))

;;; Save my place in each file - <2011-10-10 Mon> 
(setq-default save-place t)
(require 'saveplace)

;;{{{ Menu-bar Toggling

;;; <2011-10-10 Mon> 
(global-set-key (kbd "<C-f9>") 'menu-bar-mode)

;;}}}

;;}}}

;;{{{ Color Themes

;;COLOR Themes stuff
 
(defun my-home-color-theme-initialize ()
  "Initialize color themes package and load theme for laptop"
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/")
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/")

  (require 'color-theme)
  (color-theme-initialize)
  ;; (load-file "~/.emacs.d/themes/color-theme-blackboard.el")
  ;; (color-theme-blackboard)
  ;; (add-to-list 'load-path "~/.emacs.d/themes/")
  ;; (load-file "~/.emacs.d/themes/color-theme-zenburn.el")
  ;; (color-theme-zenburn)
  (load-file "~/.emacs.d/themes/color-theme-wombat.el")
  (color-theme-wombat)
  (load-file "~/.emacs.d/themes/color-theme-tangotango.el")
  (color-theme-tangotango)
  ;; (load-file "~/.emacs.d/themes/color-theme-desert.el")
  ;; (color-theme-desert)
  ;; (load-file "~/.emacs.d/themes/color-theme-active.el")
  ;; (color-theme-active)
  ;; (load-file "~/.emacs.d/themes/color-theme-colorful-obsolescence.el")
  ;; (color-theme-colorful-obsolescence)

  ;; (color-theme-aalto-light)
  ;; (eval-after-load "color-theme"
  ;;   '(progn
  ;;      (color-theme-initialize)
  ;;      (color-theme-dark-laptop)))
  )

(defun my-iit-color-theme-initialize ()
  (add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
  (require 'color-theme)

  ;; (color-theme-aalto-light)
  ;; (color-theme-dark-laptop)
  ;; (load-file "~/.emacs.d/color-theme-6.6.0/themes/zenburn.el")
  ;; (load-file "~/.emacs.d/color-theme-6.6.0/themes/desert.el")
  ;; (load-file "~/.emacs.d/color-theme-6.6.0/themes/wombat.el")
  (load-file "~/.emacs.d/themes/color-theme-wombat.el")
  (color-theme-wombat)
  (load-file "~/.emacs.d/themes/color-theme-tangotango.el")
  (load-file "~/.emacs.d/folding.el"))

(case (current-location)
  ('home (my-home-color-theme-initialize))
  ('iit (my-iit-color-theme-initialize)))

;;}}}

;;{{{ Switching!!

;; Set Icomplete mode on
(icomplete-mode 1)

;; Set ido-mode on
(ido-mode 1)

;; Pain... Increased the amount of typing...
(setq ido-enable-flex-matching t)

;;; <2011-10-26 Wed> 
(setq ido-create-new-buffer 'always)

;; Toggle iswitchb-mode on
;; (iswitchb-mode)
;; Note : I have set read-file-name-complete-ignore-case to non-nil
;; Note : I have set read-buffer-completion-ignore-case to non-nil

;; Set Ibuffer mode as default
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;;; Sort by major mode in Ibuffer - <2011-05-15 Sun> 
(setq ibuffer-default-sorting-mode 'major-mode)

;; Ido power-up for imenu selection
(autoload 'idomenu "idomenu" nil t)
(global-set-key (kbd "M-i") 'idomenu)

;;}}}

;;{{{ Font

(case (current-location)
  ('home (set-default-font "Inconsolata:Medium"))
  ;; ((set-default-font "Inconsolata:Medium")
  (t (set-default-font "DejaVu Sans Mono-10")
     ;; (set-default-font "-Misc-Fixed-Medium-R-Normal--20-200-75-75-C-100-ISO8859-1")
     ))

;;}}}

;;}}}

;;{{{ Vimpulse

;;{{{ Vimpulse settings

;; Vimpulse - addition to Viper mode to add Vim functionality
(require 'vimpulse)

;;; Make M-h my ESC key
(global-set-key (kbd "M-h") 'viper-intercept-ESC-key)

;; ;;; Doesn't work (when I restart)
;; (setq-default viper-ESC-moves-cursor-back nil) ;<2010-12-16 Thu>
(setq vimpulse-want-change-undo nil)

(require 'evil-numbers)
;;; <2011-09-16 Fri> 
(vimpulse-map "zu" 'evil-numbers/inc-at-pt)
(vimpulse-map "zd" 'evil-numbers/dec-at-pt)

;;}}}

;;{{{ Other Window Stuff

;;; BIG ERROR : If I terminate func (during
;;; other-window-display-buffer, not find-file, though - since ido
;;; handles that) by pressing C-g, point is left in the other window -
;;; <2011-10-06 Thu>

;;; C-g : During execution of Lisp code, this character causes a quit
;;; directly. No go, I guess.

(defun other-window-do (func &rest arglist)
  "Execute func in other window and return to original window.

'apply' is used instead of 'funcall' because if no arguments are
passed, arglist will be nil and so calling 'apply' on 'func' will
simply not pass it any arguments. (This cannot be done with funcall)

Else, it will pass the elements of arglist (even if it is 'nil', as in
the case of viper-scroll-up, etc.) to the func."

  ;; Window selection is used because point goes to a different window
  ;; if more than 2 windows are present
  (let ((win-curr (selected-window))
	(win-other (next-window)))
    (select-window (next-window))
    (apply func arglist)
    (select-window win-curr)))

(defun other-window-scroll-up ()
  "Go down by half a page (I know it says up)"
  (interactive)
  (other-window-do 'viper-scroll-up nil))

(defun other-window-scroll-down ()
  "Go up by half a page (I know it says down)"
  (interactive)
  (other-window-do 'viper-scroll-down nil))

;; Seriously, make this prompt you
(defun other-window-kill-buffer ()
  "Kill the buffer in the other window"
  (interactive)
  (other-window-do 'kill-this-buffer))

(defun other-window-bury-buffer ()
  "Bury the buffer in the other window."
  (interactive)
  (other-window-do 'bury-buffer))



;;; FIXED (I think) - <2011-09-28 Wed> 
;; TODO : Make it appear even if it is already being displayed
;; elsewhere
;; TODO - Have an 
;;; Make it display in the other window no matter what
;;; Currently doesn't work for shell buffers, info, etc. at times

(defun other-window-display-buffer (&optional buffer-or-name)
  "Display buffer in other window"
  (interactive)
  (progn
    ;; If this is the only window, create another one
    (if (= (length (window-list)) 1)
	(split-window-horizontally))
    ;; Switch to buffer in the other window
    (if buffer-or-name
	(other-window-do (lambda ()
			   (switch-to-buffer buffer-or-name)))
      (other-window-do 'ido-switch-buffer))))


(defun other-window-find-file ()
  "Find file in other window"
  (interactive)
  (ido-find-file-other-window))

(defun other-window-info-root ()
  "Info in other window"
  (interactive)
  (info-other-window))

(defun other-window-info-emacs-manual ()
  "Emacs Manual (Info) in other window"
  (interactive)
  (other-window-do 'info-emacs-manual))

(defun other-window-woman ()
  "Open WoMan for topic at point (if any) in other window."
  (interactive)
  (other-window-do 'woman))

(defun other-window-man ()
  "Open man in other window for topic at point (if any)."
  (interactive)
  ())

(defun other-window-shell-and-go (&optional arg)
  "Open a shell (in current buffer's directory) in the other window and go there.

If no arg is passed, open the bash shell in ansi-term.
Else, open eshell."

  (interactive "P")
  (let ((old-buffer (current-buffer))
	;; This is done to get it set to current buffer's directory
	;; instead of the directory of the other window's buffer
	(new-buffer (if arg
			(eshell)
		      (ansi-term "/bin/bash"))))
    ;; Set current window's buffer back to the old-buffer
    (set-window-buffer (selected-window) old-buffer)
    ;; Set the other window's buffer as the new shell buffer
    (other-window-display-buffer new-buffer)
    ;; Go there
    (select-window (next-window))))

;;; Hmmm... Now that I'm using ido-switch-buffer with other-window-do,
;;; this doesn't seem to be a problem anymore. It was a problem when I
;;; used ido-switch-buffer-other-window

;;; TODO : Do something about this
;;; This is the reason why you've been pained so often for so long!!
;; (setq same-window-buffer-names '( "*mail*" "*inferior-lisp*" "*ielm*" ))

;; ("*eshell*"
;;  "*Python*"
;;  "*shell*"
;;  "*mail*"
;;  "*inferior-lisp*"
;;  "*ielm*"
;;  "*scheme*")
;; same-window-regexps

;; ("\\*rsh-[^-]*\\*\\(\\|<[0-9]*>\\)"
;;  "\\*telnet-.*\\*\\(\\|<[0-9]+>\\)"
;;  "^\\*rlogin-.*\\*\\(\\|<[0-9]+>\\)"
;;  "\\*info\\*\\(\\|<[0-9]+>\\)"
;;  "\\*gud-.*\\*\\(\\|<[0-9]+>\\)"
;;  "\\`\\*Customiz.*\\*\\'")

(defun swap-buffers-in-windows ()
  "Swap buffers in this window and the next"

  ;; Date : <2011-04-09 Sat>

  ;; Use window-buffer to get buffer in next window
  ;; Get buffer in current window
  ;; Use set-window-buffer
  ;; Use selected-window

  (interactive)
  (let ((win-curr (selected-window))
	(win-other (next-window))
	(buff-curr (current-buffer))
	(buff-other (window-buffer (next-window))))
    (set-window-buffer win-curr buff-other)
    (set-window-buffer win-other buff-curr)
    (select-window win-other)))

;;}}}

;;{{{ Gen functions

(defun my-join-line ()
  "Join previous line to this line"
  (interactive)
  (join-line 1))

(defun my-move-beginning-next-defun (&optional arg)
  "Move down to the beginning of a defun.
Move down arg defuns, if arg is provided."
  (interactive "p")
  (beginning-of-defun (- arg)))

(defun my-move-end-previous-defun (&optional arg)
  "Move down to the beginning of a defun.
Move down arg defuns, if arg is provided."
  (interactive "p")
  (end-of-defun (- arg)))

(defun my-open-line (arg)
  "Open a new line below current line"
  (interactive "P")
  (save-excursion
    (end-of-line)
    (if arg 
	(open-line arg)
      (open-line 1))))

(defun my-Open-line (arg)
  "Open a new line above current line"
  (interactive "P")
  (save-excursion
    (beginning-of-line)
    (if arg 
	(open-line arg)
      (open-line 1))))

(defun my-insert-curr-date (arg) 
  "Insert the current date - Org Mode style (with a ' - ' prefix).

No prefix if arg is passed."
  (interactive "P")
  ;; Arguments - Time, something, something, Prefix string
  (org-insert-time-stamp (current-time) nil nil (if (not arg)
						    ""
						  "- ")))
(defun my-indent-defun ()
  "Indent the function point is in."
  (interactive)
  (save-excursion
    (mark-defun)
    (vimpulse-indent (point) (mark))))

(defun my-backward-capitalize-word (&optional arg)
  "Capitalize arg words before point. By default, capitalize one word."
  (interactive "P")
  (capitalize-word (if arg
		       (- arg)
		     -1)))

(defun my-backward-upcase-word (&optional arg)
  "Upcase arg words before point. By default, upcase one word."
  (interactive "P")
  (upcase-word (if arg
		       (- arg)
		     -1)))

;;}}}

;;{{{ My Keybindings

;;{{{ Single-key bindings

(vimpulse-map (kbd "J") 'my-join-line)
;;; <2011-10-15 Sat> 
(vimpulse-map (kbd "K") 'other-window-woman)
;;; <2012-02-15 Wed>
(vimpulse-map (kbd "Q") 'query-replace-regexp)

;;}}}

;;{{{ Function Block based movement

;;; Cool!!! 
(vimpulse-map (kbd "] P") 'vimpulse-Put-and-indent)
(vimpulse-map (kbd "] p") 'vimpulse-put-and-indent)
(vimpulse-map (kbd "] [") 'end-of-defun)
(vimpulse-map (kbd "[ ]") 'my-move-end-previous-defun)
(vimpulse-map (kbd "[ [") 'beginning-of-defun)
(vimpulse-map (kbd "] ]") 'my-move-beginning-next-defun)

;;}}}

;;{{{ Extended g mapping

(vimpulse-map (kbd "g K") 'man)
(vimpulse-map (kbd "g l") 'delete-blank-lines)
(vimpulse-map (kbd "g c") 'comment-dwim)
(vimpulse-map (kbd "g O") 'my-Open-line)
(vimpulse-map (kbd "g o") 'my-open-line)
(vimpulse-map (kbd "g n") 'my-Open-line)
(vimpulse-map (kbd "g m") 'compile)

;;; This seems to cause every other unbound keybinding with prefix g
;;; to get bound to just-one-space - <2011-12-05 Mon>
;; (vimpulse-map (kbd "g  SPC") 'just-one-space)

;; This prevents me from using g in Dired, etc.
;; (vimpulse-global-set-key 'vi-state (kbd "g SPC") 'just-one-space)

(vimpulse-map (kbd "g s f") 'reposition-window)

;;; <2011-05-11 Wed>
(vimpulse-map (kbd "g =") 'my-indent-defun)

(vimpulse-map (kbd "g e p") 'eval-print-last-sexp)
(vimpulse-map (kbd "g e r") 'eval-region)

;;; <2011-05-11 Wed>
(vimpulse-map (kbd "g p d") 'my-insert-curr-date)
;;; Have it kill Calendar?
(vimpulse-map (kbd "g p t") 'org-time-stamp)
(vimpulse-map (kbd "g p T") 'my-insert-name-as-title)

(vimpulse-map (kbd "g s d") 'pwd)
(vimpulse-map (kbd "g r p") 'delete-pair)
;;; <2011-10-12 Wed> 
(vimpulse-map (kbd "g r b") 'rename-buffer)
;; (vimpulse-map (kbd "g r c") 'recompile)
;;; <2012-02-14 Tue>
(vimpulse-map (kbd "g r c") 'my-recompile)
(vimpulse-map (kbd "g x e") 'eshell)
(vimpulse-map (kbd "g x a") 'ansi-term)
(vimpulse-map (kbd "g x E") 'ediff-buffers)
(vimpulse-map (kbd "g x R") 'revert-buffer)
;;; Bury Buffer - <2011-04-30 Sat>
;;; Perhaps have it save the buffer before burying ?
(vimpulse-map (kbd "g x b") 'bury-buffer)
(vimpulse-map (kbd "g x l") 'locate)
(vimpulse-map (kbd "g x m") 'man)

;;}}}

;;{{{ General Meta and Control bindings

;; Maybe have something to play the second and third previous destructive command
(vimpulse-map (kbd "M-p") 'viper-prev-destructive-command)
;; TODO
(vimpulse-map (kbd "M-n") 'viper-next-destructive-command)

;;; <2011-04-11 Mon> 
;; TODO - Giving me an error
;; (global-set-key (kbd "M-m") 'complete-symbol)
(global-set-key (kbd "M-m") 'semantic-ia-complete-symbol)

;;; <2011-05-11 Wed>
(vimpulse-imap "\C-t" 'completion-at-point)

;;; <2011-05-19 Thu> 
(global-set-key (kbd "M-p") 'my-backward-capitalize-word)

;;; <2012-03-11 Sun> 
(global-set-key (kbd "M-C") 'my-backward-upcase-word)

;;}}}

;;{{{ Important Vimpulse modifications

;;; Make Vimpulse more like Vim in Normal mode and more like Emacs in
;;; Insert mode.

;;; <2011-04-02 Sat>
(define-key viper-vi-basic-map "\C-u" 'viper-scroll-down)

;;; To free up C-d for forward-delete - <2011-05-19 Thu> (?)
(vimpulse-imap (kbd "C-d") nil)

;;; Doesn't work!!!
;; ;;; <2011-09-29 Thu> 
;; (setq-default vimpulse-want-C-u-like-Vim t)

;;; <2011-09-29 Thu> 
(setq-default vimpulse-want-C-i-like-Vim nil)

;;; Didn't work!
;; (define-key viper-insert-basic-map "\C-h" 'viper-del-backward-char-in-insert)

;;; From Viper Docs - <2011-08-30 Tue>    
;;; Help won't be accessible via C-h prefix in Insert mode. FIX IT!
;;; EDIT : You can use <F1> as a replacement for the C-h prefix
(define-key viper-insert-global-user-map "\C-h" 'viper-del-backward-char-in-insert)

;;; <2012-02-18 Sat> - I ALWAYS want case-insensitive search. Don't
;;; ask me for it again. Dunno if this will prevent case-sensitivity
;;; from being changed without my knowledge again, though.
(define-key viper-vi-basic-map "\C-c/" nil)

;;}}}

;;{{{ Visual Map keybindings

;;; So that I can use Middle-Click to paste it elsewhere
(vimpulse-vmap "Y" 'clipboard-kill-ring-save)

;;}}}

;;{{{ Skeleton Pair matching

(setq skeleton-pair t)
;;; Find a better way to do this. Should you just create a list of
;;; matching characters?

;;; Sometimes I want a trigger for a pair of characters that is
;;; different from the character being inserted.

;;; This is only for visual mode enclosing of a region with a pair
(vimpulse-vmap "'" 'skeleton-pair-insert-maybe)
;;; This clashes with Register reading / writing
(vimpulse-vmap "\"" 'skeleton-pair-insert-maybe)
;;; Note : This clashes with shift-left
;; (vimpulse-vmap "<" 'skeleton-pair-insert-maybe)

;;; Note : This clashes with viper-backward-sentence. Somehow, map this to b/B or something
(vimpulse-vmap "(" 'skeleton-pair-insert-maybe)
(vimpulse-vmap "{" 'skeleton-pair-insert-maybe)
(vimpulse-vmap "[" 'skeleton-pair-insert-maybe)
;;; Mainly for org-mode *bold*ing :-)
(vimpulse-vmap "*" 'skeleton-pair-insert-maybe)
(vimpulse-vmap "C" 'capitalize-region)
;;; To compensate for " being used by skeleton-pair-insert
(vimpulse-vmap "R" 'vimpulse-read-register)

;;}}}

;;{{{ Window map keybindings

(define-key vimpulse-window-map "Q" 'other-window-kill-buffer)
(define-key vimpulse-window-map "\C-d" 'other-window-scroll-up)
(define-key vimpulse-window-map "\C-u" 'other-window-scroll-down)
(define-key vimpulse-window-map "o" 'other-window-display-buffer)

;;; Omit mode doesn't work when I do C-x 4 C-j or C-w J
;;; Edit : It works some of the time
(define-key vimpulse-window-map "J" 'dired-jump-other-window)
(define-key vimpulse-window-map "f" 'other-window-find-file)
(define-key vimpulse-window-map "i" 'other-window-info-root)
(define-key vimpulse-window-map "r" 'other-window-info-emacs-manual)
(define-key vimpulse-window-map "n" 'swap-buffers-in-windows)

;;; Disable the C-w w, C-w C-w keys.
;;; They were getting in the way of C-w o, etc. - <2011-10-06 Thu>
(define-key vimpulse-window-map (kbd "w") nil)
(define-key vimpulse-window-map (kbd "C-w") nil)

;;; Easier ways to scroll the other window up and down - <2012-01-21 Sat>
(global-set-key (kbd "C-<down>") 'other-window-scroll-up)
(global-set-key (kbd "C-<up>") 'other-window-scroll-down)


;;}}}

;;{{{ Keypad keys

;;; /
(global-set-key (kbd "<kp-divide>") 'jabber-connect)
(global-set-key (kbd "C-<kp-divide>") 'jabber-switch-to-roster-buffer)
(global-set-key (kbd "M-<kp-divide>") 'jabber-disconnect)

;;; *
(global-set-key (kbd "<kp-multiply>") 'gnus)
(global-set-key (kbd "C-<kp-multiply>") 'gnus-group-get-new-news)
(global-set-key (kbd "M-<kp-multiply>") 'gnus-group-exit)

;;; -
(global-set-key (kbd "C-<kp-subtract>") 'bury-buffer)
(global-set-key (kbd "C-c C-<kp-subtract>") 'other-window-bury-buffer)
;;; <2011-10-02 Sun> 
(define-key vimpulse-window-map "-" 'other-window-bury-buffer)
(global-set-key (kbd "M-<kp-subtract>") 'text-scale-decrease)

;;; +
(global-set-key (kbd "M-<kp-add>") 'text-scale-increase)

;;; 1 key
(global-set-key (kbd "C-<kp-end>") 'x-clipboard-yank)

;;; 5 key
(global-set-key (kbd "C-<kp-begin>") 'ansi-term)
(global-set-key (kbd "M-<kp-begin>") 'other-window-shell-and-go)

;;; 9 key
(global-set-key (kbd "C-<kp-prior>") 'grep-find)
(global-set-key (kbd "M-<kp-prior>") 'find-grep-dired)

(global-set-key (kbd "C-<kp-left>") 'winner-undo)
(global-set-key (kbd "C-<kp-right>") 'winner-redo)

(global-set-key (kbd "M-<kp-left>") 'windmove-left)
(global-set-key (kbd "M-<kp-right>") 'windmove-right)
(global-set-key (kbd "M-<kp-up>") 'windmove-up)
(global-set-key (kbd "M-<kp-down>") 'windmove-down)

;; Keypad Home key
(global-set-key (kbd "C-<kp-home>") 'rename-buffer)

;;; Keypad Enter key
(global-set-key (kbd "M-<kp-enter>") 'w3m-external-view-this-url)

;;}}}

;;{{{ Windmove bindings

(global-set-key (kbd "M-H") 'windmove-left)
(global-set-key (kbd "M-L") 'windmove-right)
(global-set-key (kbd "M-K") 'windmove-up)
(global-set-key (kbd "M-J") 'windmove-down)

;;}}}

;;{{{ Goddamn unwanted Help Keys

;;; Disable some unwanted Help keys.
;;; They kept getting in the way - <2011-10-06 Thu>

(global-set-key (kbd "C-h C-a") nil)	
(global-set-key (kbd "C-h C-c") nil)	
(global-set-key (kbd "C-h C-d") nil)	
(global-set-key (kbd "C-h C-e") nil)	
(global-set-key (kbd "C-h C-f") nil)	
(global-set-key (kbd "C-h RET") nil)	
(global-set-key (kbd "C-h C-n") nil)	
(global-set-key (kbd "C-h C-o") nil)	
(global-set-key (kbd "C-h C-p") nil)	
(global-set-key (kbd "C-h C-t") nil)	
(global-set-key (kbd "C-h C-w") nil)	
(global-set-key (kbd "C-h C-\"") nil)	
(global-set-key (kbd "C-h .") nil)	
(global-set-key (kbd "C-h C") nil)	
(global-set-key (kbd "C-h I") nil)	
(global-set-key (kbd "C-h L") nil)	
(global-set-key (kbd "C-h S") nil)	
(global-set-key (kbd "C-h g") nil)	
(global-set-key (kbd "C-h n") nil)	
(global-set-key (kbd "C-h p") nil)	
(global-set-key (kbd "C-h q") nil)	
(global-set-key (kbd "C-h s") nil)	

;;}}}

;;}}}

;;}}}

;;{{{ Org Mode

(case (current-location)
  ('home (load "/home/pradeep/.emacs.d/my-org-mode-config.el"))
  ('iit (load "/home/spradeep/.emacs.d/my-org-mode-config.el")))

;;}}}

;;{{{ Writing Stuff

;;{{{ Writing functions

;;; My regexp for words.
(setq my-word-regexp "\\w+\\W*")

;; As of now, way too inaccurate when compared to 'wc -w' (when tested
;; for the whole of my .emacs file :-b))
;;; Todo - make it insert word count when passed an argument
(defun my-word-count (beg end)
  "Print word count in the echo area."
  (interactive "r")
  (let (var1)
    ;; What's wrong with this?
    ;; (setq var1 (count-matches "\\<\\w+\\>" beg end))
    (setq var1 (count-matches my-word-regexp beg end))
    (message "Word Count : %s" var1)))

(defun my-count-words-buffer (arg)
  "Print number of words in the buffer.
With arg, insert result into buffer."
  (interactive "P")
  (let ((total-wc (format "Word Count : %s"
			  (count-matches my-word-regexp
					 (point-min)
					 (point-max)))))
    (princ total-wc (if arg
			(current-buffer)
		      t))))

;;}}}

;;{{{ Writing settings

;; Make ), ( move by dot-delimited sentences
(setq sentence-end-double-space nil)
;;; <2011-05-11 Wed>
(vimpulse-map "gsw" 'my-count-words-buffer)
(vimpulse-vmap "W" 'my-word-count)

;;}}}

;;}}}

;;{{{ Programming Stuff

;;{{{ CEDET stuff

;; (load-file "/home/pradeep/.emacs.d/cedet-1.0pre7/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu
;; (semantic-load-enable-minimum-features)

;; (add-to-list 'load-path "/home/pradeep/.emacs.d/ecb-2.40") 
;; (require 'ecb)

;;}}}

;;{{{ Programming functions

;;{{{ Compile and Run

;;; TODO: Set my-is-program-compiling while calling 'compile' as well.
(defun my-recompile ()
  "If compilation succeeded without errors, return t.

 Else, go to first error and return nil."
  (interactive)
  (save-buffer)
  ;; Turn on variable to say that the compilation is for a program.
  (setq my-is-program-compiling t)
  ;; TODO: Do compile if it is the first time I'm calling this.
  (recompile)
  ;; Switch to the compilation buffer. 
  )

(defconst my-coding-terminal-name "*program-test-term*")

;;; Variable to say that the compilation process running is for a
;;; program (not grep, or something else that also uses the
;;; compilation code)
(defvar my-is-program-compiling nil)

;;; <2012-01-14 Sat>
(defun my-ansi-term-repeat-last-command ()
  "Repeat last command in an ansi-term."
  (interactive)
  (term-send-up)
  (term-send-input))

;;; <2012-01-14 Sat> 
;;; BUG: It keeps saying "Compiling" in the mode line.
;;; 'compilation-in-progress' variable says that there are some processes running.

;;; TODO: It messes up the order if the buffer list (Compilation comes
;;; before my code buffer).

;;; BIG BUG: It is called even when grep is run!!!
(defun notify-compilation-result (buffer msg)
  " Switch to program-test-term and execute program if compilation is successful.
Else, show compilation errors and switch to the first one.

Called when compilation finishes.
buffer: the compilation buffer in question.
msg: the compilation notification message"

  (if my-is-program-compiling
      (labels
	  ((my-compilation-show-term
	    ()
	    (other-window-display-buffer my-coding-terminal-name)
	    (other-window-do #'my-ansi-term-repeat-last-command)
	    (message "Compilation finished.\nProgram execution begun."))
	   (my-compilation-create-term
	    ()
	    (other-window-shell-and-go)
	    (rename-buffer my-coding-terminal-name)
	    (message "Please enter the command to execute your program."))
	   (my-compilation-show-errors
	    ()
	    (other-window-display-buffer buffer)
	    (next-error)
	    (message "Pointing to first error message.")))

	;; Get back to our code buffer
	(switch-to-buffer (other-buffer (current-buffer) t))

	;; Turn off the program compilation variable
	(setq my-is-program-compiling nil)

	(if (string-match "^finished" msg)
	    (if (get-buffer my-coding-terminal-name)
		(my-compilation-show-term)
	      (my-compilation-create-term))
	  (my-compilation-show-errors)))))

(add-to-list 'compilation-finish-functions
	     'notify-compilation-result)

;;; TODO - Don't ask me if I want to read the new tags table 

;;}}}

(defun c-insert-semi-colon ()
  "Work-around to insert ';' without the electric behaviour."
  (interactive)
  (insert-char ?\; 1))

(defun my-create-tags-table-curr-folder (&optional arg)
  "Create TAGS table for current folder.

Do it for C++, by default. If arg is 1, do it for Java."
  (interactive "P")
  (if (null arg)
      (shell-command-to-string
       "find . -name \"*.cpp\" -or -name \"*.h\" -or -name \"*.c\" | xargs etags")
    (shell-command-to-string
     "find . -name \"*.java\" | xargs etags"))
  (visit-tags-table "." t)
  (message "TAGS table created in %s" (pwd)))

(defun my-insert-comment-above  ()
  "Insert a comment above current line"
  (interactive)
  (viper-Open-line 1)        
  (if paredit-mode
      (paredit-comment-dwim)
    (comment-dwim nil)))

;;{{{ For Markup Languages

(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. 
http://stackoverflow.com/questions/12492/pretty-printing-xml-files-on-emacs. "
  (interactive "r")
  (save-excursion
    ;; Works without nxml mode
    ;; (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

(defun my-pretty-print-html-buffer ()
  "Pretty print HTML buffer using bf-pretty-print-xml-region."
  (interactive)
  (bf-pretty-print-xml-region (point-min) (point-max)))

;;}}}

;;}}}

;;{{{ Programming Settings

(add-hook 'c-mode-common-hook 'c-toggle-auto-newline 1)
(add-hook 'java-mode-hook 'glasses-mode 1)
(add-hook 'java-mode-hook (function cscope:hook))
(add-hook 'java-mode-hook 'yas/minor-mode 1)

;; (add-hook 'compilation-mode-hook 'next-error-follow-minor-mode)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;; <2012-03-08 Thu> - DoxyMacs 
(cond ((equal (current-location) 'home)
       (add-to-list 'load-path "/usr/share/emacs/site-lisp/doxymacs/")
       (require 'doxymacs)
       (add-hook 'c-mode-common-hook 'doxymacs-mode)
       (defun my-doxymacs-font-lock-hook ()
	 (if (or (eq major-mode 'c-mode)
		 (eq major-mode 'c++-mode)
		 (eq major-mode 'java-mode))
	     (doxymacs-font-lock)))
       (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)))	

(cond ((or (equal (current-location) 'home)
	   (equal (current-location) 'iit))

       ;; YASnippet
       (add-to-list 'load-path
		    "~/.emacs.d/plugins/yasnippet-0.6.1c")
       (require 'yasnippet)
       (yas/initialize)
       (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")

       (add-to-list 'load-path "~/.emacs.d/plugins/")

       ;; ;; Doesn't work even after adding this line - <2011-08-28 Sun> 
       ;; (load-file "/usr/share/emacs/site-lisp/xcscope.el")
       ;; ;; Doesn't work anymore. Why? - <2011-08-28 Sun> 
       ;; (if (fboundp 'xcscope)
       ;; 	   (require 'xcscope))
       (require 'xcscope)
       ))

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
				   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

;;; <2012-02-15 Wed>
(setq imenu-auto-rescan t)

;;; Hippie Expand - <2011-05-08 Sun>
(global-set-key (kbd "M-/") 'hippie-expand)

;;; Keybindings
(global-set-key [f5] 'My-C-Compile-and-Run)
(global-set-key (kbd "C-;") 'c-insert-semi-colon)
(vimpulse-map (kbd "g x t") 'my-create-tags-table-curr-folder)
(vimpulse-map (kbd "g p p") 'my-pretty-print-html-buffer)
(vimpulse-map (kbd "g ;") 'my-insert-comment-above)

;;; Seems to give an error saying "Attempt to set constant: nil" - <2011-12-01 Thu>
;;; Set [[, ]] in python-mode - <2011-10-06 Thu>
;; (vimpulse-define-key 'python-mode 'vi-state "[[" 'py-beginning-of-def-or-class)
;; (vimpulse-define-key 'python-mode 'vi-state "]]" 'py-end-of-def-or-class)

;;{{{ Lisp Stuff

(setq-default scheme-program-name "guile-1.8") ; Scheme interpreter integration
;; (setq-default scheme-program-name "/usr/bin/scheme") ; Scheme interpreter integration)					

(cond ((or (equal (current-location) 'home) (equal (current-location) 'iit))
       (autoload 'enable-paredit-mode "paredit"
	 "Turn on pseudo-structural editing of Lisp code."
	 t)
       (ignore-errors (require 'paredit))
       (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
       (add-hook 'scheme-mode-hook 'enable-paredit-mode)
       (add-hook 'lisp-mode-hook 'enable-paredit-mode)
       (define-key paredit-mode-map (kbd ")") 'paredit-close-round-and-newline)
       (define-key paredit-mode-map (kbd "M-)") 'paredit-close-round))
      nil)

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;;; CLisp <2011-10-13 Thu> 
(setq inferior-lisp-program "clisp")

(vimpulse-define-key 'slime-mode 'insert-state (kbd "C-t")
		     'slime-complete-symbol)

;;; SLIME
(case (current-location)
  ('home (add-to-list 'load-path "~/.emacs.d/slime-new/slime/"))
  ('iit (add-to-list 'load-path "~/.emacs.d/slime/")))


(require 'slime)
(slime-setup '(slime-fancy))
;; (slime-setup)

;;; Attempt to prevent 'Lisp connection error'
;; (setq slime-net-coding-system 'utf-8-unix)
;; (setq slime-lisp-implementations
;;       '((clisp ("clisp") :coding-system utf-8-unix)))

;;}}}
;;{{{ Prolog

(setq prolog-system 'gnu)

;;}}}

;;; <2011-10-02 Sun> 
;; (autoload 'bison-mode "bison-mode.el")
;; ;; (add-to-set! auto-mode-alist '("\\.y$" . bison-mode))
;; (add-to-list 'auto-mode-alist '("\\.y\\'" . bison-mode))

(load-file "~/.emacs.d/elisp/yacc.el")
(add-to-list 'auto-mode-alist '("\\.y\\'" . yacc-mode))
(add-to-list 'auto-mode-alist '("\\.lex\\'" . c-mode))

;; (autoload 'flex-mode "flex-mode")
;; ;; (add-to-set! auto-mode-alist '("\\.l$" . flex-mode))
;; (add-to-list 'auto-mode-alist '("\\.l\\'" . flex-mode))

;;; Make ediff split windows side by side - <2011-10-03 Mon> 
(setq ediff-split-window-function 'split-window-horizontally)

;;; Want to see if I can get coloured ansi-term output - <2011-10-11 Tue> 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)



;;{{{ Hide/Show customizations

(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;;; Make only defs and classes in Python hide-able - <2011-09-29 Thu> 
(setq py-hide-show-keywords '("class" "def"))
(setq py-hide-show-hide-docstrings nil)

;;; Make only functions and classes in C/C++ be hide-able - <2011-09-29 Thu> 
;;; This should ideally contain beginning-of-defun regex, though
(add-to-list 'hs-special-modes-alist '(c-mode "^{" "^}" nil nil nil))
(add-to-list 'hs-special-modes-alist '(c++-mode "^{" "^}" nil nil nil))

;;; <2011-09-29 Thu> 
(setq hs-set-up-overlay
      (defun my-display-code-line-counts (ov)
        (when (eq 'code (overlay-get ov 'hs))
          (overlay-put ov 'display
                       (propertize
                        (format " ... <%d lines>"
                                (count-lines (overlay-start ov)
                                             (overlay-end ov)))
                        'face 'font-lock-type-face)))))

;;; This is done by vimpulse each time hideshow is loaded - <2011-09-29 Thu> 
;; (vimpulse-map (kbd "z a") 'hs-toggle-hiding)

;;}}}

;;}}}

;;{{{ Open automatic context help for ElDoc.

;;; (Seems helpful) - <2011-09-28 Wed> 

(defun rgr/toggle-context-help ()
  "Turn on or off the context help.
Note that if ON and you hide the help buffer then you need to
manually reshow it. A double toggle will make it reappear"
  (interactive)
  (with-current-buffer (help-buffer)
    (unless (local-variable-p 'context-help)
      (set (make-local-variable 'context-help) t))
    (if (setq context-help (not context-help))
	(progn
	   (if (not (get-buffer-window (help-buffer)))
	       (display-buffer (help-buffer)))))
    (message "Context help %s" (if context-help "ON" "OFF"))))

(defun rgr/context-help ()
  
  "Display function or variable at point in *Help* buffer if visible.
Default behaviour can be turned off by setting the buffer local
context-help to false"
  (interactive)
  (let ((rgr-symbol (symbol-at-point))) ; symbol-at-point http://www.emacswiki.org/cgi-bin/wiki/thingatpt%2B.el
    (with-current-buffer (help-buffer)
     (unless (local-variable-p 'context-help)
       (set (make-local-variable 'context-help) t))
     (if (and context-help (get-buffer-window (help-buffer))
         rgr-symbol)
       (if (fboundp  rgr-symbol)
           (describe-function rgr-symbol) 
	 (if (boundp  rgr-symbol) (describe-variable rgr-symbol)))))))

(defadvice eldoc-print-current-symbol-info
  (around eldoc-show-c-tag activate)
  (cond 
	((eq major-mode 'emacs-lisp-mode) (rgr/context-help) ad-do-it)
	((eq major-mode 'lisp-interaction-mode) (rgr/context-help) ad-do-it)
	((eq major-mode 'apropos-mode) (rgr/context-help) ad-do-it)
	(t ad-do-it)))

(global-set-key (kbd "C-c h") 'rgr/toggle-context-help)

;;}}}

;;{{{ Pentadactyl mode

;;; My very own pentadactyl mode - <2011-09-28 Wed> 
;;; Very cuppy. Most of the syntax highlighting I want doesn't happen.
(define-generic-mode 'pentadactyl-mode
  ;; comments
  '("\"")

  ;; keywords
  ;; This doesn't match keywords immediately followed by an operator,
  ;; which is unfortunately what almost all Pentadactyl settings look like
  '("!" "abbreviate" "addons" "autocmd" "back" "bdelete" "blistkeys"
    "bmap" "bmark" "bmarks" "bnoremap" "buffer" "buffers" "bunmap"
    "cabbreviate" "cd" "clistkeys" "Clistkeys" "cmap" "Cmap" "Cmap"
    "cnoremap" "Cnoremap" "Cnoremap" "colorscheme" "command"
    "completions" "contexts" "cookies" "cunabbreviate" "cunmap" "Cunmap"
    "Cunmap" "delbmarks" "delcommand" "delgroup" "delmacros" "delmarks"
    "delqmarks" "delstyle" "dialog" "dlclear" "doautoall" "doautocmd"
    "downloads" "echo" "echoerr" "echomsg" "else" "endif" "elseif"
    "endif" "exit" "extadd" "extdelete" "extdisable" "extenable"
    "extoptions" "extrehash" "exttoggle" "extupdate" "feedkeys" "finish"
    "forward" "frameonly" "group" "hardcopy" "help" "helpall"
    "highlight" "history" "iabbreviate" "if" "elseif" "ilistkeys"
    "ilistkeys" "Ilistkeys" "Imap" "Inoremap" "iunabbreviate" "iunmap"
    "Iunmap" "Iunmap" "javascript" "jumps" "keepalt" "let"
    "listcommands" "listkeys" "listoptions" "loadplugins" "macros" "map"
    "mark" "marks" "messages" "messclear" "mkpentadactylrc" "mksyntax"
    "mlistkeys" "mlistkeys" "mmap" "mmap" "mnoremap" "mnoremap" "munmap"
    "munmap" "nlistkeys" "nlistkeys" "nmap" "nnoremap" "nohlfind"
    "noremap" "normal" "nunmap" "open" "pageinfo" "pagestyle" "pintab"
    "preferences" "pwd" "qmark" "qmarks" "quit" "quitall" "redraw"
    "rehash" "reload" "reloadall" "restart" "runtime" "sanitize"
    "saveas" "sbclose" "scriptnames" "set" "setglobal" "setlocal"
    "sidebar" "silent" "source" "stop" "stopall" "style" "styledisable"
    "styleenable" "styletoggle" "tab" "tabattach" "tabdetach" "tabdo"
    "tabduplicate" "tablast" "tabmove" "tabnext" "tabonly" "tabopen"
    "tabprevious" "tabrewind" "time" "tlistkeys" "tlistkeys" "tmap"
    "tnoremap" "toolbarhide" "toolbarshow" "toolbartoggle" "tunmap"
    "unabbreviate" "undo" "undoall" "unlet" "unmap" "unpintab" "verbose"
    "version" "viewsource" "vlistkeys" "vlistkeys" "vmap" "vnoremap"
    "vunmap" "winclose" "window" "winonly" "winopen" "wqall" "yank"
    "zoom" "activate" "altwildmode" "autocomplete" "banghist" "cdpath"
    "complete" "cookieaccept" "cookielifetime" "cookies" "defsearch"
    "downloadsort" "editor" "encoding" "errorbells" "eventignore" "exrc"
    "extendedhinttags" "fileencoding" "findcase" "followhints"
    "fullscreen" "guioptions" "helpfile" "hintinputs" "hintkeys"
    "hintmatching" "hinttags" "hinttimeout" "history" "hlfind" "incfind"
    "insertmode" "iskeyword" "jsdebugger" "jumptags" "loadplugins"
    "mapleader" "maxitems" "messages" "more" "newtab" "nextpattern"
    "online" "work offline" "pageinfo" "passkeys" "passunknown" "popups"
    "previouspattern" "private" "private browsing" "runtimepath"
    "sanitizeitems" " sanitizeshutdown" "sanitizetimespan" "scroll"
    "shell" "shellcmdflag" "showmode" "showstatuslinks" "showtabline"
    "strictfocus" "suggestengines" "timeout" "timeoutlen" "titlestring"
    "urlseparator" "usermode" "verbose" "visualbell" "wildanchor"
    "wildcase" "wildignore" "wildmode" "wildsort" "wordseparators" "go")

  ;; extra stuff to colorize
  '(("\[.*?\]" . 'font-lock-builtin-face)
    ;; non-greedy regex (.*?) to font-lock ab and bc alone in <ab>xyz<bc>
    ;; instead of ab>xyz<bc
    ("'.*?'" . 'font-lock-builtin-face)
    ("<.*?>" . 'font-lock-variable-name-face)
    ;; Doesn't work
    ("http:\[-a-zA-Z0-9/?=#_:.\]*$" . 'font-lock-variable-name-face)
    ("\\w+" . 'font-lock-keyword-face)
    (":" . font-lock-builtin-face)
    ("$" . font-lock-builtin-face)
    ("\<go\>" . font-lock-variable-name-face)
    ;; Get this to work!
    ;; '((regexp-opt
    ;;    '("!" "abbreviate" "addons" "autocmd" "back" "bdelete" "blistkeys"
    ;; 	 "bmap" "bmark" "bmarks" "bnoremap" "buffer" "buffers" "bunmap"
    ;; 	 "cabbreviate" "cd" "clistkeys" "Clistkeys" "cmap" "Cmap" "Cmap"
    ;; 	 "cnoremap" "Cnoremap" "Cnoremap" "colorscheme" "command"
    ;; 	 "completions" "contexts" "cookies" "cunabbreviate" "cunmap" "Cunmap"
    ;; 	 "Cunmap" "delbmarks" "delcommand" "delgroup" "delmacros" "delmarks"
    ;; 	 "delqmarks" "delstyle" "dialog" "dlclear" "doautoall" "doautocmd"
    ;; 	 "downloads" "echo" "echoerr" "echomsg" "else" "endif" "elseif"
    ;; 	 "endif" "exit" "extadd" "extdelete" "extdisable" "extenable"
    ;; 	 "extoptions" "extrehash" "exttoggle" "extupdate" "feedkeys" "finish"
    ;; 	 "forward" "frameonly" "group" "hardcopy" "help" "helpall"
    ;; 	 "highlight" "history" "iabbreviate" "if" "elseif" "ilistkeys"
    ;; 	 "ilistkeys" "Ilistkeys" "Imap" "Inoremap" "iunabbreviate" "iunmap"
    ;; 	 "Iunmap" "Iunmap" "javascript" "jumps" "keepalt" "let"
    ;; 	 "listcommands" "listkeys" "listoptions" "loadplugins" "macros" "map"
    ;; 	 "mark" "marks" "messages" "messclear" "mkpentadactylrc" "mksyntax"
    ;; 	 "mlistkeys" "mlistkeys" "mmap" "mmap" "mnoremap" "mnoremap" "munmap"
    ;; 	 "munmap" "nlistkeys" "nlistkeys" "nmap" "nnoremap" "nohlfind"
    ;; 	 "noremap" "normal" "nunmap" "open" "pageinfo" "pagestyle" "pintab"
    ;; 	 "preferences" "pwd" "qmark" "qmarks" "quit" "quitall" "redraw"
    ;; 	 "rehash" "reload" "reloadall" "restart" "runtime" "sanitize"
    ;; 	 "saveas" "sbclose" "scriptnames" "set" "setglobal" "setlocal"
    ;; 	 "sidebar" "silent" "source" "stop" "stopall" "style" "styledisable"
    ;; 	 "styleenable" "styletoggle" "tab" "tabattach" "tabdetach" "tabdo"
    ;; 	 "tabduplicate" "tablast" "tabmove" "tabnext" "tabonly" "tabopen"
    ;; 	 "tabprevious" "tabrewind" "time" "tlistkeys" "tlistkeys" "tmap"
    ;; 	 "tnoremap" "toolbarhide" "toolbarshow" "toolbartoggle" "tunmap"
    ;; 	 "unabbreviate" "undo" "undoall" "unlet" "unmap" "unpintab" "verbose"
    ;; 	 "version" "viewsource" "vlistkeys" "vlistkeys" "vmap" "vnoremap"
    ;; 	 "vunmap" "winclose" "window" "winonly" "winopen" "wqall" "yank"
    ;; 	 "zoom" "activate" "altwildmode" "autocomplete" "banghist" "cdpath"
    ;; 	 "complete" "cookieaccept" "cookielifetime" "cookies" "defsearch"
    ;; 	 "downloadsort" "editor" "encoding" "errorbells" "eventignore" "exrc"
    ;; 	 "extendedhinttags" "fileencoding" "findcase" "followhints"
    ;; 	 "fullscreen" "guioptions" "helpfile" "hintinputs" "hintkeys"
    ;; 	 "hintmatching" "hinttags" "hinttimeout" "history" "hlfind" "incfind"
    ;; 	 "insertmode" "iskeyword" "jsdebugger" "jumptags" "loadplugins"
    ;; 	 "mapleader" "maxitems" "messages" "more" "newtab" "nextpattern"
    ;; 	 "online" "work offline" "pageinfo" "passkeys" "passunknown" "popups"
    ;; 	 "previouspattern" "private" "private browsing" "runtimepath"
    ;; 	 "sanitizeitems" " sanitizeshutdown" "sanitizetimespan" "scroll"
    ;; 	 "shell" "shellcmdflag" "showmode" "showstatuslinks" "showtabline"
    ;; 	 "strictfocus" "suggestengines" "timeout" "timeoutlen" "titlestring"
    ;; 	 "urlseparator" "usermode" "verbose" "visualbell" "wildanchor"
    ;; 	 "wildcase" "wildignore" "wildmode" "wildsort" "wordseparators" "go")) . font-lock-variable-name-face)
    "urlseparator"
    "-="
    "+="
    "!="
    "="
    "+"
    "-"
    "<"
    ">"
    ;; ("<" . font-lock-builtin-face)
    ;; (">" . font-lock-builtin-face)
    )

  ;; files
  '(".pentadactylrc$")
  nil
  "Mode for editing Pentadactyl config files")

;;}}}

;;}}}

;;{{{ Net-related

;;{{{ Jabber

(case (current-location)
  ('home (load "/home/pradeep/.emacs.d/my-jabber-config.el")))

;;}}}

;;{{{ Gnus

;;; Enable adaptive scoring
(setq gnus-use-adaptive-scoring t)

;;}}}

;;{{{ w3m 

(cond ((equal (current-location) 'home)
       (setq w3m-quick-start nil)
       (setq w3m-use-cookies t))
      nil)

;;}}}

;;}}}

;;{{{ Other Useful modes

;;{{{ Folding mode :P

(if (fboundp 'folding-mode)
    (progn
      ;; This has to be set 
      (setq folding-mode-prefix-key "\C-c")
      (require 'folding)
      (folding-mode-add-find-file-hook)

      ;; w00t!!!!! It works!!
      ;; I had so much trouble getting this to work!! - <2011-09-29 Thu>
      (vimpulse-define-key 'folding-mode 'vi-state (kbd "TAB")
			   'folding-toggle-show-hide)
      (vimpulse-define-key 'folding-mode 'vi-state (kbd "<C-tab>")
			   'folding-show-current-subtree)
      (vimpulse-map (kbd "z j") 'folding-next-visible-heading)
      (vimpulse-map (kbd "z k") 'folding-previous-visible-heading)
      (vimpulse-map (kbd "z f") 'folding-fold-region)
      (add-hook 'emacs-lisp-mode-hook 'folding-mode)))

;;; Try to get imenu to recognize folding headings - <2011-09-29 Thu> 
;; (add-hook 'emacs-lisp-mode-hook
;; 	  (lambda ()
;; 	    (let* ((curr-gen-expr imenu-generic-expression)
;; 		   (my-imenu-generic-expression
;; 		    ;; This regex is where it cups
;; 		    '((nil  "^;;{{{ *\\(\\w+?\\)$" 1))))
;; 	      (setq imenu-generic-expression (append my-imenu-generic-expression
;; 						     curr-gen-expr)))))

;;; My attempts at making a vimfold-mode :)
;; (defun set-markers (beg end)
;;   "Set markers m1 and m2 at beg and end, respectively."
;;   (interactive "r")
;;   (setq m1 (make-marker))
;;   (setq m2 (make-marker))
;;   (set-marker m1 beg)			
;;   (set-marker m2 end)
;;   (print m1)
;;   (print m2))

;; (defun highlight-region ()
;;   "Highlight region between m1 and m2."
;;   (interactive)
;;   (push-mark (point))
;;   (push-mark (marker-position m1) nil t)
;;   (goto-char (marker-position m2)))

;;}}}

;;{{{ EMMS

(if (fboundp 'emms)
    (progn
      ;; EMMS - Emacs MultiMedia System
      (require 'emms-setup)
      ;; (emms-standard)
      (emms-all)
      (emms-default-players)
      (emms-mode-line 0)
      (emms-playing-time 1)
      ;; (setq emms-source-file-default-directory "~/Music/")

      ;; I want to play wav files
      ;; (require 'emms-player-simple)
      ;; (define-emms-simple-player play '(file) "\\.wav$" "play")
      ))

;;}}}

;;{{{ open-with

;;; Open a file with an external application - <2011-05-16 Mon> 
(require 'openwith)
(openwith-mode t)

;;}}}

;;{{{ Bookmarks

;;; Save bookmarks in the bookmarks file as soon as I update / create them
(setq bookmark-save-flag 1)

;;; Bookmark+ - <2011-05-11 Wed>
(cond ((or (equal (current-location) 'home) (equal (current-location) 'iit))
       (add-to-list 'load-path "~/.emacs.d/Bookmark+/")))
 
(require 'bookmark+)

;; (defvar bmkp-default-handler-associations
;;   (list
;;    '("\\.pdf$" . "evince")
;;    '("\\.\\(flv\\|avi\\)$" . "vlc")))

;;}}}

;;{{{ Dired

;;{{{ Dired+ and Dired-x

(cond ((or (equal (current-location) 'home)
	   (equal (current-location) 'iit))

       ;; Had to do this explicitly since Dired-X was not working otherwise
       (load "dired-x")
       ;; <2011-05-16 Mon> 
       (load "dired+")
       (add-hook 'dired-load-hook
		 (lambda ()
		   (load "dired-x")
		   ;; Set dired-x global variables here.  For example:
		   ;; (setq dired-guess-shell-gnutar "gtar")
		   ;; (setq dired-x-hands-off-my-keys nil)
		   ))
       (add-hook 'dired-mode-hook
		 (lambda ()
		   (dired-omit-mode 1)
		   ;; Omit hidden files too
		   (setq dired-omit-files
			 (concat dired-omit-files "\\|^\\..+$"))
		   )))
      nil)

(define-key ctl-x-map   "d" 'diredp-dired-files)
(define-key ctl-x-4-map "d" 'diredp-dired-files-other-window)

;;}}}

;;{{{ Directory navigation without so many windows

;;; <2012-01-21 Sat> 
;;; TODO: TESTING
;;; Source: http://www.emacswiki.org/emacs/dired-extension.el
(defun dired-up-directory-single ()
  "Return up directory in single window.
When others visible window haven't current buffer, kill old buffer after `dired-up-directory'.
Otherwise, just `dired-up-directory'."
  (interactive)
  (let ((old-buffer (current-buffer))
        (current-window (selected-window)))
    (dired-up-directory)
    (catch 'found
      (walk-windows
       (lambda (w)
         (with-selected-window w
           (when (and (not (eq current-window (selected-window)))
                      (equal old-buffer (current-buffer)))
             (throw 'found "Found current dired buffer in others visible window.")))))
      (kill-buffer old-buffer))))

(defun dired-find-file+ ()
  "Like `dired-find-file'.
When open directory, if others visible window have this directory, do `find-file'.
Otherwise do `find-alternate-file'.
When open file, always use `find-file'."
  (interactive)
  (set-buffer-modified-p nil)
  (let ((file (dired-get-file-for-visit))
        (old-buffer (current-buffer))
        (current-window (selected-window)))
    (if (file-directory-p file)
        (catch 'found
          (walk-windows
           (lambda (w)
             (with-selected-window w
               (when (and (not (eq current-window (selected-window)))
                          (equal old-buffer (current-buffer)))
                 (find-file file)
                 (throw 'found "Found current dired buffer in others visible window.")))))
          (find-alternate-file file))
      (find-file file))))

;;}}}

;;{{{ Dired functions and bindings

(defun dired-nautilus ()
  "Load current directory with nautilus."
  (interactive)
  (shell-command
   (concat "nautilus " default-directory)))

;;; No bone :-(
;; (setq dired-guess-shell-alist-user
;;       '(("\\.pdf\\'" "evince")
;; 	("\\.pdf$" "evince")))

;; <2011-04-30 Sat>
;;; Switches for 'ls' (used to display the directory contents in Dired).
;;; g: don't list owner (me, obviously)
;;; h: human-readable (forgodssake)
;;; o: No information about group
(setq dired-listing-switches "-lagoh --group-directories-first")

;;}}}

;;}}}

;;{{{ Command Frequency

;;; I don't know why it's giving me - (error "Not enough arguments for format string")
;; (require 'command-frequency)
;; (command-frequency-table-load)
;; (command-frequency-mode 1)
;; (command-frequency-autosave-mode 1)

;;}}}

;;}}}
