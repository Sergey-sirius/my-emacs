;; =================
;; Прописываем ErgoEmacs MODE
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/ergoemacs-mode")
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "ru") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)
;;
(eval-when-compile(require 'cl))
(require 'package)
(setq package-archives nil)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/") t)
(setq package-enable-at-startup nil)
(package-initialize nil)
;; --------------------------

;; ========== Фикс для работы комбинаций клавиш на русской раскладке
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

;;============== Theme
(custom-set-variables
 '(custom-enabled-themes (quote (whiteboard)))
 '(ergoemacs-keyboard-layout "ru")
 '(package-selected-packages
   (quote
    (org-beautify-theme org-attach-screenshot org-analyzer org-alert org-agenda-property org-ac org))))
(custom-set-faces
 )
;;--------------------------

;; =============== Инверсия выделения
(setq-default transient-mark-mode t)
;; --------------------------

;; ================== Шрифты
(set-face-attribute 'default nil :height 110)
(when (member "DejaVu Sans Mono" (font-family-list))
  (set-face-attribute 'default nil :font "DejaVu Sans Mono"))
;; ----------------------------------

;; ========= TODO my list
;;(setq org-agenda-files (list "~/main/myrepo/ToDo/work.org"
;;                             "~/main/myrepo/ToDo/myproject.org" 
;;                             "~/main/myrepo/ToDo/home.org"))

;; =====================
;;; САМЫЙ ВАЖНЫЙ МОМЕНТ - ВЫНЕСЕНИЕ НАСТРОЕК СРЕДЫ В settings.el и загрузка их оттуда
(setq custom-file "~/.emacs.d/settings.el")
(load-file "~/.emacs.d/settings.el")
;; ------------------


;;=======================================================================
(use-package beacon
  :diminish
  :commands beacon-mode)


;; --------------------------------
