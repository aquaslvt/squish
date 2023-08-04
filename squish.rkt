#lang racket

(provide squish-run)

(define (squish-run command)
  (cond
    ((string-contains? command "cd ")
     (if (directory-exists? (substring command 3))
         (current-directory (substring command 3))
         (displayln "Directory not found")))
    ((equal? command "exit") (exit))
    (else (system command))))