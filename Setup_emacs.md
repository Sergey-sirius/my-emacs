EMACS

* Окна
Еще до возникновения оконных сред Microsoft и Apple разработчики Emacs разработали и приняли понятие - фрейм. 
Соответственно фреймов может быть несколько. 
Содержимое которое отображается в фрейме - это то что содержится внутри буфера.
[Количество окон] {Ctrl+X} (1 -одно окно, 2 - два окна)
соответственно 
[Закрыть все остальные кроме активного] {Ctrl+X 1}
[Переключение между окнами] {Ctrl+X o}
[Закрыть активное окно] {Ctrl+X 0}


* Буфер (ep2 3:14)
Буферы разделяют на: служебные и буферы с файлами
[Список буферов] {Ctrl+X Ctrl+B}

буфер блокнот заметок   scratch
Лог редактора   Messages
[Переключиться в буфер] {Ctrl+X B (после чего ввести имя буфера)}


* Установка ErgoEmacs XAH  http://ergoemacs.org/emacs/emacs_keys_index.html
1 вариант 
Инициализация ErgoEmacs в .emacs:
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us") ; US
(load-file "~/.emacs.d/ergoemacs/site-lisp/site-start.el")

2 вариант
- Репозиторий 
  https://code.google.com/archive/p/ergoemacs/downloads
  https://ergoemacs.github.io/

- если есть, удаляем файл .emacs

- переходим в папку ~/.emacs.d , удаляем все файлы
  git clone -b master --single-branch https://github.com/ergoemacs/ergoemacs-mode.git

- создаем файл ~/.emacs.d/init.el
;;
;;-------------------
(add-to-list 'load-path "~/.emacs.d/ergoemacs-mode")
(require 'ergoemacs-mode)
;;
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)
;;-------------------



=============================================================================================
https://dunmaksim.blogspot.com/2015/05/emacs.html


;; Замапить клавишу CapsLock с клавишей Ctrl
;; команда setxkbmap -option 'ctrl:nocaps'

;; Конфиг Бушенко
;; https://github.com/dbushenko/emacs-config

;; Инициализация ErgoEmacs в .emacs
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us") ; US
(load-file "~/.emacs.d/ergoemacs/site-lisp/site-start.el")
