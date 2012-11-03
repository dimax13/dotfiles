;================================================================
; YaTeX 
;================================================================
;; YaTeX-mode
;; (add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp/yatex")
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons (cons "\\.sty$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq dvi2-command "open -a TeXShop"
      tex-command "~/Library/TeXShop/bin/platex2pdf-utf8"
      YaTeX-kanji-code nil)
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              "/usr/texbin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")))
;; PATH と exec-path に同じ物を追加します
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))	  
;; (setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8" dvi2-command "open -a TexShop")
(setq YaTeX-inhibit-prefix-letter t)
;; (setq tex-command "platex")
;; (defvar YaTeX-dvi2-command-ext-alist
;;  '(("xdvi" . ".dvi")
;;    ("ghostview¥¥|gv" . ".ps")
;;    ("acroread¥¥|pdf¥¥|Preview¥¥|TeXShop¥¥|Skim" . ".pdf")))

;; YaHtml-mode
(setq auto-mode-alist
(cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
(setq yahtml-www-browser "firefox")
; Ctrl-l で YaTeX の色付けが落ちるのを回避する
(defun font-lock-recenter ()
(interactive)
(font-lock-fontify-buffer)
(recenter))
;(global-set-key "\C-l" 'font-lock-recenter)
(add-hook 'yatex-mode-hook
'(lambda()
(progn
;; C-lで色付けが落ちるの対策
(define-key YaTeX-mode-map "\C-l" 
'font-lock-recenter)
)))

; YaTeX ショートカットの変更・設定
;;(setq yatex-mode-load-hook
;;'(lambda()
;; (YaTeX-define-begend-key "be" "eqnarray") 
;; (YaTeX-define-begend-key "be" "enumerate")
;; (YaTeX-define-begend-key "bt" "tabular")
;; (YaTeX-define-begend-key "bf" "figure")
;; (YaTeX-define-begend-key "ba" "align")
;;)
;;)

(require 'auto-complete-latex)
(setq ac-l-dict-directory "~/.emacs.d/elisp/ac-l-dict/")
(add-to-list 'ac-modes 'yatex-mode)
(add-hook 'yatex-mode-hook 'ac-l-setup)

