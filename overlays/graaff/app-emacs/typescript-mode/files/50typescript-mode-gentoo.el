
;;; typescript-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")

(autoload 'typescript-mode "typescript-mode" "Major mode for editing typescript." t)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(eval-after-load 'folding
  '(when (fboundp 'folding-add-to-marks-list)
     (folding-add-to-marks-list 'typescript-mode "// {{{" "// }}}" )))
