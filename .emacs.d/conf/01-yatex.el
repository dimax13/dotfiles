;================================================================
; YaTeX 
;================================================================
;; YaTeX-mode
;(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex")
(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp/yatex")
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
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


;;; auto-complete-yatex.el --- A YaTeX extention for Auto completion

;; Copyright (C) 2009  Munehiro Yamamoto

;; Author: Munehiro Yamamoto <munepixyz あっとまーく じーめーるどっとこむ>
;; Keywords: YaTeX LaTeX TeX 
;; Version: 0.2.0.2

;;; History:

;; 2008-03-04 Munehiro Yamamoto <munepixyz あっとまーく じーめーるどっとこむ>
;;
;;      * added original YaTeX keywords to ac-yatex-keywords
;;      * defvar ac-yatex-user-keywords
;;
;; 2008-03-01 Munehiro Yamamoto <munepixyz あっとまーく じーめーるどっとこむ>
;;
;;      * first release
;;

(require 'auto-complete)
(require 'yatex)
(require 'yatexadd)
;(require 'yatexmth)
;(require 'yatexpkg)
;(require 'yatexsec)

(defvar ac-yatex-user-keywords nil
  "a list of your YaTeX keywords")

(defconst ac-yatex-keywords 
  (sort 
   (append 
    ac-yatex-user-keywords
    ;; yatex.el
    section-table user-section-table tmp-section-table
    YaTeX-math-begin-list
    YaTeX-math-gathering-list
    env-table user-env-table tmp-env-table
    fontsize-table user-fontsize-table tmp-fontsize-table
    singlecmd-table user-singlecmd-table tmp-singlecmd-table

    ;; yatexadd.el
    YaTeX:style-parameters-default 
    YaTeX:style-parameters-private 
    YaTeX:style-parameters-local
    ;YaTeX:documentstyles-default
    ;YaTeX:documentstyles-private
    ;YaTeX:documentstyles-local
    ;YaTeX:documentstyle-options-default
    ;YaTeX:documentstyle-options-private
    ;YaTeX:documentstyle-options-local
    YaTeX:documentclass-options-default
    YaTeX:documentclass-options-private
    YaTeX:documentclass-options-local
    YaTeX:documentclasses-default
    YaTeX:documentclasses-private
    YaTeX:documentclasses-local
    YaTeX:latex2e-named-color-alist
    YaTeX:latex2e-basic-color-alist
    YaTeX::usepackage-alist-default
    YaTeX::usepackage-alist-private
    YaTeX::usepackage-alist-local

    ;; yatexmth.el
    ;YaTeX-math-sign-alist
    ;YaTeX-greek-key-alist

    ;; yatexpkg.el
    ;YaTeX-package-alist-default
    ;YaTeX-package-graphics-driver-alist
    ;YaTeX-package-alist-private
    
    ;; yatexsec.el
    ;YaTeX-sectioning-level
    ) #'(lambda (a b) (> (length a) (length b)))))

(defvar ac-source-yatex
  '((candidates
     . (lambda ()
	 (all-completions ac-target ac-yatex-keywords))))
  "Source for YaTeX keywords.")

(defun ac-yatex-setup ()
  (setq ac-modes (append ac-modes '(yatex-mode)))
  (setq ac-sources
	'(ac-source-yatex 
	  ac-source-abbrev 
	  ac-source-words-in-buffer 
	  ))
  )

(add-hook 'yatex-mode-hook 'ac-yatex-setup)

(provide 'auto-complete-yatex)