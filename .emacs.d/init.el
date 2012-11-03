;; Emacs 23より前のバージョンを利用する場合は
;; user-emacs-directory 変数が未定義のため次の設定を追加
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

;; load-path を追加する関数を定義
;; (defun add-to-load-path (&rest paths)
;;   (let (path)
;;     (dolist (path paths paths)
;;       (let ((default-directory
;; 	      (expand-file-name (concat user-emacs-directory path))))
;; 	(add-to-list 'load-path default-directory)
;; 	(if (fboundp 'normal-top-lebel-add-subdirs-to-load-path)
;; 	    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
;;(add-to-load-path "elisp" "conf" "public_repos")

;; load-path
(let ((default-directory (expand-file-name "~/.emacs.d/conf")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(let ((default-directory (expand-file-name "~/.emacs.d/public_repos")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; init-loader.elを追加
;; http://coderepos.org/share/browser/lang/elisp/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf") ; 設定ファイルがあるディレクトリを指定

;; auto-installを追加
(when (require 'auto-install nil t)
;; インストールディレクトリを設定する 初期値は ~/.emacs.d/auto-install/
  (setq auto-install-directory "~/.emacs.d/elisp/")
;; EmacsWikiに登録されているelisp の名前を取得する
  (auto-install-update-emacswiki-package-name t)
;; 必要であればプロキシの設定を行う
;; (setq url-proxy-services '(("http" . "localhost:8339")))
;; install-elisp の関数を利用可能にする
  (auto-install-compatibility-setup))

;; auto-completeを追加
(require 'auto-complete)
(global-auto-complete-mode t)

;; 日本語の校正ツール（コマンドは M-x yspel）
(require 'yspel)

;; magit導入
;; (add-to-list 'load-path "~/.emacs.d/elisp/magit") 
(require 'magit)
(defalias 'git 'magit-status)


