;;; shell-from-here.el --- shell at the location of current buffer

;; Copyright (C) 2016 NGK Sternhagen

;; Author: NGK Sternhagen <sternhagen@protonmail.ch>
;; Version: 0.0.0
;; Keywords: shell
;; URL: https://gitlab.com/skwuent/shell-from-here

;;; Commentary:

;; This package is just a minor adaptation of code written by Tikhon Jelvis.
;; You can see his original code at https://github.com/tikhonjelvis/dotfiles


;;;###autoload
(defun shell-from-here ()
  "Open a new shell buffer with working directory corresponding to the current buffer,
  and set the prompt."
  (interactive)
  (let ((name (buffer-name (current-buffer))))
  (pop-to-buffer (concat "*" name "-shell*"))
  (unless (eq major-mode 'shell-mode)
    (shell (current-buffer))
    (sleep-for 0 200)
    (delete-region (point-min) (point-max))
    (comint-simple-send (get-buffer-process (current-buffer))
                        (concat "export PS1=\"\033[33m" name "\033[0m:\033[35m\\W\033[0m>\"")))));
