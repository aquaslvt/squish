#lang racket/base

(require "squish.rkt")

(define (prompt)
  (printf "┌ \033[35m~a\033[0m@\033[35m~a\033[0m \033[32m~a\033[0m ☯\n" 
    (getenv "USER")
    (getenv "HOSTNAME") 
    (regexp-replace #rx"/home/[^/]+" (path->string (current-directory)) "~"))
  
  (display "└ \033[33mλ \033[0m")
  (flush-output)
  (squish-run (read-line))

  (prompt))

(prompt)