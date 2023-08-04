#lang racket

(provide squish-run)

(define (squish-run command)
    (cond
      ((equal? command "exit") (exit))
      (else (system command))
    ))