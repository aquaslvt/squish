#lang racket/base

(require racket/system)

(define (squish)
  (printf "┌ \033[36m~a\033[0m\n" (current-directory))
  (display "└ \033[33mλ \033[0m")
  (flush-output)
  
  (let ([x (read-line)])
    (cond
      ((equal? x "exit") (exit))
      (else (system x))
    ))
  (squish))

(squish)