#lang racket/base

(require racket/string
         racket/system)

(provide squish-run)

(define (squish-run command)
  (cond
    ((string-contains? command "cd ")
      (if (directory-exists? (substring command 3))
          (current-directory (substring command 3))
          (displayln "Directory not found")))
    
    ((string-contains? command " & ")
      (system (substring command 0 2))
      (system (substring command 5)))

    ((equal? command "exit") (exit))
    (else (system command))))