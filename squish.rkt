#lang racket/base

(require racket/system)

(system "clear")

(define (squish)
  (printf "┌ \033[36m~a\033[0m\n" (current-directory))
  (display "└ \033[33mλ \033[0m")
  (flush-output)
  (displayln (system (read-line)))
  (squish))

(squish)