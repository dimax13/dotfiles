;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; PCごとの設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; フォント設定
(set-face-attribute 'default nil
                      :family "IPA Pゴシック"
                      :height 200)
 (set-fontset-font "fontset-default"
                      'japanese-jisx0208
                      '("IPA Pゴシック" . "jisx0208-sjis")) 

;; フレームの設定
(setq default-frame-alist
      (append
       (list
        ;; サイズ・位置
	'(width . 85) ; 横幅(文字数)
        '(height . 35) ; 高さ(行数)
        '(top . 0) ; フレーム左上角 y 座標
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

;; カレントウィンドウの透明度を変更する (80%)
(set-frame-parameter nil 'alpha 80)

(add-to-list 'exec-path "D:/Shortcut")




