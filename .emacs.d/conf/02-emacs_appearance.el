;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 表示・装飾の設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;スプラッシュ(起動画面)抑止
(setq inhibit-startup-message t)
(buffer-menu)

;; フォント設定
(set-face-attribute 'default nil
                      :family "IPA Pゴシック"
                      :height 200)
 (set-fontset-font "fontset-default"
                      'japanese-jisx0208
                      '("IPA Pゴシック" . "jisx0208-sjis")) 

;; 行間
(setq-default line-spacing 1)

;; erase memubar, scrollbar
(menu-bar-mode -1) ;画面上に出るメニュー(文字)を消す
(scroll-bar-mode -1) ;画面横に出るスクロールバーを消す
(tool-bar-mode -1) ;画面上に出るツールバー(アイコン画像)を消す
(setq cursor-in-non-selected-windows nil) ;非active windowにはカーソルを表示しない
(transient-mark-mode t) ;選択したとき色がつくようにする

;; フレームの設定
(setq default-frame-alist
      (append
       (list
        ;; サイズ・位置
	'(width . 200) ; 横幅(文字数)
        '(height . 60) ; 高さ(行数)
        '(top . 20) ; フレーム左上角 y 座標
        '(left . 0) ; フレーム左上角 x 座標
        )
       default-frame-alist)
      )

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

;; カレントウィンドウの透明度を変更する (80%)
(set-frame-parameter nil 'alpha 80)

;;現在行のハイライト
'(defface my-hl-line-face
   '((((class color) (background dark))
      (:background "NavyBlue" t))
     (((class color) (background light))
      (:background "LightGoldenrodYellow" t))
     (t (:bold t)))
   "hl-line's my face")
'(global-hl-line-mode 0)

;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)

;; モードラインに時間を表示
(display-time)


