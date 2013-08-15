;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 各種elispを導入
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init-loader.elを追加
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://coderepos.org/share/browser/lang/elisp/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf") ; 設定ファイルがあるディレクトリを指定

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-installを追加
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/") ; インストールディレクトリを設定する 初期値は ~/.emacs.d/auto-install/
  (auto-install-update-emacswiki-package-name t) ; EmacsWikiに登録されているelisp の名前を取得する
;; (setq url-proxy-services '(("http" . "proxy.djedu.kit.ac.jp:8080"))) ; 必要であればプロキシの設定を行う
  (auto-install-compatibility-setup)) ; install-elisp の関数を利用可能にする

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-completeを追加
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
(global-auto-complete-mode t)
;; 補完候補を自動ポップアップ(auto-complete)
(setq ac-modes (cons 'js-mode ac-modes))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 日本語の校正ツール（コマンドは M-x yspel）
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yspel)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; magit導入
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'magit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; anything導入
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'anything-startup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; linum.elを追加
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 行番号とカラム番号を表示する
(require 'linum)
(global-linum-mode t)
(setq linum-format "%5d")
(global-linum-mode t)
(column-number-mode t)




;; yasnippet導入
;; (require 'yasnippet)


