;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 表示・装飾の設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 起動時の画面を表示しない
;; (setq inhibit-splash-screen t)
;; スタートアップページを表示しない
;; (setq inhibit-startup-message t)
;;スプラッシュ(起動画面)抑止
(setq inhibit-startup-message t)
(buffer-menu)

;; erase memubar, scrollbar
(menu-bar-mode -1) ;画面上に出るメニュー(文字)を消す
(scroll-bar-mode -1) ;画面横に出るスクロールバーを消す
(tool-bar-mode -1) ;画面上に出るツールバー(アイコン画像)を消す
(setq cursor-in-non-selected-windows nil) ;非active windowにはカーソルを表示しない
(transient-mark-mode t) ;選択したとき色がつくようにする

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

;;現在行のハイライト
'(defface my-hl-line-face
   '((((class color) (background dark))
      (:background "NavyBlue" t))
     (((class color) (background light))
      (:background "LightGoldenrodYellow" t))
     (t (:bold t)))
   "hl-line's my face")
;(setq hl-line-face 'my-hl-line-face)
'(global-hl-line-mode 0)

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; 行番号とカラム番号を表示する
;; linum.elを追加
(require 'linum)
(global-linum-mode t)
(setq linum-format "%5d")
(global-linum-mode t)
(column-number-mode t)

;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)



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

;; auto-complete
;; 補完候補を自動ポップアップ
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-modes (cons 'js-mode ac-modes))


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

