;; --------------------------
;; Прописываем ErgoEmacs MODE

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/ergoemacs-mode")
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "ru") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)
;; --------------------------

;;
;; ----- Фикс для работы комбинаций клавиш на русской раскладке
(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key local-function-key-map
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))

(defadvice read-passwd (around my-read-passwd act)
  (let ((local-function-key-map nil))
    ad-do-it))
(reverse-input-method 'russian-computer)
;; --------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ergoemacs-keyboard-layout "ru")
 '(package-selected-packages
   (quote
    (org-beautify-theme org-attach-screenshot org-analyzer org-alert org-agenda-property org-ac org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;
;; ------ Инверсия выделения
(setq-default transient-mark-mode t)
;; --------------------------

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