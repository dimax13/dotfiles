;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 機能の設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;ビープ音消去
(setq ring-bell-function 'ignore)

;; 文字コードを指定する
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; Mac OS Xの場合のファイル名の設定
;; (when (eq system-type 'darwin)
;;   (require 'ucs-normalize)
;;   (set-file-name-coding-system 'utf-8-hfs)
;;   (setq locale-coding-system 'utf-8-hfs))

;; Windowsの場合のファイル名の設定
;; (when (eq window-system 'w32)
;;   (set-file-name-coding-system 'cp932)
;;   (setq locale-coding-system 'cp932))



;;Shift+カーソルキーで選択できるようにする
(setq pc-select-selection-keys-only t)
'(pc-selection-mode 1)

;;スクロールを1行ごとに
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 1))
(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 1))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)

;;矩形選択を有効に
(cua-mode t)
(setq cua-enable-cua-key nil)

;; 一時ファイルの保存先設定
(setq auto-save-list-file-prefix "./.temps")

;; バックアップファイルの保存
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/backups"))
	    backup-directory-alist))

; metaキーの変更
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; magit-status を git で起動可能にする
(defalias 'git 'magit-status)

