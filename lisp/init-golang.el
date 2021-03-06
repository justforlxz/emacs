;;(require 'go-mode)(add-hook 'before-save-hook 'gofmt-before-save)
;;(add-hook 'go-mode-hook '(lambda ()
;;  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
;;(add-hook 'go-mode-hook '(lambda ()
;;  (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
;;(add-hook 'go-mode-hook '(lambda ()
;;(local-set-key (kbd "C-c C-f") 'gofmt)))(add-hook 'before-save-hook 'gofmt-before-save)
;;(add-hook 'go-mode-hook '(lambda ()
;;  (local-set-key (kbd "C-c C-k") 'godoc)))
;;(add-hook 'go-mode-hook 'company-mode)(add-hook 'go-mode-hook (lambda ()  (set (make-local-variable 'company-backends) '(company-go))
;;  (company-mode)))

;;; init-go --- golang
;;; Commentary:
;; http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/
;; https://robinxiong.gitbooks.io/golang/content/section1/emacs.html
;; http://studygolang.com/topics/583

;;; Code:

(require-package 'go-mode)
(require-package 'company-go)

(require 'go-mode)

;; removes all unused imports
(add-hook 'go-mode-hook '(lambda() (local-set-key (kbd "C-c C-r")'go-remove-unused-imports)))

;; format the current buffer
(add-hook 'go-mode-hook '(lambda () (local-set-key (kbd "C-c C-f") 'gofmt)))

;; format the buffer when save
(add-hook 'before-save-hook 'gofmt-before-save)

;; show the go documentation for a given package
;; Note: godoc depends on the godoc utility.
;; It must be installed and on your $PATH.
;; To install it run: go get code.google.com/p/go.tools/cmd/godoc.
(add-hook 'go-mode-hook '(lambda() (local-set-key (kbd "C-c C-k") 'godoc)))

;; Gocode autocomplete
;;(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook '(lambda()
               (set (make-local-variable 'company-backends)'(company-go))
               (company-mode)))

;; Go oracle
;; Note: $GOPATH will defined in init-exec-path-from-shell
;;(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
;;(add-hook 'go-mode-hook 'go-oracle-mode)

(provide 'init-golang)