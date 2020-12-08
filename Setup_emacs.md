EMACS
Знаниями нужно делиться, иначе они протухают.

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

- Клава скриншот 
https://ergoemacs.github.io/

- Темы
https://www.emacswiki.org/emacs/Brutalist_Theme
http://ergoemacs.org/emacs/emacs_playing_with_color_theme.html

- Emacs для Python
https://dunmaksim.blogspot.com/2015/10/emacs-python.html
https://dunmaksim.blogspot.com/2018/02/elpy-python-mode-use-package.html


- переключение раскладки, хоткей теряются 
http://reangdblog.blogspot.com/2015/05/emacs.html

- EMACS: автоустановка пакетов и хоткеи в русской раскладке
https://dunmaksim.blogspot.com/2015/09/emacs.html

- Красивый способ хранения настроек Emacs
https://dunmaksim.blogspot.com/2017/12/emacs.html

- Организация информации — Emacs Org Mode
https://habr.com/ru/post/28098/

- ORG MODE  мануал
https://orgmode.org/manual/index.html
https://orgmode.org/features.html


- Учет затраченного времени с Emacs и org-mode
https://habr.com/ru/post/63424/

- Введение в org-mode emacs
https://habr.com/ru/post/105300/

- Рахим 
https://github.com/freetonik/emacs-dotfiles


=============================================================================================
https://dunmaksim.blogspot.com/2015/05/emacs.html


;; Замапить клавишу CapsLock с клавишей Ctrl
;; команда setxkbmap -option 'ctrl:nocaps'

;; Конфиг Бушенко
;; https://github.com/dbushenko/emacs-config
;; видео https://www.youtube.com/watch?v=0K1MI10iFBM&list=PLECBtie1W1tGlrbDDBvcxnttRR4IA5qZn&index=2


;; Инициализация ErgoEmacs в .emacs
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us") ; US
(load-file "~/.emacs.d/ergoemacs/site-lisp/site-start.el")
