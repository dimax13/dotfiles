;;; yasnippet and auto-complete

(defvar ac-yas-expand-autostart-backup nil "保存用")

(defun ac-yas-expand-start ()
  "yasnippet展開開始時にはACを止める"
  (setq ac-yas-expand-autostart-backup ac-auto-start)
  (setq ac-auto-start nil))

(defun ac-yas-expand-end ()
  "yasnippet展開終了時にACを再開させる"
  (setq ac-auto-start ac-yas-expand-autostart-backup))

(defun ac-yas-expand-install ()
  (interactive)
  (add-hook 'yas/before-expand-snippet-hook 'ac-yas-expand-start)
  (add-hook 'yas/after-exit-snippet-hook 'ac-yas-expand-end))

(defun ac-yas-expand-uninstall ()
  (interactive)
  (remove-hook 'yas/before-expand-snippet-hook 'ac-yas-expand-start)
  (remove-hook 'yas/after-exit-snippet-hook 'ac-yas-expand-end))

(ac-yas-expand-install)
