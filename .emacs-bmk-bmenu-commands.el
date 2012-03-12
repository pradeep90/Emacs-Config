(defun openwith
  (bookmark-name &optional use-region-p)
  (interactive
   (list
    (bmkp-read-bookmark-for-type nil
				 '((#("The-4-Hour-Workweek.pdf" 0 23
				      (bmkp-full-record
				       (#7
					(filename . "/home/pradeep/Documents/Books/The-4-Hour-Workweek.pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The-4-Hour-Workweek.pdf")))))))
				   (#("The Pragmatic Programmer..pdf" 0 29
				      (bmkp-full-record
				       (#7
					(time 19920 58069 986325)
					(visits . 3)
					(filename . "/home/pradeep/Documents/Books/The Pragmatic Programmer..pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The Pragmatic Programmer..pdf")))))))
				   (#("The God delusion.pdf" 0 20
				      (bmkp-full-record
				       (#7
					(time 19920 57508 997284)
					(visits . 2)
					(filename . "/home/pradeep/Documents/Books/The God delusion.pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The God delusion.pdf"))))))))
				 t)
    current-prefix-arg))
  (bmkp-jump-1 bookmark-name 'bmkp-select-buffer-other-window use-region-p))

(defun openwith-file-handler
  (bookmark-name &optional use-region-p)
  (interactive
   (list
    (bmkp-read-bookmark-for-type nil
				 '((#("The God delusion.pdf" 0 20
				      (bmkp-full-record
				       (#7
					(time 19920 58144 112798)
					(visits . 3)
					(filename . "/home/pradeep/Documents/Books/The God delusion.pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The God delusion.pdf")))))))
				   (#("The-4-Hour-Workweek.pdf" 0 23
				      (bmkp-full-record
				       (#7
					(time 19920 58149 265830)
					(visits . 4)
					(filename . "/home/pradeep/Documents/Books/The-4-Hour-Workweek.pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The-4-Hour-Workweek.pdf")))))))
				   (#("The Pragmatic Programmer..pdf" 0 29
				      (bmkp-full-record
				       (#7
					(time 19920 58144 92806)
					(visits . 10)
					(filename . "/home/pradeep/Documents/Books/The Pragmatic Programmer..pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The Pragmatic Programmer..pdf")))))))
				   (#("The-4-Hour-Workweek.pdf" 0 23
				      (bmkp-full-record
				       (#7
					(time 19920 58149 265830)
					(visits . 4)
					(filename . "/home/pradeep/Documents/Books/The-4-Hour-Workweek.pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The-4-Hour-Workweek.pdf")))))))
				   (#("The Pragmatic Programmer..pdf" 0 29
				      (bmkp-full-record
				       (#7
					(time 19920 58144 92806)
					(visits . 10)
					(filename . "/home/pradeep/Documents/Books/The Pragmatic Programmer..pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The Pragmatic Programmer..pdf")))))))
				   (#("The God delusion.pdf" 0 20
				      (bmkp-full-record
				       (#7
					(time 19920 58144 112798)
					(visits . 3)
					(filename . "/home/pradeep/Documents/Books/The God delusion.pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The God delusion.pdf"))))))))
				 t)
    current-prefix-arg))
  (bmkp-jump-1 bookmark-name 'bmkp-select-buffer-other-window use-region-p))

(defun openwith-file-handler
  (bookmark-name &optional use-region-p)
  (interactive
   (list
    (bmkp-read-bookmark-for-type nil
				 '((#("The God delusion.pdf" 0 20
				      (bmkp-full-record
				       (#7
					(time 19920 58144 112798)
					(visits . 3)
					(filename . "/home/pradeep/Documents/Books/The God delusion.pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The God delusion.pdf")))))))
				   (#("The-4-Hour-Workweek.pdf" 0 23
				      (bmkp-full-record
				       (#7
					(time 19920 58149 265830)
					(visits . 4)
					(filename . "/home/pradeep/Documents/Books/The-4-Hour-Workweek.pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The-4-Hour-Workweek.pdf")))))))
				   (#("The Pragmatic Programmer..pdf" 0 29
				      (bmkp-full-record
				       (#7
					(time 19920 58224 113577)
					(visits . 13)
					(filename . "/home/pradeep/Documents/Books/The Pragmatic Programmer..pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The Pragmatic Programmer..pdf")))))))
				   (#("The-4-Hour-Workweek.pdf" 0 23
				      (bmkp-full-record
				       (#7
					(time 19920 58149 265830)
					(visits . 4)
					(filename . "/home/pradeep/Documents/Books/The-4-Hour-Workweek.pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The-4-Hour-Workweek.pdf")))))))
				   (#("The Pragmatic Programmer..pdf" 0 29
				      (bmkp-full-record
				       (#7
					(time 19920 58224 113577)
					(visits . 13)
					(filename . "/home/pradeep/Documents/Books/The Pragmatic Programmer..pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The Pragmatic Programmer..pdf")))))))
				   (#("The God delusion.pdf" 0 20
				      (bmkp-full-record
				       (#7
					(time 19920 58144 112798)
					(visits . 3)
					(filename . "/home/pradeep/Documents/Books/The God delusion.pdf")
					(position . 0)
					(handler lambda
						 (bmk)
						 (dired-do-shell-command "xpdf" nil
									 '("/home/pradeep/Documents/Books/The God delusion.pdf"))))))))
				 t)
    current-prefix-arg))
  (bmkp-jump-1 bookmark-name 'bmkp-select-buffer-other-window use-region-p))

