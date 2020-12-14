;;===============================
;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-
;;--------------------------------

;;=======================
;; Выделим выражения между {},[],(), когда курсор находится на одной из скобок
(show-paren-mode t) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()
;;--------------------------------------

;;=============================
;; Electric-modes settings
(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode -1) ;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)
(delete-selection-mode t) ;; Delete selection
(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode          t) ;; размер файла в %-ах
;;--------------------------------

;;======================  Indent settings
(setq-default indent-tabs-mode nil) ;; отключить возможность ставить отступы TAB'ом
(setq-default tab-width          4) ;; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ;; стандартная ширина отступа - 4 пробельных символа
(setq-default lisp-body-indent   4) ;; сдвигать Lisp-выражения на 4 пробельных символа
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ
(setq lisp-indent-function  'common-lisp-indent-function)
;; ------------------------------------------------------

;;=================  System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
    (string-equal system-type "windows-nt"))
;;-------------------------------------------

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
