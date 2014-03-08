;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 各種elispを導入
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; package.elを追加（設定）
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; magit導入
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'magit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; git-gutter導入
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-git-gutter-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; anzu導入
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-anzu-mode +1)





;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; auto-installを追加
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  (when (require 'auto-install nil t)
;;    (setq auto-install-directory "~/.emacs.d/elisp/") ; インストールディレクトリを設定する 初期値は ~/.emacs.d/auto-install/
;;    (auto-install-update-emacswiki-package-name t) ; EmacsWikiに登録されているelisp の名前を取得する
;;    (auto-install-compatibility-setup)) ; install-elisp の関数を利用可能にする

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; auto-completeを追加
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'auto-complete)
;; (global-auto-complete-mode t)
;; ;; 補完候補を自動ポップアップ(auto-complete)
;; (setq ac-modes (cons 'js-mode ac-modes))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; 日本語の校正ツール（コマンドは M-x yspel）
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'yspel)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; anything導入
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'anything-startup)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; linum.elを追加
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; 行番号とカラム番号を表示する
;; (require 'linum)
;; (global-linum-mode t)
;; (setq linum-format "%5d")
;; (global-linum-mode t)
;; (column-number-mode t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; linum.elを追加
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'multi-term)
;; (setq multi-term-program shell-file-name)
;; (add-hook 'term-mode-hook '(lambda ()
;; 			     (define-key term-raw-map "\C-y" 'term-paste)
;; 			     (define-key term-raw-map "\C-q" 'move-beginning-of-line)
;; 			     (define-key term-raw-map "\C-f" 'forward-char)
;; 			     (define-key term-raw-map "\C-b" 'backward-char)			     
;; 			     (define-key term-raw-map "\C-t" 'set-mark-command)			     
;; 			     (define-key term-raw-map (kbd "ESC") 'term-send-raw)
;; 			     (define-key term-raw-map [delete] 'term-send-raw)
;;                              (define-key term-raw-map "\C-z"
;;                                (lookup-key (current-global-map) "\C-z"))))
;; (global-set-key (kbd "C-c n") 'multi-term-next)
;; (global-set-key (kbd "C-c p") 'multi-term-prev)
;; (set-language-environment  'utf-8)
;; (prefer-coding-system 'utf-8)
;; (setq multi-term-program "/bin/zsh")
;; (setenv "TERMINFO" "~/.emacs.d/elisp/multi-term")
;; ;;(require 'ucs-normalize) 
;; ;;(setq file-name-coding-system 'utf-8-hfs)
;; ;;(setq locale-coding-system 'utf-8-hfs)
;; ;;(setq system-uses-terminfo nil)
;; (global-set-key (kbd "C-c term") '(lambda ()
;;                                 (interactive)
;;                                 (multi-term)))


;; ;; yasnippet導入
;; ;; (require 'yasnippet)

;; ;; git-commit-mode
;; (require 'git-commit)
