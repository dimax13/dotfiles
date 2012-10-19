;; Emacs 23より前のバージョンを利用する場合は
;; user-emacs-directory 変数が未定義のため次の設定を追加
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-lebel-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;; http://coderepos.org/share/browser/lang/elisp/init-loader.el
(require 'init-loader)
(require 'auto-install)

(init-loader-load "~/.emacs.d/conf") ; 設定ファイルがあるディレクトリを指定
(setq auto-install-directory "~/.emacs.d/elisp/")
m(auto-install-compativility-setup)
