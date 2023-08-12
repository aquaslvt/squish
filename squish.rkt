#lang racket/base

(require racket/string
         racket/system
         racket/list
         shlex)

(provide squish-run)

(define (squish-error message)
  (eprintf "\033[31m!\033[30m ~a\033[0m" message)
  (newline))

(define (system-run command)
  (define parts (split command))
  (let ((executable-path (find-executable-path (car parts))))
    (when executable-path
      (apply system* executable-path (cdr parts)))))

(define (squish-run command)
  (cond
    ((regexp-match? #px"~> |cd " command)
     (if (directory-exists? (substring command 3))
         (current-directory (substring command 3))
         (squish-error "Directory not found")))

    ((string-contains? command "&")
     (define parts (regexp-split #px"&" command))
     (system-run (first parts))
     (system-run (last parts)))

    ((string-contains? command "->")
     (define parts (regexp-split #px"->" command))
     (system-run (string-append "mv " (first parts) " " (last parts))))

    ((equal? command "exit") (exit))
    (else (system-run command))))