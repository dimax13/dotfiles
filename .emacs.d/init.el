;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 初期設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Find Filesで最初からホームディレクトリ以下を探しに行くようにする
(cd "~/")

;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "./elisp" "./conf")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init-loader.elを追加
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://coderepos.org/share/browser/lang/elisp/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf/base") ; 設定ファイルがあるディレクトリを指定
(init-loader-load "~/.emacs.d/conf/ext") ; 設定ファイルがあるディレクトリを指定

;; CmdとOptの入れ替え
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; Google 日本語入力
(setq default-input-method "MacOSX")
