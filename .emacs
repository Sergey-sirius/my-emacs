(setq-default transient-mark-mode t)

;;(add-to-list 'default-frame-alist '(foreground-color . "#E0DFDB"))
;;(add-to-list 'default-frame-alist '(background-color . "#102372"))

;;
;;
;; load both themes
(load-theme 'brutalist t t)
(load-theme 'brutalist-dark t t)

(require 'solar)

;; set these to your current location
(setq calendar-latitude [47 22 north]
      calendar-longitude [8 33 east])

(defun enable-appropriate-brutalist-theme ()
  "Enable the brutalist or brutalist-dark theme
depending on the time of day."
  (interactive)
  (let* ((date (calendar-current-date))
     (data (solar-sunrise-sunset date))
     (sunrise (car (car data)))
     (sunset (car (cadr data)))
     (time (decode-time))
     (now (+ (nth 2 time) (/ (nth 1 time) 60.0))))
    (cond ((< now sunrise)
       (message "%dh and %02dmin to go until sunrise"
	    (truncate (- sunrise now))
	    (round (mod (* 60 (- sunrise now)) 60))))
      ((< now sunset)
       (message "%dh and %02dmin to go until sunset"
	    (truncate (- sunset now))
	    (round (mod (* 60 (- sunset now)) 60))))
      (t
       (message "%dh and %02dmin to go until sunrise"
	    (truncate (- (+ 24 sunrise) now))
	    (- 60 (round (mod (* 60 (- (+ 24 sunrise) now)) 60))))))
    (if (and (< sunrise now) (< now sunset))
    (enable-theme 'brutalist)
      (enable-theme 'brutalist-dark))))

;; and do it
(enable-appropriate-brutalist-theme)