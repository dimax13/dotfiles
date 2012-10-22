;; 起動時の画面を表示しない
;; (setq inhibit-splash-screen t)
;; スタートアップページを表示しない
;; (setq inhibit-startup-message t)
;;スプラッシュ(起動画面)抑止
(setq inhibit-startup-message t)
(buffer-menu)

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

;; linum.elを追加
(require 'linum)
(global-linum-mode t)
(setq linum-format "%5d")

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")
;; 行番号を常に表示する
(global-linum-mode t)
;; カラム番号を表示
(column-number-mode t)

;;矩形選択を有効に
(cua-mode t)
(setq cua-enable-cua-key nil)

;;Shift+カーソルキーで選択できるようにする
(setq pc-select-selection-keys-only t)
'(pc-selection-mode 1)

;; ;; リージョン内の行数と文字数をモードラインに表示する（範囲指定時のみ）
;; ;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
;; (defun count-lines-and-chars ()
;;   (if mark-active
;;       (format "%d lines,%d chars "
;;               (count-lines (region-beginning) (region-end))
;;               (- (region-end) (region-beginning)))
;;       ;; これだとエコーエリアがチラつく
;;       ;;(count-lines-region (region-beginning) (region-end))
;;     ""))

;; (add-to-list 'default-mode-line-format
;;              '(:eval (count-lines-and-chars)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 表示・装飾の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 色の設定
(if window-system
    (progn
      (set-background-color "gray2")
      (set-foreground-color "White")
      (set-cursor-color "Green")
      )
  )

;; デフォルトの透明度を設定する
(add-to-list 'default-frame-alist '(alpha . 80))

;; カレントウィンドウの透明度を変更する (85%)
;; (set-frame-parameter nil 'alpha 0.85)
(set-frame-parameter nil 'alpha 80)

;;　現在行のハイライト
'(defface my-hl-line-face
  '((((class color) (background dark))
     (:background "NavyBlue" t))
    (((class color) (background light))
     (:background "LightGoldenrodYellow" t))
    (t (:bold t)))
  "hl-line's my face")
;(setq hl-line-face 'my-hl-line-face)
'(global-hl-line-mode 0)




