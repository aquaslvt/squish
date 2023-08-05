#lang racket/base

(require racket/string
         racket/system
         racket/list)

(provide squish-run)

(define (squish-run command)
  (cond
    ((string-contains? command "cd ")
      (if (directory-exists? (substring command 3))
          (current-directory (substring command 3))
          (displayln "Directory not found")))
    
    ((string-contains? command "&")
      (define parts (regexp-split #px"&" command))
      (system (first parts))
      (system (second parts)))

    ((equal? command "exit") (exit))
    (else (system command))))