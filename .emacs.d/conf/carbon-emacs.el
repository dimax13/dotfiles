;; 起動時の画面を表示しない
;; (setq inhibit-splash-screen t)
;; スタートアップページを表示しない
(setq inhibit-startup-message t)

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

;; カラム番号を表示
(column-number-mode t)

;; リージョン内の行数と文字数をモードラインに表示する（範囲指定時のみ）
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
      ;; これだとエコーエリアがチラつく
      ;;(count-lines-region (region-beginning) (region-end))
    ""))

(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))
